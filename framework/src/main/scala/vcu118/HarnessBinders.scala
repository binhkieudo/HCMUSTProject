package framework.fpga.vcu118

import chisel3._
import chipyard.CanHaveMasterTLMemPort
import chipyard.harness.{HasHarnessInstantiators, OverrideHarnessBinder}
import chipyard.iobinders.JTAGChipIO
import chisel3.experimental.BaseModule
import chisel3.{Data, Wire}
import freechips.rocketchip.devices.debug.HasPeripheryDebug
import freechips.rocketchip.diplomacy.LazyRawModuleImp
import freechips.rocketchip.tilelink.TLBundle
import freechips.rocketchip.util.HeterogeneousBag
import sifive.blocks.devices.spi.{HasPeripherySPI, SPIPortIO}
import sifive.blocks.devices.uart.{HasPeripheryUARTModuleImp, UARTPortIO}
import testchipip.{CanHavePeripheryTLSerial, ClockedIO, SerialIO, TSIHarness}
import sifive.blocks.devices.gpio.HasPeripheryGPIOModuleImp
import sifive.blocks.devices.gpio.GPIOPortIO

/*** UART ***/
class WithVCU118UARTHarnessBinder extends OverrideHarnessBinder({
  (system: HasPeripheryUARTModuleImp, th: BaseModule, ports: Seq[UARTPortIO]) => {
    th match {
      case vcu118th: VCU118HarnessImp => vcu118th.vcu118Outer.io_uart_bb.bundle <> ports.head
      case vcu118th: VCU118woDDRHarnessImp => vcu118th.vcu118Outer.io_uart_bb.bundle <> ports.head
      case vcu118th: USBATCHarnessImp => vcu118th.vcu118Outer.io_uart_bb.bundle <> ports.head
    }
  }
})

/*** SPI ***/
class WithVCU118SPISDCardHarnessBinder extends OverrideHarnessBinder({
  (system: HasPeripherySPI, th: BaseModule, ports: Seq[SPIPortIO]) => {
    th match {
      case vcu118th: VCU118HarnessImp => vcu118th.vcu118Outer.io_spi_bb.bundle <> ports.head
      case vcu118th: VCU118woDDRHarnessImp => {
        vcu118th.vcu118Outer.io_sdio_bb.bundle <> ports.head
        // vcu118th.vcu118Outer.io_flash_bb.bundle <> ports.tail.head
      }
      case vcu118th: USBATCHarnessImp => vcu118th.vcu118Outer.io_flash_bb.bundle <> ports.head
    }
  }
})


/*** JTAG ***/
class WithVCU118JTAGHarnessBinder extends OverrideHarnessBinder({
  (system: HasPeripheryDebug, th: BaseModule, ports: Seq[Data]) => {
    ports.map {
      case jtagIO: JTAGChipIO =>
        th match {
          case vcu118th: VCU118HarnessImp => {
            val jtagModule = vcu118th.vcu118Outer.jtagModule
            jtagModule.TDO.data := jtagIO.TDO
            jtagModule.TDO.driven := true.B
            jtagIO.TCK := jtagModule.TCK
            jtagIO.TMS := jtagModule.TMS
            jtagIO.TDI := jtagModule.TDI
          }
          case vcu118th: VCU118woDDRHarnessImp => {
            val jtagModule = vcu118th.vcu118Outer.jtagModule
            jtagModule.TDO.data := jtagIO.TDO
            jtagModule.TDO.driven := true.B
            jtagIO.TCK := jtagModule.TCK
            jtagIO.TMS := jtagModule.TMS
            jtagIO.TDI := jtagModule.TDI
          }
          case vcu118th: USBATCHarnessImp => {
            val jtagModule = vcu118th.vcu118Outer.jtagModule
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

/*** Experimental DDR ***/
class WithVCU118DDRMemHarnessBinder extends OverrideHarnessBinder({
  (system: CanHaveMasterTLMemPort, th: BaseModule, ports: Seq[HeterogeneousBag[TLBundle]]) => {
    th match {
      case vc707th: VCU118HarnessImp => {
        require(ports.size == 1)

        val bundles = vc707th.vcu118Outer.ddrClient.out.map(_._1)
        val ddrClientBundle = Wire(new HeterogeneousBag(bundles.map(_.cloneType)))
        bundles.zip(ddrClientBundle).foreach { case (bundle, io) => bundle <> io }
        ddrClientBundle <> ports.head
      }
    }
  }
})

/*** GPIO ***/
class WithVCU118GPIOHarnessBinder extends OverrideHarnessBinder({
  (system: HasPeripheryGPIOModuleImp, th: BaseModule, ports: Seq[GPIOPortIO]) => {
    th match {
      case th: VCU118woDDRHarnessImp => {
        (th.vcu118Outer.io_gpio_bb zip ports).map{ case (gpio, port) =>
          gpio.bundle <> port
        }
      }
      case th: USBATCHarnessImp => {
        (th.vcu118Outer.io_gpio_bb zip ports).map{ case (gpio, port) =>
          gpio.bundle <> port
        }
      }     
    }
  }
})

/*** Tie off TSI ***/
class WithTSITieoff extends OverrideHarnessBinder ({
  (system: CanHavePeripheryTLSerial, th: BaseModule, ports: Seq[ClockedIO[SerialIO]]) => {
    th match {
      case vcu118th: VCU118woDDRHarnessImp => {
        ports.map({ port =>
          val bits = port.bits
          port.clock := vcu118th.harnessBinderClock
          val ram = TSIHarness.connectRAM(system.serdesser.get, bits, vcu118th.harnessBinderReset)
          TSIHarness.tieoff(ram.module.io.tsi)
        })
      }
      case vcu118th: USBATCHarnessImp => {
        ports.map({ port =>
          val bits = port.bits
          port.clock := vcu118th.harnessBinderClock
          val ram = TSIHarness.connectRAM(system.serdesser.get, bits, vcu118th.harnessBinderReset)
          TSIHarness.tieoff(ram.module.io.tsi)
        })
      }      
    }
  }
})