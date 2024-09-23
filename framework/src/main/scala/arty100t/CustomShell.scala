package framework.fpga.arty100t

import chisel3.{Bool, Wire}
import freechips.rocketchip.diplomacy.InModuleBody
import org.chipsalliance.cde.config.Parameters
import sifive.fpgashells.shell.xilinx.Series7Shell
import sifive.fpgashells.shell.{ClockInputOverlayKey, ClockInputShellInput, DDROverlayKey, DDRShellInput, GPIOOverlayKey, GPIOShellInput, JTAGDebugOverlayKey, JTAGDebugShellInput, SPIOverlayKey, SPIShellInput, UARTOverlayKey, UARTShellInput}

abstract class Arty100TShellCustomOverlays()(implicit p: Parameters) extends Series7Shell {
  // System
  val pllReset = InModuleBody { Wire(Bool()) }
  val sys_clock = Overlay(ClockInputOverlayKey, new SysClockArtyShellPlacer(this, ClockInputShellInput()))

  // Peripheries
  val ddr   = Overlay(DDROverlayKey, new DDRArtyShellPlacer(this, DDRShellInput()))
  val jtag  = Overlay(JTAGDebugOverlayKey, new JTAGDebugArtyShellPlacer(this, JTAGDebugShellInput()))
  val uart  = Overlay(UARTOverlayKey, new UARTArtyShellPlacer(this, UARTShellInput()))
  val sdio  = Overlay(SPIOverlayKey, new SDIOArtyShellPlacer(this, SPIShellInput()))
//  val spi_flash = Overlay(SPIFlashOverlayKey, new SPIFlashArtyShellPlacer(this, SPIFlashShellInput()))
  val gpio  = Seq.tabulate(24)(i => {Overlay(GPIOOverlayKey, new GPIOArtyShellPlacer(this, GPIOShellInput()))})
}
