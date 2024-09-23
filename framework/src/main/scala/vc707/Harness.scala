package framework.fpga.vc707

import chipyard.ExtTLMem
import chipyard.harness.HasHarnessInstantiators
import chisel3._
import freechips.rocketchip.diplomacy.{BundleBridgeSource, IdRange, LazyModule, LazyRawModuleImp}
import freechips.rocketchip.subsystem.SystemBusKey
import freechips.rocketchip.tilelink.{TLClientNode, TLMasterParameters, TLMasterPortParameters}
import org.chipsalliance.cde.config.Parameters
import sifive.blocks.devices.gpio.{GPIOPortIO, PeripheryGPIOKey}
import sifive.blocks.devices.spi.{PeripherySPIKey, SPIPortIO}
import sifive.blocks.devices.uart.{PeripheryUARTKey, UARTPortIO}
import sifive.fpgashells.clocks.{ClockGroup, ClockSinkNode, PLLFactoryKey, ResetWrangler}
import sifive.fpgashells.ip.xilinx.{IBUF, PowerOnResetFPGAOnly}
import sifive.fpgashells.shell.{ClockInputDesignInput, ClockInputOverlayKey, DDRDesignInput, DDROverlayKey, GPIODesignInput, GPIOOverlayKey, JTAGDebugDesignInput, JTAGDebugOverlayKey, SPIDesignInput, SPIOverlayKey, UARTDesignInput, UARTOverlayKey}

class VC707Harness(override implicit val p: Parameters) extends VC707ShellCustomOverlays { outer =>

  def dp = designParameters

  // place all clocks in the shell
  require(dp(ClockInputOverlayKey).size >= 1)
  val sysClkNode = dp(ClockInputOverlayKey).head.place(ClockInputDesignInput()).overlayOutput.node

  /*** Connect/Generate clocks ***/

  // connect to the PLL that will generate multiple clocks
  val harnessSysPLL = dp(PLLFactoryKey)()
  harnessSysPLL := sysClkNode

  // create and connect to the dutClock
  val dutFreqMHz = (dp(SystemBusKey).dtsFrequency.get / (1000 * 1000)).toInt
  val dutClock = ClockSinkNode(freqMHz = dutFreqMHz)
  println(s"VC707 FPGA Base Clock Freq: ${dutFreqMHz} MHz")
  val dutWrangler = LazyModule(new ResetWrangler)
  val dutGroup = ClockGroup()
  dutClock := dutWrangler.node := dutGroup := harnessSysPLL

  /*** JTAG ***/
  val jtagModule = dp(JTAGDebugOverlayKey).head.place(JTAGDebugDesignInput()).overlayOutput.jtag

  /*** UART ***/
  val io_uart_bb = BundleBridgeSource(() => (new UARTPortIO(dp(PeripheryUARTKey).head)))
  dp(UARTOverlayKey).head.place(UARTDesignInput(io_uart_bb))

  /*** SPI ***/
  val io_spi_bb = BundleBridgeSource(() => (new SPIPortIO(dp(PeripherySPIKey).head)))
  dp(SPIOverlayKey).head.place(SPIDesignInput(dp(PeripherySPIKey).head, io_spi_bb))

  /*** GPIO ***/
  val io_gpio_bb = dp(PeripheryGPIOKey).map(p => BundleBridgeSource(() => (new GPIOPortIO(p))))
  (dp(GPIOOverlayKey) zip dp(PeripheryGPIOKey)).zipWithIndex.map { case ((placer, params), i) =>
    placer.place(GPIODesignInput(params, io_gpio_bb(i)))
  }

  /*** DDR ***/
  // Modify the last field of `DDRDesignInput` for 1GB RAM size
  // val ddrNode = dp(DDROverlayKey).head.place(DDRDesignInput(dp(ExtTLMem).get.master.base, dutWrangler.node, harnessSysPLL, true)).overlayOutput.ddr
  // val ddrClient = TLClientNode(Seq(TLMasterPortParameters.v1(Seq(TLMasterParameters.v1(
  //   name = "chip_ddr",
  //   sourceId = IdRange(0, 1 << dp(ExtTLMem).get.master.idBits)
  // )))))

  // ddrNode := ddrClient

  /*** Module implementation ***/
  override lazy val module = new VC707HarnessImp(this)
}

class VC707HarnessImp(_outer: VC707Harness) extends LazyRawModuleImp(_outer) with HasHarnessInstantiators {
  val vc707Outer = _outer

  val reset = IO(Input(Bool()))
  _outer.xdc.addBoardPin(reset, "reset")

  val resetIBUF = Module(new IBUF)
  resetIBUF.io.I := reset

  val sysclk: Clock = _outer.sysClkNode.out.head._1.clock

  val powerOnReset: Bool = PowerOnResetFPGAOnly(sysclk)
  _outer.sdc.addAsyncPath(Seq(powerOnReset))

//  val ereset: Bool = _outer.chiplink.get() match {
//    case Some(x: ChipLinkVC707PlacedOverlay) => !x.ereset_n
//    case _ => false.B
//  }

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
