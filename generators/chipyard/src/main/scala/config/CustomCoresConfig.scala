package chipyard

import org.chipsalliance.cde.config.{Config}
import freechips.rocketchip.subsystem._

import chipyard.example._
import freechips.rocketchip.devices.tilelink.PLICAttachParams

import freechips.rocketchip.devices.tilelink._
import chipyard.clocking.{ChipyardPRCIControlKey, ChipyardPRCIControlParams}
import freechips.rocketchip.devices.debug.{ExportDebug, DebugAttachParams}
import freechips.rocketchip.tile._
import freechips.rocketchip.rocket._
import freechips.rocketchip.diplomacy.SynchronousCrossing

class WithSecureCore extends Config((site, here, up) => {
  case XLen => 64
  case TilesLocated(InSubsystem) => {
    val coreconfig = RocketTileParams(
      core = RocketCoreParams(
        useVM = false,
        fpu = Some(FPUParams(divSqrt = false)),
        mulDiv = Some(MulDivParams(mulUnroll = 8))),
      btb = None,
      dcache = Some(DCacheParams(
        rowBits = site(SystemBusKey).beatBits,
        nSets = 128, // 32Kb scratchpad
        nWays = 1,
        nTLBSets = 1,
        nTLBWays = 4,
        nMSHRs = 0,
        blockBytes = site(CacheBlockBytes))),
      icache = Some(ICacheParams(
        rowBits = site(SystemBusKey).beatBits,
        nSets = 64,
        nWays = 1,
        nTLBSets = 1,
        nTLBWays = 4,
        blockBytes = site(CacheBlockBytes)))
    )
    List(RocketTileAttachParams(
      coreconfig,
      RocketCrossingParams(
        crossingType = SynchronousCrossing(),
        master = TileMasterPortParams())
    ))
  }
})

class SecureRocketConfig extends Config(
  new freechips.rocketchip.subsystem.WithNoSlavePort ++
  new chipyard.example.WithGCD ++
  new WithSecureCore ++
  new chipyard.config.AbstractConfig
)

class SmallSha3RocketConfig extends Config(
  new sha3.WithSha3Accel ++                                // add SHA3 rocc accelerator
  new freechips.rocketchip.subsystem.WithL1DCacheWays(2) ++
  new freechips.rocketchip.subsystem.WithNSmallCores(1) ++
  new chipyard.config.AbstractConfig)
  