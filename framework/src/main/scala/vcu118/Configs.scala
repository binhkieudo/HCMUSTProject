package framework.fpga.vcu118

import chipyard.config.WithTLBackingMemory
import freechips.rocketchip.devices.debug.DebugModuleKey
import freechips.rocketchip.devices.tilelink.BootROMLocated
import freechips.rocketchip.diplomacy.{DTSTimebase, SimpleLazyModule}
import freechips.rocketchip.subsystem.{ExtMem, SystemBusKey, WithoutTLMonitors}
import freechips.rocketchip.tile.XLen
import org.chipsalliance.cde.config.{Config, Parameters}
import sifive.blocks.devices.spi.{PeripherySPIKey, SPIParams}
import sifive.blocks.devices.uart.{PeripheryUARTKey, UARTParams}
import sifive.fpgashells.shell.DesignKey
import testchipip.{CustomBootPinKey, SerialTLKey, WithNoCustomBootPin}

import scala.sys.process._
import sifive.blocks.devices.gpio.PeripheryGPIOKey
import sifive.blocks.devices.gpio.GPIOParams

class WithDefaultPeripherals extends Config((site, here, up) => {
  case PeripheryUARTKey => List(UARTParams(address = BigInt(0x64000000L)))
  case PeripherySPIKey => List(SPIParams(rAddress = BigInt(0x64001000L)))
 case PeripheryGPIOKey => List(GPIOParams(address = BigInt(0x64002000L), width = 8))
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

class WithVCU118Tweaks(FreqMHz: Double = 100.0) extends Config(
  // clocking
  new chipyard.harness.WithAllClocksFromHarnessClockInstantiator ++
  new chipyard.clocking.WithPassthroughClockGenerator ++
  new chipyard.config.WithMemoryBusFrequency(FreqMHz) ++
  new chipyard.config.WithSystemBusFrequency(FreqMHz) ++
  new chipyard.config.WithPeripheryBusFrequency(FreqMHz) ++
  new chipyard.harness.WithHarnessBinderClockFreqMHz(FreqMHz) ++
  // harness binders
  new WithVCU118UARTHarnessBinder ++
  new WithVCU118SPISDCardHarnessBinder ++
  new WithVCU118JTAGHarnessBinder ++
  new WithVCU118GPIOHarnessBinder++
  new WithTSITieoff ++
  // io binders
  new WithUARTIOPassthrough ++
  new WithSPIIOPassthrough ++
  new WithGPIOIOPassthrough ++
  new WithTLIOPassthrough ++
  // other configuration
  new WithDefaultPeripherals ++
  new WithSystemModifications ++
  new testchipip.WithSerialTLWidth(32) ++
  new testchipip.WithSerialTLMem (
    base = BigInt(0x80000000L),
    size = BigInt(0x40000000L)
  ) ++
  new testchipip.WithSerialTLBackingMemory ++
  new freechips.rocketchip.subsystem.WithoutTLMonitors
)

class VCU118RocketConfig extends Config(
  new WithVCU118Tweaks ++
  new chipyard.config.WithBroadcastManager ++ // remove L2
  new chipyard.SecureRocketConfig
)