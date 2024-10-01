package framework.fpga.arty100t

import chisel3.Clock
import freechips.rocketchip.diplomacy.{AddressSet, BundleBridgeSource, InModuleBody, LazyModule, ValName}
import org.chipsalliance.cde.config.Field
import sifive.fpgashells.clocks.{ClockGroup, ClockSinkNode, ClockSinkParameters, ClockSourceNode}
import sifive.fpgashells.devices.xilinx.xilinxarty100tmig.{XilinxArty100TMIG, XilinxArty100TMIGPads, XilinxArty100TMIGParams}
import sifive.fpgashells.shell.xilinx.{GPIOXilinxPlacedOverlay, JTAGDebugXilinxPlacedOverlay, LEDXilinxPlacedOverlay, SDIOXilinxPlacedOverlay, SPIFlashXilinxPlacedOverlay, MySPIFlashPlacedOverlay, SingleEndedClockInputXilinxPlacedOverlay, UARTXilinxPlacedOverlay}
import sifive.fpgashells.shell.{CTSResetDesignInput, CTSResetPlacedOverlay, CTSResetShellInput, CTSResetShellPlacer, ClockInputDesignInput, ClockInputShellInput, ClockInputShellPlacer, DDRDesignInput, DDROverlayOutput, DDRPlacedOverlay, DDRShellInput, DDRShellPlacer, GPIODesignInput, GPIOShellInput, GPIOShellPlacer, IOPin, JTAGDebugDesignInput, JTAGDebugShellInput, JTAGDebugShellPlacer, LEDDesignInput, LEDShellInput, LEDShellPlacer, SPIDesignInput, SPIFlashDesignInput, SPIFlashShellInput, SPIFlashShellPlacer, SPIShellInput, SPIShellPlacer, UARTDesignInput, UARTShellInput, UARTShellPlacer}

/* =============================================================
============================ Clock =============================
===============================================================*/
class SysClockArtyPlacedOverlay(val shell: Arty100TShellCustomOverlays, name: String, val designInput: ClockInputDesignInput, val shellInput: ClockInputShellInput)
  extends SingleEndedClockInputXilinxPlacedOverlay(name, designInput, shellInput)
{
  val node = shell { ClockSourceNode(freqMHz = 100, jitterPS = 50) }

  shell { InModuleBody {
    val clk: Clock = io
    shell.xdc.addPackagePin(clk, "E3")
    shell.xdc.addIOStandard(clk, "LVCMOS33")
  } }
}
class SysClockArtyShellPlacer(val shell: Arty100TShellCustomOverlays, val shellInput: ClockInputShellInput)(implicit val valName: ValName)
  extends ClockInputShellPlacer[Arty100TShellCustomOverlays] {
  def place(designInput: ClockInputDesignInput) = new SysClockArtyPlacedOverlay(shell, valName.name, designInput, shellInput)
}

/* =============================================================
============================ DDR =============================
===============================================================*/
case object ArtyDDRSize extends Field[BigInt](0x10000000L * 1) // 256 MB
class DDRArtyPlacedOverlay(val shell: Arty100TShellCustomOverlays, name: String, val designInput: DDRDesignInput, val shellInput: DDRShellInput)
  extends DDRPlacedOverlay[XilinxArty100TMIGPads](name, designInput, shellInput)
{
  val size = p(ArtyDDRSize)

  val ddrClk1 = shell { ClockSinkNode(freqMHz = 166.666)}
  val ddrClk2 = shell { ClockSinkNode(freqMHz = 200)}
  val ddrGroup = shell { ClockGroup() }
  ddrClk1 := di.wrangler := ddrGroup := di.corePLL
  ddrClk2 := di.wrangler := ddrGroup

  val migParams = XilinxArty100TMIGParams(address = AddressSet.misaligned(di.baseAddress, size))
  val mig = LazyModule(new XilinxArty100TMIG(migParams))
  val ioNode = BundleBridgeSource(() => mig.module.io.cloneType)
  val topIONode = shell { ioNode.makeSink() }
  val ddrUI     = shell { ClockSourceNode(freqMHz = 100) }
  val areset    = shell { ClockSinkNode(Seq(ClockSinkParameters())) }
  areset := di.wrangler := ddrUI

  def overlayOutput = DDROverlayOutput(ddr = mig.node)
  def ioFactory = new XilinxArty100TMIGPads(size)

  InModuleBody { ioNode.bundle <> mig.module.io }

  shell { InModuleBody {
    require (shell.sys_clock.get.isDefined, "Use of DDRArtyPlacedOverlay depends on SysClockArtyPlacedOverlay")
    val (sys, _) = shell.sys_clock.get.get.overlayOutput.node.out(0)
    val (ui, _) = ddrUI.out(0)
    val (dclk1, _) = ddrClk1.in(0)
    val (dclk2, _) = ddrClk2.in(0)
    val (ar, _) = areset.in(0)
    val port = topIONode.bundle.port

    io <> port
    ui.clock := port.ui_clk
    ui.reset := !port.mmcm_locked || port.ui_clk_sync_rst
    port.sys_clk_i := dclk1.clock.asUInt
    port.clk_ref_i := dclk2.clock.asUInt
    port.sys_rst := shell.pllReset
    port.aresetn := !ar.reset
  } }

  shell.sdc.addGroup(clocks = Seq("clk_pll_i"), pins = Seq(mig.island.module.blackbox.io.ui_clk))
}
class DDRArtyShellPlacer(val shell: Arty100TShellCustomOverlays, val shellInput: DDRShellInput)(implicit val valName: ValName)
  extends DDRShellPlacer[Arty100TShellCustomOverlays] {
  def place(designInput: DDRDesignInput) = new DDRArtyPlacedOverlay(shell, valName.name, designInput, shellInput)
}

/* =============================================================
============================ CTS =============================
===============================================================*/
class CTSResetArtyPlacedOverlay(val shell: Arty100TShellCustomOverlays, name: String, val designInput: CTSResetDesignInput, val shellInput: CTSResetShellInput)
  extends CTSResetPlacedOverlay(name, designInput, shellInput)
class CTSResetArtyShellPlacer(val shell: Arty100TShellCustomOverlays, val shellInput: CTSResetShellInput)(implicit val valName: ValName)
  extends CTSResetShellPlacer[Arty100TShellCustomOverlays] {
  def place(designInput: CTSResetDesignInput) = new CTSResetArtyPlacedOverlay(shell, valName.name, designInput, shellInput)
}

/* =============================================================
======================= UART =============================
===============================================================*/
class UARTArtyPlacedOverlay(val shell: Arty100TShellCustomOverlays, name: String, val designInput: UARTDesignInput, val shellInput: UARTShellInput)
  extends UARTXilinxPlacedOverlay(name, designInput, shellInput, false)
{
  shell { InModuleBody {
    val packagePinsWithPackageIOs = Seq(
      ("A9", IOPin(io.rxd)),
      ("D10", IOPin(io.txd)))

    packagePinsWithPackageIOs foreach { case (pin, io) => {
      shell.xdc.addPackagePin(io, pin)
      shell.xdc.addIOStandard(io, "LVCMOS33")
      shell.xdc.addIOB(io)
    } }
  } }
}
class UARTArtyShellPlacer(val shell: Arty100TShellCustomOverlays, val shellInput: UARTShellInput)(implicit val valName: ValName)
  extends UARTShellPlacer[Arty100TShellCustomOverlays] {
  def place(designInput: UARTDesignInput) = new UARTArtyPlacedOverlay(shell, valName.name, designInput, shellInput)
}

// JD
class UART2ArtyPlacedOverlay(val shell: Arty100TShellCustomOverlays, name: String, val designInput: UARTDesignInput, val shellInput: UARTShellInput)
  extends UARTXilinxPlacedOverlay(name, designInput, shellInput, false)
{
  shell { InModuleBody {
    val packagePinsWithPackageIOs = Seq(
      ("D2", IOPin(io.rxd)),
      ("H2", IOPin(io.txd)))

    packagePinsWithPackageIOs foreach { case (pin, io) => {
      shell.xdc.addPackagePin(io, pin)
      shell.xdc.addIOStandard(io, "LVCMOS33")
      shell.xdc.addIOB(io)
    } }
  } }
}
class UART2ArtyShellPlacer(val shell: Arty100TShellCustomOverlays, val shellInput: UARTShellInput)(implicit val valName: ValName)
  extends UARTShellPlacer[Arty100TShellCustomOverlays] {
  def place(designInput: UARTDesignInput) = new UART2ArtyPlacedOverlay(shell, valName.name, designInput, shellInput)
}

/* =============================================================
======================== SDIO (JA) =============================
===============================================================*/
class SDIOArtyPlacedOverlay(val shell: Arty100TShellCustomOverlays, name: String, val designInput: SPIDesignInput, val shellInput: SPIShellInput)
  extends SDIOXilinxPlacedOverlay(name, designInput, shellInput)
{
  shell { InModuleBody {
    val packagePinsWithPackageIOs = Seq(("D12", IOPin(io.spi_clk)),
      ("B11", IOPin(io.spi_cs)),
      ("A11", IOPin(io.spi_dat(0))),
      ("D13", IOPin(io.spi_dat(1))),
      ("B18", IOPin(io.spi_dat(2))),
      ("G13", IOPin(io.spi_dat(3))))

    packagePinsWithPackageIOs foreach { case (pin, io) => {
      shell.xdc.addPackagePin(io, pin)
      shell.xdc.addIOStandard(io, "LVCMOS33")
      shell.xdc.addIOB(io)
    } }
    packagePinsWithPackageIOs drop 1 foreach { case (pin, io) => {
      shell.xdc.addPullup(io)
    } }
  } }
}
class SDIOArtyShellPlacer(val shell: Arty100TShellCustomOverlays, val shellInput: SPIShellInput)(implicit val valName: ValName)
  extends SPIShellPlacer[Arty100TShellCustomOverlays] {
  def place(designInput: SPIDesignInput) = new SDIOArtyPlacedOverlay(shell, valName.name, designInput, shellInput)
}

/* =============================================================
======================= Flash (JB) =============================
===============================================================*/
class SPIFlashArtyPlacedOverlay(val shell: Arty100TShellCustomOverlays, name: String, val designInput: SPIFlashDesignInput, val shellInput: SPIFlashShellInput)
  extends MySPIFlashPlacedOverlay(name, designInput, shellInput)
{

  shell { InModuleBody {
    val packagePinsWithPackageIOs = Seq(
      ("E15", IOPin(io.qspi_cs)),     // JB0
      ("E16", IOPin(io.qspi_dq(0))),  // JB1
      ("D15", IOPin(io.qspi_dq(1))),  // JB2
      ("C15", IOPin(io.qspi_sck)),    // JB3
      ("K15", IOPin(io.qspi_dq(2))),  // JB6
      ("J15", IOPin(io.qspi_dq(3))))  // JB7

    packagePinsWithPackageIOs foreach { case (pin, io) => {
      shell.xdc.addPackagePin(io, pin)
      shell.xdc.addIOStandard(io, "LVCMOS33")
    } }
    packagePinsWithPackageIOs drop 1 foreach { case (pin, io) => {
      shell.xdc.addPullup(io)
    } }
  } }
}
class SPIFlashArtyShellPlacer(val shell: Arty100TShellCustomOverlays, val shellInput: SPIFlashShellInput)(implicit val valName: ValName)
  extends SPIFlashShellPlacer[Arty100TShellCustomOverlays] {
  def place(designInput: SPIFlashDesignInput) = new SPIFlashArtyPlacedOverlay(shell, valName.name, designInput, shellInput)
}

/* =============================================================
======================== JTAG (JD) =============================
===============================================================*/
// PMOD JD used for JTAG
class JTAGDebugArtyPlacedOverlay(val shell: Arty100TShellCustomOverlays, name: String, val designInput: JTAGDebugDesignInput, val shellInput: JTAGDebugShellInput)
  extends JTAGDebugXilinxPlacedOverlay(name, designInput, shellInput)
{
  shell { InModuleBody {
    shell.sdc.addClock("JTCK", IOPin(io.jtag_TCK), 10)
    shell.sdc.addGroup(clocks = Seq("JTCK"))
    shell.xdc.clockDedicatedRouteFalse(IOPin(io.jtag_TCK))
    val packagePinsWithPackageIOs = Seq(
      ("D4", IOPin(io.jtag_TDI)),  //pin JD-3
      ("D3", IOPin(io.jtag_TMS)),  //pin JD-0
      ("F4", IOPin(io.jtag_TCK)),  //pin JD-1
      ("F3", IOPin(io.jtag_TDO)),  //pin JD-2
      ("E2", IOPin(io.srst_n)))

    packagePinsWithPackageIOs foreach { case (pin, io) => {
      shell.xdc.addPackagePin(io, pin)
      shell.xdc.addIOStandard(io, "LVCMOS33")
      shell.xdc.addPullup(io)
    } }
  } }
}
class JTAGDebugArtyShellPlacer(val shell: Arty100TShellCustomOverlays, val shellInput: JTAGDebugShellInput)(implicit val valName: ValName)
  extends JTAGDebugShellPlacer[Arty100TShellCustomOverlays] {
  def place(designInput: JTAGDebugDesignInput) = new JTAGDebugArtyPlacedOverlay(shell, valName.name, designInput, shellInput)
}

/* =============================================================
========================= GPIO =================================
===============================================================*/
class GPIOArtyPlacedOverlay(val shell: Arty100TShellCustomOverlays,
                               name: String,
                               val designInput: GPIODesignInput,
                               val shellInput: GPIOShellInput)
  extends GPIOXilinxPlacedOverlay(name, designInput, shellInput)
{
  shell { InModuleBody {
    val gpioLocations = List("A8", "C11", "C10", "A10", // Switches
                            "E1", "F6", "G6", "G4",     // RGB LEDs
                            "J4", "G3", "H4", "J2",
                            "J3", "K2", "H6", "K1",
                            "H5", "J5", "T9", "T10",    // LEDs
                            "D9", "C9", "B9", "B8")     // Buttons
    val iosWithLocs = io.gpio.zip(gpioLocations)
    val packagePinsWithPackageIOs = iosWithLocs.map { case (io, pin) => (pin, IOPin(io)) }

    packagePinsWithPackageIOs foreach { case (pin, io) => {
      shell.xdc.addPackagePin(io, pin)
      shell.xdc.addIOStandard(io, "LVCMOS33")
      shell.xdc.addIOB(io)
    } }
  } }
}
class GPIOArtyShellPlacer(val shell: Arty100TShellCustomOverlays,
                             val shellInput: GPIOShellInput)(implicit val valName: ValName)
  extends GPIOShellPlacer[Arty100TShellCustomOverlays] {
  def place(designInput: GPIODesignInput) = new GPIOArtyPlacedOverlay(shell, valName.name, designInput, shellInput)
}
