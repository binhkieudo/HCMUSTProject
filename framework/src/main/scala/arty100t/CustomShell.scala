package framework.fpga.arty100t

import chisel3.{Bool, Wire}
import freechips.rocketchip.diplomacy.{InModuleBody, ValName}
import org.chipsalliance.cde.config.Parameters
import sifive.fpgashells.shell.xilinx.Series7Shell
import sifive.fpgashells.shell.{ClockInputOverlayKey, 
  ClockInputShellInput, 
  DDROverlayKey, 
  DDRShellInput, 
  GPIOOverlayKey, 
  GPIOShellInput, 
  JTAGDebugOverlayKey, 
  JTAGDebugShellInput, 
  SPIOverlayKey, 
  SPIShellInput,
  SPIFlashOverlayKey,
  SPIFlashShellInput,
  UARTOverlayKey, 
  UARTShellInput}

abstract class Arty100TShellCustomOverlays()(implicit p: Parameters) extends Series7Shell {
  // System
  val pllReset = InModuleBody { Wire(Bool()) }
  val sys_clock = Overlay(ClockInputOverlayKey, new SysClockArtyShellPlacer(this, ClockInputShellInput()))

  // Peripheries
  val ddr   = Overlay(DDROverlayKey, new DDRArtyShellPlacer(this, DDRShellInput()))
  val jtag  = Overlay(JTAGDebugOverlayKey, new JTAGDebugArtyShellPlacer(this, JTAGDebugShellInput()))
  val uart  = Overlay(UARTOverlayKey, new UARTArtyShellPlacer(this, UARTShellInput()))
  val uart2  = Overlay(UARTOverlayKey, new UART2ArtyShellPlacer(this, UARTShellInput()))
  val sdio  = Overlay(SPIOverlayKey, new SDIOArtyShellPlacer(this, SPIShellInput())(valName = ValName(s"sdio")))
  val flash = Overlay(SPIFlashOverlayKey, new SPIFlashArtyShellPlacer(this, SPIFlashShellInput())(valName = ValName(s"flash")))
  val gpio  = Seq.tabulate(24)(i => {Overlay(GPIOOverlayKey, new GPIOArtyShellPlacer(this, GPIOShellInput()))})
}
