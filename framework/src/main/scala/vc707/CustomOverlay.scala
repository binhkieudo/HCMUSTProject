package framework.fpga.vc707

import freechips.rocketchip.diplomacy.{AddressSet, BundleBridgeSource, InModuleBody, LazyModule, ValName}
import org.chipsalliance.cde.config.Field
import sifive.fpgashells.clocks.{ClockSinkNode, ClockSinkParameters, ClockSourceNode}
import sifive.fpgashells.devices.xilinx.xilinxvc707mig.{XilinxVC707MIG, XilinxVC707MIGPads, XilinxVC707MIGParams}
import sifive.fpgashells.shell.xilinx._
import sifive.fpgashells.shell.{GPIODesignInput, GPIOShellInput, GPIOShellPlacer, ClockInputDesignInput, ClockInputShellInput, ClockInputShellPlacer, DDRDesignInput, DDROverlayOutput, DDRPlacedOverlay, DDRShellInput, DDRShellPlacer, IOPin, JTAGDebugDesignInput, JTAGDebugShellInput, JTAGDebugShellPlacer, LEDDesignInput, LEDShellInput, LEDShellPlacer, SPIDesignInput, SPIShellInput, SPIShellPlacer, UARTDesignInput, UARTShellInput, UARTShellPlacer}

/* =============================================================
============================ Clock =============================
===============================================================*/
class SysClockVC707PlacedOverlay(val shell: VC707ShellCustomOverlays, name: String, val designInput: ClockInputDesignInput, val shellInput: ClockInputShellInput)
  extends LVDSClockInputXilinxPlacedOverlay(name, designInput, shellInput)
{
  val node = shell { ClockSourceNode(freqMHz = 200, jitterPS = 50)(ValName(name)) }

  shell { InModuleBody {
    shell.xdc.addBoardPin(io.p, "clk_p")
    shell.xdc.addBoardPin(io.n, "clk_n")
  } }
}
class SysClockVC707ShellPlacer(val shell: VC707ShellCustomOverlays, val shellInput: ClockInputShellInput)(implicit val valName: ValName)
  extends ClockInputShellPlacer[VC707ShellCustomOverlays] {
  def place(designInput: ClockInputDesignInput) = new SysClockVC707PlacedOverlay(shell, valName.name, designInput, shellInput)
}

/* =============================================================
============================ DDR =============================
===============================================================*/
case object VC7071GDDRSize extends Field[BigInt](0x40000000L * 1) // 1GB
class DDRVC707PlacedOverlay(val shell: VC707ShellCustomOverlays, name: String, val designInput: DDRDesignInput, val shellInput: DDRShellInput)
  extends DDRPlacedOverlay[XilinxVC707MIGPads](name, designInput, shellInput)
{
  val size = p(VC7071GDDRSize)

  val migParams = XilinxVC707MIGParams(address = AddressSet.misaligned(di.baseAddress, size))
  val mig = LazyModule(new XilinxVC707MIG(migParams))
  val ioNode = BundleBridgeSource(() => mig.module.io.cloneType)
  val topIONode = shell { ioNode.makeSink() }
  val ddrUI     = shell { ClockSourceNode(freqMHz = 200) }
  val areset    = shell { ClockSinkNode(Seq(ClockSinkParameters())) }
  areset := designInput.wrangler := ddrUI

  def overlayOutput = DDROverlayOutput(ddr = mig.node)
  def ioFactory = new XilinxVC707MIGPads(size)

  InModuleBody { ioNode.bundle <> mig.module.io }

  shell { InModuleBody {
    require (shell.sys_clock.get.isDefined, "Use of DDRVC707PlacedOverlay depends on SysClockVC707PlacedOverlay")
    val (sys, _) = shell.sys_clock.get.get.overlayOutput.node.out(0)
    val (ui, _) = ddrUI.out(0)
    val (ar, _) = areset.in(0)
    val port = topIONode.bundle.port
    io <> port
    ui.clock := port.ui_clk
    ui.reset := !port.mmcm_locked || port.ui_clk_sync_rst
    port.sys_clk_i := sys.clock.asUInt
    port.sys_rst := sys.reset // pllReset
    port.aresetn := !ar.reset
  } }

  shell.sdc.addGroup(clocks = Seq("clk_pll_i"))
}
class DDRVC707ShellPlacer(val shell: VC707ShellCustomOverlays, val shellInput: DDRShellInput)(implicit val valName: ValName)
  extends DDRShellPlacer[VC707ShellCustomOverlays] {
  def place(designInput: DDRDesignInput) = new DDRVC707PlacedOverlay(shell, valName.name, designInput, shellInput)
}

/* =============================================================
======================= LED Status =============================
===============================================================*/
class LEDVC707PlacedOverlay(val shell: VC707ShellCustomOverlays, name: String, val designInput: LEDDesignInput, val shellInput: LEDShellInput)
  extends LEDXilinxPlacedOverlay(name, designInput, shellInput, boardPin = Some(s"leds_8bits_tri_o_${shellInput.number}"))
class LEDVC707ShellPlacer(val shell: VC707ShellCustomOverlays, val shellInput: LEDShellInput)(implicit val valName: ValName)
  extends LEDShellPlacer[VC707ShellCustomOverlays] {
  def place(designInput: LEDDesignInput) = new LEDVC707PlacedOverlay(shell, valName.name, designInput, shellInput)
}

/* =============================================================
======================= UART ===================================
===============================================================*/
class UARTVC707PlacedOverlay(val shell: VC707ShellCustomOverlays, name: String, val designInput: UARTDesignInput, val shellInput: UARTShellInput)
  extends UARTXilinxPlacedOverlay(name, designInput, shellInput, true)
{
  shell { InModuleBody {
    val packagePinsWithPackageIOs = Seq(("AT32", IOPin(io.ctsn.get)),
      ("AR34", IOPin(io.rtsn.get)),
      ("AU33", IOPin(io.rxd)),
      ("AU36", IOPin(io.txd)))

    packagePinsWithPackageIOs foreach { case (pin, io) => {
      shell.xdc.addPackagePin(io, pin)
      shell.xdc.addIOStandard(io, "LVCMOS18")
      shell.xdc.addIOB(io)
    } }
  } }
}
class UARTVC707ShellPlacer(val shell: VC707ShellCustomOverlays, val shellInput: UARTShellInput)(implicit val valName: ValName)
  extends UARTShellPlacer[VC707ShellCustomOverlays] {
  def place(designInput: UARTDesignInput) = new UARTVC707PlacedOverlay(shell, valName.name, designInput, shellInput)
}

/* =============================================================
============================= JTAG =============================
===============================================================*/
class JTAGDebugVC707PlacedOverlay(val shell: VC707ShellCustomOverlays, name: String, val designInput: JTAGDebugDesignInput, val shellInput: JTAGDebugShellInput)
  extends JTAGDebugXilinxPlacedOverlay(name, designInput, shellInput)
{
  shell { InModuleBody {
    shell.sdc.addClock("JTCK", IOPin(io.jtag_TCK), 10)
    shell.sdc.addGroup(clocks = Seq("JTCK"))
    shell.xdc.clockDedicatedRouteFalse(IOPin(io.jtag_TCK))
    val packagePinsWithPackageIOs = Seq(
      ("AN40", IOPin(io.jtag_TDI)),
      ("AR39", IOPin(io.jtag_TMS)),
      ("AR38", IOPin(io.jtag_TCK)),
      ("AT42", IOPin(io.jtag_TDO)),
      ("AR42", IOPin(io.srst_n)))
    packagePinsWithPackageIOs foreach { case (pin, io) => {
      shell.xdc.addPackagePin(io, pin)
      shell.xdc.addIOStandard(io, "LVCMOS18")
      shell.xdc.addPullup(io)
    } }
  } }
}
class JTAGDebugVC707ShellPlacer(val shell: VC707ShellCustomOverlays, val shellInput: JTAGDebugShellInput)(implicit val valName: ValName)
  extends JTAGDebugShellPlacer[VC707ShellCustomOverlays] {
  def place(designInput: JTAGDebugDesignInput) = new JTAGDebugVC707PlacedOverlay(shell, valName.name, designInput, shellInput)
}

/* =============================================================
============================= SDIO =============================
===============================================================*/
class SDIOVC707PlacedOverlay(val shell: VC707ShellCustomOverlays, name: String, val designInput: SPIDesignInput, val shellInput: SPIShellInput)
  extends SDIOXilinxPlacedOverlay(name, designInput, shellInput)
{
  shell { InModuleBody {
    val packagePinsWithPackageIOs = Seq(
      ("AN30", IOPin(io.spi_clk)),
      ("AP30", IOPin(io.spi_cs)),
      ("AR30", IOPin(io.spi_dat(0))),
      ("AU31", IOPin(io.spi_dat(1))),
      ("AV31", IOPin(io.spi_dat(2))),
      ("AT30", IOPin(io.spi_dat(3))))

    packagePinsWithPackageIOs foreach { case (pin, io) => {
      shell.xdc.addPackagePin(io, pin)
      shell.xdc.addIOStandard(io, "LVCMOS18")
      shell.xdc.addIOB(io)
    } }
    packagePinsWithPackageIOs drop 1 foreach { case (pin, io) => {
      shell.xdc.addPullup(io)
    } }
  } }
}
class SDIOVC707ShellPlacer(val shell: VC707ShellCustomOverlays, val shellInput: SPIShellInput)(implicit val valName: ValName)
  extends SPIShellPlacer[VC707ShellCustomOverlays] {
  def place(designInput: SPIDesignInput) = new SDIOVC707PlacedOverlay(shell, valName.name, designInput, shellInput)
}

/* =============================================================
========================= GPIO =================================
===============================================================*/
class GPIOVC707PlacedOverlay(val shell: VC707ShellCustomOverlays,
                               name: String,
                               val designInput: GPIODesignInput,
                               val shellInput: GPIOShellInput)
  extends GPIOXilinxPlacedOverlay(name, designInput, shellInput)
{
  shell { InModuleBody {
    val gpioLocations = List("AM39", "AN39", "AR37", "AT37", "AR35", "AP41", "AP42", "AU39", "AV30", "AY33", "BA31", "BA32", "AW30", "AY30", "BA30", "BB31") //J3 pins 1-16
    val iosWithLocs = io.gpio.zip(gpioLocations)
    val packagePinsWithPackageIOs = iosWithLocs.map { case (io, pin) => (pin, IOPin(io)) }
    println("Placing GPIO...")

    packagePinsWithPackageIOs foreach { case (pin, io) => {
      shell.xdc.addPackagePin(io, pin)
      shell.xdc.addIOStandard(io, "LVCMOS18")
      shell.xdc.addIOB(io)
    } }
  } }
}
class GPIOVC707ShellPlacer(val shell: VC707ShellCustomOverlays,
                             val shellInput: GPIOShellInput)(implicit val valName: ValName)
  extends GPIOShellPlacer[VC707ShellCustomOverlays] {
  def place(designInput: GPIODesignInput) = new GPIOVC707PlacedOverlay(shell, valName.name, designInput, shellInput)
}