package framework.fpga.vcu118

import chisel3.{Bool, Clock, Input, Module, Wire}
import freechips.rocketchip.diplomacy.{InModuleBody, LazyModule, LazyRawModuleImp, ValName}
import org.chipsalliance.cde.config.Parameters
import sifive.fpgashells.ip.xilinx.{IBUF, PowerOnResetFPGAOnly}
import sifive.fpgashells.shell.xilinx.UltraScaleShell
import sifive.fpgashells.shell.{ClockInputDesignInput, ClockInputOverlayKey, ClockInputShellInput, DDROverlayKey, DDRShellInput, DesignKey, JTAGDebugOverlayKey, JTAGDebugShellInput, LEDOverlayKey, LEDShellInput, SPIOverlayKey, SPIShellInput, UARTOverlayKey, UARTShellInput}
import sifive.fpgashells.shell.GPIOOverlayKey
import sifive.fpgashells.shell.GPIOShellInput
import sifive.fpgashells.shell.SPIFlashOverlayKey
import sifive.fpgashells.shell.SPIFlashShellInput

abstract class VCU118ShellCustomOverlays()(implicit p: Parameters) extends UltraScaleShell {
  // System
  val pllReset = InModuleBody { Wire(Bool()) }
  val sys_clock = Overlay(ClockInputOverlayKey, new SysClockVCU118ShellPlacer(this, ClockInputShellInput()))

  // Peripheries
  val ddr       = Overlay(DDROverlayKey, new DDRVCU118ShellPlacer(this, DDRShellInput()))
  val gpio      = Seq.tabulate(8)(i => {Overlay(GPIOOverlayKey, new GPIOVCU118ShellPlacer(this, GPIOShellInput()))}) 
  val jtag      = Overlay(JTAGDebugOverlayKey, new JTAGDebugVCU118ShellPlacer(this, JTAGDebugShellInput()))
  val uart      = Overlay(UARTOverlayKey, new UARTVCU118ShellPlacer(this, UARTShellInput()))
  // val spi       = Seq(
  //   Overlay(SPIOverlayKey, new SDIOVCU118ShellPlacer(this, SPIShellInput())(valName = ValName(s"sdio_"))),
  //   Overlay(SPIOverlayKey, new SPIFlashVCU118ShellPlacer(this, SPIShellInput())(valName = ValName(s"flash_")))
  // )
  val sdio      = Overlay(SPIOverlayKey, new SDIOVCU118ShellPlacer(this, SPIShellInput())(valName = ValName(s"sdio_")))
  // val flash     = Overlay(SPIOverlayKey, new SPIFlashVCU118ShellPlacer(this, SPIShellInput())(valName = ValName(s"flash")))
}

class VCU118CustomShell()(implicit p: Parameters) extends VCU118ShellCustomOverlays {
  val resetPin = InModuleBody { Wire(Bool()) }
  // PLL reset causes


  val topDesign = LazyModule(p(DesignKey)(designParameters))

  // Place the sys_clock at the Shell if the user didn't ask for it
  p(ClockInputOverlayKey).foreach(_.place(ClockInputDesignInput()))

  override lazy val module = new Impl
  class Impl extends LazyRawModuleImp(this) {
    val reset = IO(Input(Bool()))
    // clearly defined instead of BoardPin
    xdc.addPackagePin(reset, "L19")
    xdc.addIOStandard(reset, "LVCMOS12")

    val reset_ibuf = Module(new IBUF)
    reset_ibuf.io.I := reset

    val sysclk: Clock = sys_clock.get() match {
      case Some(x: SysClockVCU118PlacedOverlay) => x.clock
    }
    val powerOnReset = PowerOnResetFPGAOnly(sysclk)
    sdc.addAsyncPath(Seq(powerOnReset))

    resetPin := reset_ibuf.io.O

    pllReset := reset_ibuf.io.O || powerOnReset
  }
}