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
import crypto.aes._

class WithSecureCore extends Config((site, here, up) => {
  case XLen => 64
  case TilesLocated(InSubsystem) => {
    val coreconfig = RocketTileParams(
      core = RocketCoreParams(
        useVM = false,
        fpu = Some(FPUParams(
          fLen = 32,
          divSqrt = false)),
        mulDiv = Some(MulDivParams(mulUnroll = 8))),
      btb = None,
      dcache = Some(DCacheParams(
        rowBits = site(SystemBusKey).beatBits,
        nSets = 32, // 16KB
        nWays = 1,
        nTLBSets = 1,
        nTLBWays = 4,
        nMSHRs = 0,
        blockBytes = site(CacheBlockBytes),
        scratch = Some(0x80000000L))),
      icache = Some(ICacheParams(
        rowBits = site(SystemBusKey).beatBits,
        nSets = 16, // 4KB
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
  new WithAES ++
  // new freechips.rocketchip.subsystem.WithIncoherentBusTopology ++ // use incoherent bus topology
  // new freechips.rocketchip.subsystem.WithNBanks(0) ++             // remove L2$
  // new freechips.rocketchip.subsystem.WithNoMemPort ++             // remove backing memory  
  new WithSecureCore ++
  new chipyard.config.AbstractConfig
)
  