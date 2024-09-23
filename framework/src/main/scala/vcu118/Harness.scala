package framework.fpga.vcu118

import chipyard.ExtTLMem
import chipyard.harness.HasHarnessInstantiators
import chisel3._
import freechips.rocketchip.diplomacy.{BundleBridgeSource, IdRange, LazyModule, LazyRawModuleImp}
import freechips.rocketchip.subsystem.SystemBusKey
import freechips.rocketchip.tilelink.{TLBlockDuringReset, TLClientNode, TLMasterParameters, TLMasterPortParameters}
import org.chipsalliance.cde.config.Parameters
import sifive.blocks.devices.spi.{PeripherySPIKey, SPIPortIO}
import sifive.blocks.devices.uart.{PeripheryUARTKey, UARTParams, UARTPortIO}
import sifive.fpgashells.clocks.{ClockGroup, ClockSinkNode, PLLFactoryKey, ResetWrangler}
import sifive.fpgashells.ip.xilinx.{IBUF, PowerOnResetFPGAOnly}
import sifive.fpgashells.shell.{ClockInputDesignInput, ClockInputOverlayKey, DDRDesignInput, DDROverlayKey, JTAGDebugDesignInput, JTAGDebugOverlayKey, SPIDesignInput, SPIOverlayKey, UARTDesignInput, UARTOverlayKey}
import sifive.blocks.devices.gpio.PeripheryGPIOKey
import sifive.blocks.devices.gpio.GPIOPortIO
import sifive.fpgashells.shell.GPIOOverlayKey
import sifive.fpgashells.shell.GPIODesignInput

class VCU118Harness(override implicit val p: Parameters) extends VCU118ShellCustomOverlays {
  def dp = designParameters

  /*** Connect/Generate clocks ***/
  require(dp(ClockInputOverlayKey).size >= 1)
  val clockOverlay = dp(ClockInputOverlayKey).head.place(ClockInputDesignInput())
  val sysClkNode = clockOverlay.overlayOutput.node
  // connect to the PLL that will generate multiple clocks
  val harnessSysPLL = dp(PLLFactoryKey)
  val harnessSysPLLNode = harnessSysPLL()
  harnessSysPLLNode := sysClkNode
  // create and connect to the dutClock
  val dutFreqMHz = (dp(SystemBusKey).dtsFrequency.get / (1000 * 1000)).toInt
  val dutClock = ClockSinkNode(freqMHz = dutFreqMHz)
  println(s"VCU118 FPGA Base Clock Freq: ${dutFreqMHz} MHz")
  val dutWrangler = LazyModule(new ResetWrangler)
  val dutGroup = ClockGroup()
  dutClock := dutWrangler.node := dutGroup := harnessSysPLLNode

  /*** JTAG ***/
  val jtagModule = dp(JTAGDebugOverlayKey).head.place(JTAGDebugDesignInput()).overlayOutput.jtag

  /*** UART ***/
  val io_uart_bb = BundleBridgeSource(() => new UARTPortIO(dp(PeripheryUARTKey).headOption.getOrElse(UARTParams(0))))
  val uartModule = dp(UARTOverlayKey).head.place(UARTDesignInput(io_uart_bb))

  /*** SPI ***/
  val io_spi_bb = BundleBridgeSource(() => (new SPIPortIO(dp(PeripherySPIKey).head)))
  val sdModule = dp(SPIOverlayKey).head.place(SPIDesignInput(dp(PeripherySPIKey).head, io_spi_bb))

  /*** GPIO ***/
  val io_gpio_bb = dp(PeripheryGPIOKey).map(p => BundleBridgeSource(() => (new GPIOPortIO(p))))
  (dp(GPIOOverlayKey) zip dp(PeripheryGPIOKey)).zipWithIndex.map { case ((placer, params), i) =>
    placer.place(GPIODesignInput(params, io_gpio_bb(i)))
  }

  /*** DDR ***/
  // val ddrOverlay = dp(DDROverlayKey).head.place(DDRDesignInput(dp(ExtTLMem).get.master.base, dutWrangler.node, harnessSysPLLNode, true)).asInstanceOf[DDRVCU118PlacedOverlay]
  // val ddrClient = TLClientNode(Seq(TLMasterPortParameters.v1(Seq(TLMasterParameters.v1(
  //   name = "chip_ddr",
  //   sourceId = IdRange(0, 1 << dp(ExtTLMem).get.master.idBits)
  // )))))
  // val ddrBlockDuringReset = LazyModule(new TLBlockDuringReset(4))
  // ddrOverlay.overlayOutput.ddr := ddrBlockDuringReset.node := ddrClient

  /*** Module implementation ***/
  override lazy val module = new VCU118HarnessImp(this)

}

class VCU118HarnessImp(_outer: VCU118Harness) extends LazyRawModuleImp(_outer) with HasHarnessInstantiators {
  val vcu118Outer = _outer

  val reset = IO(Input(Bool()))
  _outer.xdc.addPackagePin(reset, "L19")
  _outer.xdc.addIOStandard(reset, "LVCMOS12")

  val resetIBUF = Module(new IBUF)
  resetIBUF.io.I := reset

  val sysclk: Clock = _outer.sysClkNode.out.head._1.clock

  val powerOnReset: Bool = PowerOnResetFPGAOnly(sysclk)
  _outer.sdc.addAsyncPath(Seq(powerOnReset))

  _outer.pllReset := (resetIBUF.io.O || powerOnReset)

  // reset setup
  val hReset = Wire(Reset())
  hReset := _outer.dutClock.in.head._1.reset

  def referenceClockFreqMHz = _outer.dutFreqMHz
  def referenceClock = _outer.dutClock.in.head._1.clock
  def referenceReset = hReset
  def success = { require(false, "Unused"); false.B }

  childClock := referenceClock
  childReset := referenceReset

  instantiateChipTops()
}
