package framework.fpga.vc707

import chipyard.CanHaveMasterTLMemPort
import chipyard.harness.OverrideHarnessBinder
import chipyard.iobinders.JTAGChipIO
import chisel3._
import chisel3.experimental.BaseModule
import freechips.rocketchip.devices.debug.HasPeripheryDebug
import freechips.rocketchip.tilelink.TLBundle
import freechips.rocketchip.util.HeterogeneousBag
import sifive.blocks.devices.gpio.{GPIOPortIO, HasPeripheryGPIOModuleImp}
import sifive.blocks.devices.spi.{HasPeripherySPI, SPIPortIO}
import sifive.blocks.devices.uart.{HasPeripheryUARTModuleImp, UARTPortIO}
import testchipip._

/*** UART ***/
class WithVC707UARTHarnessBinder extends OverrideHarnessBinder({
  (system: HasPeripheryUARTModuleImp, th: BaseModule, ports: Seq[UARTPortIO]) => {
    th match {
      case vc707th: VC707HarnessImp => vc707th.vc707Outer.io_uart_bb.bundle <> ports.head
      case vc707th: VC707woDDRHarnessImp => vc707th.vc707Outer.io_uart_bb.bundle <> ports.head
    }
  }
})

/*** SPI ***/
class WithVC707SPISDCardHarnessBinder extends OverrideHarnessBinder({
  (system: HasPeripherySPI, th: BaseModule, ports: Seq[SPIPortIO]) => {
    th match {
      case vc707th: VC707HarnessImp => vc707th.vc707Outer.io_spi_bb.bundle <> ports.head
      case vc707th: VC707woDDRHarnessImp => vc707th.vc707Outer.io_spi_bb.bundle <> ports.head
    }
  }
})

/*** JTAG ***/
class WithVC707JTAGHarnessBinder extends OverrideHarnessBinder({
  (system: HasPeripheryDebug, th: BaseModule, ports: Seq[Data]) => {
    ports.map {
      case jtagIO: JTAGChipIO =>
      th match {
        case vc707th: VC707HarnessImp => {
          val jtagModule = vc707th.vc707Outer.jtagModule
          jtagModule.TDO.data := jtagIO.TDO
          jtagModule.TDO.driven := true.B
          jtagIO.TCK := jtagModule.TCK
          jtagIO.TMS := jtagModule.TMS
          jtagIO.TDI := jtagModule.TDI
        }
        case vc707th: VC707woDDRHarnessImp => {
          val jtagModule = vc707th.vc707Outer.jtagModule
          jtagModule.TDO.data := jtagIO.TDO
          jtagModule.TDO.driven := true.B
          jtagIO.TCK := jtagModule.TCK
          jtagIO.TMS := jtagModule.TMS
          jtagIO.TDI := jtagModule.TDI
        }
      }
    }
  }
})

/*** GPIO ***/
class WithVC707GPIOHarnessBinder extends OverrideHarnessBinder({
  (system: HasPeripheryGPIOModuleImp, th: BaseModule, ports: Seq[GPIOPortIO]) => {
    th match {
      case th: VC707woDDRHarnessImp => {
        (th.vc707Outer.io_gpio_bb zip ports).map{ case (gpio, port) =>
          gpio.bundle <> port
        }
      }
      case th: VC707HarnessImp => {
        (th.vc707Outer.io_gpio_bb zip ports).map{ case (gpio, port) =>
          gpio.bundle <> port
        }
      }
    }
  }
})

/*** Experimental DDR ***/
class WithVC707DDRMemHarnessBinder extends OverrideHarnessBinder({
  (system: CanHaveMasterTLMemPort, th: BaseModule, ports: Seq[HeterogeneousBag[TLBundle]]) => {
    th match {
      case vc707th: VC707HarnessImp => {
        require(ports.size == 1)

        val bundles = vc707th.vc707Outer.ddrClient.out.map(_._1)
        val ddrClientBundle = Wire(new HeterogeneousBag(bundles.map(_.cloneType)))
        bundles.zip(ddrClientBundle).foreach { case (bundle, io) => bundle <> io }
        ddrClientBundle <> ports.head
      }
    }
  }
})

/*** Tie off TSI ***/
class WithTSITieoff extends OverrideHarnessBinder ({
  (system: CanHavePeripheryTLSerial, th: BaseModule, ports: Seq[ClockedIO[SerialIO]]) => {
    th match {
      case vc707th: VC707woDDRHarnessImp => {
        ports.map({ port =>
          val bits = port.bits
          port.clock := vc707th.harnessBinderClock
          val ram = TSIHarness.connectRAM(system.serdesser.get, bits, vc707th.harnessBinderReset)
          TSIHarness.tieoff(ram.module.io.tsi)
        })
      }
    }
  }
})