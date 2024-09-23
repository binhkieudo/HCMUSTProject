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

class WithSystemModifications extends Config((site, here, up) => {
  case DTSTimebase => BigInt{(1e6).toLong}
  case BootROMLocated(x) => up(BootROMLocated(x), site).map{ p =>
    val freqMHz = (site(SystemBusKey).dtsFrequency.get / (1000 * 1000)).toLong
    // Make sure that the bootrom is always rebuilt
    val clean = s"make -C framework/src/main/resources/bootROM/MTBoot clean"
    require (clean.! == 0, "Failed to clean")
    // Build the bootrom
    val make = s"make -C framework/src/main/resources/bootROM/MTBoot XLEN=${site(XLen)}"
    require (make.! == 0, "Failed to build bootrom")
    p.copy(hang = 0x10000, contentFileName = s"./framework/src/main/resources/bootROM/MTBoot/build/sdboot.bin")
  }
  case DesignKey => (p: Parameters) => new SimpleLazyModule()(p)
  case DebugModuleKey => up(DebugModuleKey).map{ debug =>
    debug.copy(clockGate = false)
  }
  case CustomBootPinKey => None
})

class WithSystemDDRModifications extends Config((site, here, up) => {
  case DTSTimebase => BigInt{(1e6).toLong}
  case BootROMLocated(x) => up(BootROMLocated(x), site).map{ p =>
    val freqMHz = (site(SystemBusKey).dtsFrequency.get / (1000 * 1000)).toLong
    // Make sure that the bootrom is always rebuilt
    val clean = s"make -C framework/src/main/resources/bootROM/MTBoot clean"
    require (clean.! == 0, "Failed to clean")
    // Build the bootrom
    val make = s"make -C framework/src/main/resources/bootROM/MTBoot XLEN=${site(XLen)}"
    require (make.! == 0, "Failed to build bootrom")
    p.copy(hang = 0x10000, contentFileName = s"./framework/src/main/resources/bootROM/MTBoot/build/sdboot.bin")
  }
  case DesignKey => (p: Parameters) => new SimpleLazyModule()(p)
  case ExtMem => up(ExtMem, site).map(x => x.copy(master = x.master.copy(
    base = BigInt(0x80000000L),
    size = site(VCU118DDRSize)))) // set extmem
  case DebugModuleKey => up(DebugModuleKey).map{ debug =>
    debug.copy(clockGate = false)
  }
  case SerialTLKey => None // remove serialized tl port
  case CustomBootPinKey => None
})

class WithNoSerialTL extends Config((site, here, up) => {
  case SerialTLKey => None // remove serialized tl port
})

class WithDefaultPeripherals extends Config((site, here, up) => {
  case PeripheryUARTKey => List(UARTParams(address = BigInt(0x64000000L)))
  case PeripherySPIKey => List(
    SPIParams(rAddress = BigInt(0x64001000L)),
    SPIParams(rAddress = BigInt(0x64002000L)))
  case PeripheryGPIOKey => List(GPIOParams(address = BigInt(0x64003000L), width = 8))
})

class WithACTPeripherals extends Config((site, here, up) => {
  case PeripheryUARTKey => List(UARTParams(address = BigInt(0x64000000L)))
  case PeripherySPIKey => List(SPIParams(rAddress = BigInt(0x64001000L)))
  case PeripheryGPIOKey => List(GPIOParams(address = BigInt(0x64002000L), width = 8))
})

class WithDDR extends Config((site, here, up) => {
  case ExtMem => up(ExtMem, site).map(x => x.copy(master = x.master.copy(
    base = BigInt(0x80000000L),
    size = site(VCU118DDRSize)))) // set extmem
})

class WithVCU118Tweaks(FreqMHz: Double = 100.0) extends Config(
  // Clock configs
  new chipyard.harness.WithAllClocksFromHarnessClockInstantiator ++
    new chipyard.clocking.WithPassthroughClockGenerator ++
    new chipyard.config.WithMemoryBusFrequency(FreqMHz) ++
    new chipyard.config.WithSystemBusFrequency(FreqMHz) ++
    new chipyard.config.WithPeripheryBusFrequency(FreqMHz) ++
    new chipyard.harness.WithHarnessBinderClockFreqMHz(FreqMHz) ++
    // Harness Binder
    new WithVCU118UARTHarnessBinder ++
    new WithVCU118SPISDCardHarnessBinder ++
    new WithVCU118JTAGHarnessBinder ++
    new WithVCU118DDRMemHarnessBinder ++
    // IO Binders
    new WithUARTIOPassthrough ++
    new WithSPIIOPassthrough ++
    new WithTLIOPassthrough ++
    // Other configurations
    new WithDefaultPeripherals ++
    new WithTLBackingMemory ++ // use TL backing memory
    new WithSystemDDRModifications ++
    new WithoutTLMonitors
)

class WithVCU118SerialMemTweaks (FreqMhz: Double = 100.0) extends Config (
  // clocking
  new chipyard.harness.WithAllClocksFromHarnessClockInstantiator ++
    new chipyard.clocking.WithPassthroughClockGenerator ++
    new chipyard.config.WithMemoryBusFrequency(FreqMhz) ++
    new chipyard.config.WithSystemBusFrequency(FreqMhz) ++
    new chipyard.config.WithPeripheryBusFrequency(FreqMhz) ++
    new chipyard.harness.WithHarnessBinderClockFreqMHz(FreqMhz) ++
    // harness binders
    new WithVCU118UARTHarnessBinder ++
    new WithVCU118SPISDCardHarnessBinder ++
    new WithVCU118JTAGHarnessBinder ++
    new WithVCU118GPIOHarnessBinder++
    // io binders
    new WithUARTIOPassthrough ++
    new WithSPIIOPassthrough ++
    new WithGPIOIOPassthrough ++
    new WithTSITieoff ++
    // other configuration
    new WithACTPeripherals ++
    new WithSystemModifications ++
    new testchipip.WithSerialTLWidth(8) ++
    new testchipip.WithSerialTLMem(
      base = BigInt(0x70000000L),
      size = BigInt((1 << 10) * 8L),
      isMainMemory=true) ++
    new testchipip.WithSerialTLBackingMemory ++
    new freechips.rocketchip.subsystem.WithoutTLMonitors
)

// Use in chip
// class WithVCU118SerialMemTweaks (FreqMhz: Double = 100.0) extends Config (
//   // clocking
//   new chipyard.harness.WithAllClocksFromHarnessClockInstantiator ++
//     new chipyard.clocking.WithPassthroughClockGenerator ++
//     new chipyard.config.WithMemoryBusFrequency(FreqMhz) ++
//     new chipyard.config.WithSystemBusFrequency(FreqMhz) ++
//     new chipyard.config.WithPeripheryBusFrequency(FreqMhz) ++
//     new chipyard.harness.WithHarnessBinderClockFreqMHz(FreqMhz) ++
//     // harness binders
//     new WithVCU118UARTHarnessBinder ++
//     new WithVCU118SPISDCardHarnessBinder ++
//     new WithVCU118JTAGHarnessBinder ++
//     new WithVCU118GPIOHarnessBinder++
//     new WithTSITieoff ++
//     // io binders
//     new WithUARTIOPassthrough ++
//     new WithSPIIOPassthrough ++
//     new WithGPIOIOPassthrough ++
//     // other configuration
//     new WithDefaultPeripherals ++
//     new WithSystemModifications ++
//     new testchipip.WithSerialTLWidth(8) ++
//     new testchipip.WithSerialTLMem(
//       base = BigInt(0x70000000L),
//       size = BigInt((1 << 10) * 256L),
//       isMainMemory=true) ++
//     new testchipip.WithSerialTLBackingMemory ++
//     new freechips.rocketchip.subsystem.WithoutTLMonitors

class USBACTTweaks(FreqMHz: Double = 100.0) extends Config(
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
    // other configuration
    new WithACTPeripherals ++
    new WithSystemModifications ++
    // new testchipip.WithSerialTLWidth(8) ++
    // new testchipip.WithSerialTLMem(
    //   base = BigInt(0x80000000L),
    //   size = BigInt((1 << 10) * 32L),
    //   isMainMemory=true) ++
    // new testchipip.WithSerialTLBackingMemory ++
    new WithNoSerialTL ++
    new freechips.rocketchip.subsystem.WithoutTLMonitors
)

class SmallRocketVCU118Config extends Config(
  new WithVCU118Tweaks ++
  new chipyard.config.WithBroadcastManager ++ // no l2
  new chipyard.SmallRocketConfig)

class SmallRocketSerialMemVCU118Config extends Config(
  new WithVCU118SerialMemTweaks ++
    new chipyard.SmallRocketConfig)

class FourCoreRocketDDRVCU118Config extends Config(
  new WithVCU118Tweaks ++
  new chipyard.FourCoreRocketFastConfig)

class FourCoreRocketSerialVCU118Config extends Config(
  new WithVCU118SerialMemTweaks ++
  new chipyard.FourCoreRocketFastConfig)

class FourCorePrivateChannelConfig extends Config(
  new WithVCU118SerialMemTweaks ++
  new chipyard.config.WithBroadcastManager ++ // no l2
  new chipyard.FourCoreWithPNConfig
  // new chipyard.WithTinyCore
  )

class USBACTCoreConfig extends Config(
  new USBACTTweaks ++
  new chipyard.config.WithBroadcastManager ++ // no l2
  new chipyard.USBRocketConig)