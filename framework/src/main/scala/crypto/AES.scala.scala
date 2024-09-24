package framework.crypto

import chisel3._
import chisel3.util._
import chisel3.experimental.{IntParam, BaseModule}
import freechips.rocketchip.amba.axi4._
import freechips.rocketchip.subsystem.BaseSubsystem
import org.chipsalliance.cde.config.{Parameters, Field, Config}
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.regmapper.{HasRegMap, RegField}
import freechips.rocketchip.tilelink._
import freechips.rocketchip.util.UIntIsOneOf

// DOC include start: GCD params
case class AESParams(
  address: BigInt = 0x1000,
  width: Int = 32)
// DOC include end: GCD params

// DOC include start: GCD key
case object AESKey extends Field[Option[AESParams]](None)
// DOC include end: GCD key

class AESIO() extends Bundle {
  val i_clk  = Input(Clock())
  val i_rst  = Input(Bool())
  val i_init = Input(Bool())
  val i_mode = Input(Bool())
  val i_enc  = Input(Bool())
  val i_key_AES = Input(UInt(128.W))
  val i_msg_AES = Input(UInt(128.W))
  val o_cipher_AES = Output(UInt(128.W))
  val o_finish = Output(Bool())
}

trait AESTopIO extends Bundle {
  val gcd_busy = Output(Bool())
}

trait HasAESIO extends BaseModule {
  val io = IO(new AESIO())
}

// DOC include start: GCD blackbox
class aes_bb() extends BlackBox() with HasBlackBoxResource
  with AESIO
{
  addResource("/vsrc/aes_bb.v")
}
// DOC include end: GCD blackbox

// DOC include start: GCD chisel
class AESMMIOChiselModule() extends Module
  with HasAESIO
{
  val s_idle :: s_run :: s_done :: Nil = Enum(3)

  val state = RegInit(s_idle)
  val tmp   = Reg(UInt(w.W))
  val gcd   = Reg(UInt(w.W))

  io.input_ready := state === s_idle
  io.output_valid := state === s_done
  io.gcd := gcd

  when (state === s_idle && io.input_valid) {
    state := s_run
  } .elsewhen (state === s_run && tmp === 0.U) {
    state := s_done
  } .elsewhen (state === s_done && io.output_ready) {
    state := s_idle
  }

  when (state === s_idle && io.input_valid) {
    gcd := io.x
    tmp := io.y
  } .elsewhen (state === s_run) {
    when (gcd > tmp) {
      gcd := gcd - tmp
    } .otherwise {
      tmp := tmp - gcd
    }
  }

  io.busy := state =/= s_idle
}
// DOC include end: GCD chisel

// DOC include start: GCD instance regmap

trait AESModule extends HasRegMap {
  val io: AESTopIO

  implicit val p: Parameters
  def params: AESParams
  val clock: Clock
  val reset: Reset

  val status = Reg(UInt(3.W))
  val ikey0 = Reg(UInt(64.W))
  val ikey1 = Reg(UInt(64.W))
  val imsg0 = Reg(UInt(64.W))
  val imsg1 = Reg(UInt(64.W))

  val ocipher0 = Wire(UInt(64.W))     
  val ocipher1 = Wire(UInt(64.W))
  val oready   = Wire(Bool())

  // How many clock cycles in a PWM cycle?
  val x = Reg(UInt(params.width.W))
  val y = Wire(new DecoupledIO(UInt(params.width.W)))
  val gcd = Wire(new DecoupledIO(UInt(params.width.W)))
  val status = Wire(UInt(2.W))

  val impl = if (params.useBlackBox) {
    Module(new GCDMMIOBlackBox(params.width))
  } else {
    Module(new GCDMMIOChiselModule(params.width))
  }

  impl.io.clock := clock
  impl.io.reset := reset.asBool

  impl.io.x := x
  impl.io.y := y.bits
  impl.io.input_valid := y.valid
  y.ready := impl.io.input_ready

  gcd.bits := impl.io.gcd
  gcd.valid := impl.io.output_valid
  impl.io.output_ready := gcd.ready

  status := Cat(impl.io.input_ready, impl.io.output_valid)
  io.gcd_busy := impl.io.busy

  regmap(
    0x00 -> Seq(
      RegField.r(2, status)), // a read-only register capturing current status
    0x04 -> Seq(
      RegField.w(params.width, x)), // a plain, write-only register
    0x08 -> Seq(
      RegField.w(params.width, y)), // write-only, y.valid is set on write
    0x0C -> Seq(
      RegField.r(params.width, gcd))) // read-only, gcd.ready is set on read
}
// DOC include end: GCD instance regmap

// DOC include start: GCD router
class GCDTL(params: GCDParams, beatBytes: Int)(implicit p: Parameters)
  extends TLRegisterRouter(
    params.address, "gcd", Seq("ucbbar,gcd"),
    beatBytes = beatBytes)(
      new TLRegBundle(params, _) with GCDTopIO)(
      new TLRegModule(params, _, _) with GCDModule)

// DOC include start: GCD lazy trait
trait CanHavePeripheryAES { this: BaseSubsystem =>
  private val portName = "aes"

  // Only build if we are using the TL (nonAXI4) version
  val gcd = p(GCDKey) match {
    case Some(params) => {
      if (params.useAXI4) {
        val gcd = LazyModule(new GCDAXI4(params, pbus.beatBytes)(p))
        pbus.coupleTo(portName) {
          gcd.node :=
          AXI4Buffer () :=
          TLToAXI4 () :=
          // toVariableWidthSlave doesn't use holdFirstDeny, which TLToAXI4() needsx
          TLFragmenter(pbus.beatBytes, pbus.blockBytes, holdFirstDeny = true) := _
        }
        Some(gcd)
      } else {
        val gcd = LazyModule(new GCDTL(params, pbus.beatBytes)(p))
        pbus.coupleTo(portName) { gcd.node := TLFragmenter(pbus.beatBytes, pbus.blockBytes) := _ }
        Some(gcd)
      }
    }
    case None => None
  }
}
// DOC include end: GCD lazy trait

// DOC include start: GCD imp trait
trait CanHavePeripheryAESModuleImp extends LazyModuleImp {
  val outer: CanHavePeripheryAES
  val gcd_busy = outer.gcd match {
    case Some(gcd) => {
      val busy = IO(Output(Bool()))
      busy := gcd.module.io.gcd_busy
      Some(busy)
    }
    case None => None
  }
}

// DOC include end: GCD imp trait


// DOC include start: GCD config fragment
class WithAES() extends Config((site, here, up) => {
  case GCDKey => Some(AESParams())
})
// DOC include end: GCD config fragment

