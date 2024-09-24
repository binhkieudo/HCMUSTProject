// See LICENSE for license details.
package framework.fpga.arty100t

import freechips.rocketchip.devices.debug.DebugModuleKey
import freechips.rocketchip.devices.tilelink.BootROMLocated
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.subsystem._
import freechips.rocketchip.tile.XLen
import org.chipsalliance.cde.config._
import sifive.blocks.devices.gpio.{PeripheryGPIOKey, GPIOParams}
import sifive.blocks.devices.spi.{PeripherySPIKey, SPIParams}
import sifive.blocks.devices.uart.{PeripheryUARTKey, UARTParams}
import sifive.fpgashells.shell.DesignKey
import testchipip.{CustomBootPinKey, SerialTLKey}

import scala.sys.process._
import crypto.aes._

class WithDefaultPeripherals extends Config((site, here, up) => {
  case PeripheryUARTKey => List(UARTParams(address = BigInt(0x64000000L)))
  case PeripherySPIKey => List(SPIParams(rAddress = BigInt(0x64001000L)))
  case PeripheryGPIOKey => List(GPIOParams(address = BigInt(0x64002000L), width = 4))
})

class WithCryptoCores extends Config((site, here, up) => {
  case AESKey => Some(AESParams(address = BigInt(0x70000000L)))
})

class WithSystemModifications extends Config((site, here, up) => {
  case DTSTimebase => BigInt{(1e6).toLong}
  case BootROMLocated(x) => up(BootROMLocated(x), site).map{ p =>
    val freqMHz = (site(SystemBusKey).dtsFrequency.get / (1000 * 1000)).toLong
    // Make sure that the bootrom is always rebuilt
    val clean = s"make -C framework/src/main/resources/bootROM/MTBoot clean"
    require (clean.! == 0, "Failed to clean")
    // Build the bootromt
    val make = s"make -C framework/src/main/resources/bootROM/MTBoot XLEN=${site(XLen)} PBUS_CLK=${freqMHz}"
    require (make.! == 0, "Failed to build bootrom")
    p.copy(hang = 0x10000, contentFileName = s"./framework/src/main/resources/bootROM/MTBoot/build/sdboot.bin")
  }
  case DesignKey => (p: Parameters) => new SimpleLazyModule()(p)
  case DebugModuleKey => up(DebugModuleKey).map{ debug =>
    debug.copy(clockGate = false)
  }
  case CustomBootPinKey => None
})

class WithArty100TTweaks extends Config(
  // Clock configs
  new chipyard.harness.WithAllClocksFromHarnessClockInstantiator ++
  new chipyard.harness.WithHarnessBinderClockFreqMHz(50) ++
  new chipyard.config.WithMemoryBusFrequency(50.0) ++
  new chipyard.config.WithSystemBusFrequency(50.0) ++
  new chipyard.config.WithPeripheryBusFrequency(50.0) ++
  new chipyard.harness.WithAllClocksFromHarnessClockInstantiator ++
  new chipyard.clocking.WithPassthroughClockGenerator ++
  // Harness Binder
  new WithArty100TUARTHarnessBinder ++
  new WithArty100TSPISDCardHarnessBinder ++
  new WithArty100TJTAGHarnessBinder ++
  new WithArty100TGPIOHarnessBinder ++
  new WithArty100TTSITieoff ++
  // IO Binders
  new WithGPIOIOPassthrough ++
  new WithUARTIOPassthrough ++
  new WithSPIIOPassthrough ++
  new WithTLIOPassthrough ++
  // Other configurations
  new WithCryptoCores ++
  new WithDefaultPeripherals ++
  new WithSystemModifications ++
  new testchipip.WithSerialTLWidth(32) ++
  new testchipip.WithSerialTLMem (
    base = BigInt(0x80000000L),
    size = BigInt(0x40000000L)
  ) ++
  new testchipip.WithSerialTLBackingMemory ++
  new freechips.rocketchip.subsystem.WithoutTLMonitors)

class Arty100TRocketConfig extends Config(
  new WithArty100TTweaks ++
  new chipyard.config.WithBroadcastManager ++ // remove L2
  new chipyard.SecureRocketConfig
)