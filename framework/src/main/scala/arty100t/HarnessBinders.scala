package framework.fpga.arty100t

import chipyard._
import chipyard.harness._
import chipyard.iobinders.JTAGChipIO
import chisel3._
import chisel3.experimental.BaseModule
import freechips.rocketchip.devices.debug.HasPeripheryDebug
import freechips.rocketchip.tilelink.TLBundle
import freechips.rocketchip.util.HeterogeneousBag
import sifive.blocks.devices.gpio.{GPIOPortIO, HasPeripheryGPIOModuleImp}
import sifive.blocks.devices.spi.{HasPeripherySPI, SPIPortIO, HasPeripherySPIFlashModuleImp}
import sifive.blocks.devices.uart.{HasPeripheryUARTModuleImp, UARTPortIO}
import testchipip._

/*** UART ***/
class WithArty100TUARTHarnessBinder extends OverrideHarnessBinder({
  (system: HasPeripheryUARTModuleImp, th: BaseModule, ports: Seq[UARTPortIO]) => {
    th match {
      case ath: Arty100TDDRHarnessImp => {
        ath.athOuter.io_uart_bb.bundle <> ports.head
        ath.athOuter.io_uart_bb2.bundle <> ports.last
      }
    }
  }
})

/*** SPI ***/
class WithArty100TSPISDCardHarnessBinder extends OverrideHarnessBinder({
  (system: HasPeripherySPI, th: BaseModule, ports: Seq[SPIPortIO]) => {
    th match {
      case ath: Arty100TDDRHarnessImp => ath.athOuter.io_spi_bb.bundle <> ports.head
    }
  }
})

/*** Flash ***/
class WithArty100TSPIFlashHarnessBinder extends OverrideHarnessBinder({
  (system: HasPeripherySPIFlashModuleImp, th: BaseModule, ports: Seq[SPIPortIO]) => {
    th match {
      case ath: Arty100TDDRHarnessImp => ath.athOuter.io_flash_bb.bundle <> ports.head
    }
  }
})

/*** JTAG ***/
class WithArty100TJTAGHarnessBinder extends OverrideHarnessBinder({
  (system: HasPeripheryDebug, th: BaseModule, ports: Seq[Data]) => {
    ports.map {
      case jtagIO: JTAGChipIO =>
        th match {
          case ath: Arty100TDDRHarnessImp => {
            val jtagModule = ath.athOuter.jtagModule
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
class WithArty100TGPIOHarnessBinder extends OverrideHarnessBinder({
  (system: HasPeripheryGPIOModuleImp, th: BaseModule, ports: Seq[GPIOPortIO]) => {
    th match {
      case th: Arty100TDDRHarnessImp => {
        (th.athOuter.io_gpio_bb zip ports).map{ case (gpio, port) =>
          gpio.bundle <> port
        }
      }
    }
  }
})

/*** Experimental DDR ***/
// class WithArty100TDDRMemHarnessBinder extends OverrideHarnessBinder({
//   (system: CanHaveMasterTLMemPort, th: BaseModule, ports: Seq[HeterogeneousBag[TLBundle]]) => {
//     th match {
//       case ath: Arty100TDDRHarnessImp => {
//         require(ports.size == 1)

//         val bundles = ath.athOuter.ddrClient.out.map(_._1)
//         val ddrClientBundle = Wire(new HeterogeneousBag(bundles.map(_.cloneType)))
//         bundles.zip(ddrClientBundle).foreach { case (bundle, io) => bundle <> io }
//         ddrClientBundle <> ports.head
//       }
//     }
//   }
// })

/*** Tie off TSI ***/
class WithArty100TTSITieoff extends OverrideHarnessBinder ({
  (system: CanHavePeripheryTLSerial, th: BaseModule, ports: Seq[ClockedIO[SerialIO]]) => {
    th match {
      case athOuter: Arty100TDDRHarnessImp => {
        ports.map({ port =>
          val bits = port.bits
          port.clock := athOuter.harnessBinderClock
          val ram = TSIHarness.connectRAM(system.serdesser.get, bits, athOuter.harnessBinderReset)
          TSIHarness.tieoff(ram.module.io.tsi)
        })
      }
    }
  }
})