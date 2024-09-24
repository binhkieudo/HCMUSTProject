package crypto.aes

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
import freechips.rocketchip.rocket.AES

// DOC include start: GCD params
case class AESParams(
  address: BigInt = 0x1000,
  width: Int = 64)
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
  val aes_busy = Output(Bool())
}

trait HasAESIO extends BaseModule {
  val io = IO(new AESIO())
}

// DOC include start: GCD blackbox
class aes_bb() extends BlackBox() with HasBlackBoxResource
  with HasAESIO
{
  addResource("/vsrc/aes_bb.v")
}
// DOC include end: GCD blackbox


// DOC include start: GCD instance regmap

trait AESModule extends HasRegMap {
  val io: AESTopIO

  implicit val p: Parameters
  def params: AESParams
  val clock: Clock
  val reset: Reset

  // Ports declare
  val active = Wire(new DecoupledIO(Bool()))
  val ikey0  = Reg(UInt(64.W))
  val ikey1  = Reg(UInt(64.W))
  val imsg0  = Reg(UInt(64.W))
  val imsg1  = Reg(UInt(64.W))

  val ocipher0 = Wire(UInt(64.W))
  val ocipher1 = Wire(UInt(64.W))  
  val oready   = Wire(Bool())

  // Module instance
  val impl = Module(new aes_bb())

  // Controller
  val rst_r   = Reg(Bool())
  val init_r  = Reg(Bool())
  val mode_r  = Reg(Bool())
  val enc_r   = Reg(Bool())
  
  val active_r = RegNext(active.valid)
  val counter_r = RegInit(0.U(4.W))

  // FSM
  val s_idle :: s_init :: s_enc :: s_wait :: s_done :: Nil = Enum(5)
  val state = RegInit(s_idle)
  
  when (state === s_idle && active_r) {
    state := s_init
  } .elsewhen (state === s_init) {
    when (counter_r === 15.U(4.W)) {
      state := s_enc
    } .otherwise {
      state := s_init
    }
  } .elsewhen (state === s_enc) {
    state := s_wait
  } .elsewhen (state === s_wait) {
    when (impl.io.o_finish === true.asBool) {
      state := s_done
    } .otherwise {
      state := s_wait
    } 
  } .elsewhen (state === s_done) {
      state := s_idle
  } .otherwise {
    state := s_idle
  }

  counter_r := Mux(state === s_enc, 0.U, counter_r + 1.U)

  rst_r   := state === s_idle && active_r
  init_r  := state === s_init
  enc_r   := state === s_enc

  active.ready := true.asBool

  // Connections declaration
  impl.io.i_clk := clock
  impl.io.i_rst := reset.asBool | rst_r

  impl.io.i_init := init_r
  impl.io.i_mode := mode_r
  impl.io.i_enc  := enc_r

  impl.io.i_key_AES := Cat(ikey1, ikey0)
  impl.io.i_msg_AES := Cat(imsg1, imsg0)

  oready     := impl.io.o_finish
  ocipher0   := impl.io.o_cipher_AES(63,0)
  ocipher1   := impl.io.o_cipher_AES(127,64)

  regmap(
    0x00 -> Seq(
      RegField.w(1, active)),
    0x08 -> Seq(
      RegField.w(1, mode_r)), 
    0x10 -> Seq(
      RegField.r(1, oready)),
    0x18 -> Seq(
      RegField.w(64, ikey0)),
    0x20 -> Seq(
      RegField.w(64, ikey1)),
    0x28 -> Seq(
      RegField.w(64, imsg0)),
    0x30 -> Seq(
      RegField.w(64, imsg1)),
    0x38 -> Seq(
      RegField.r(64, ocipher0)),
    0x40 -> Seq(
      RegField.r(64, ocipher1)), 

  )    
}
// DOC include end: GCD instance regmap

// DOC include start: GCD router
class AESTL(params: AESParams, beatBytes: Int)(implicit p: Parameters)
  extends TLRegisterRouter (
    base = params.address, 
    devname = "aes", 
    devcompat = Seq("ucbbar,aes"), 
    beatBytes = beatBytes)(
      new TLRegBundle(params, _) with AESTopIO)(
        new TLRegModule(params, _, _) with AESModule)

// DOC include start: GCD lazy trait
trait CanHavePeripheryAES { this: BaseSubsystem =>
  private val portName = "aes"

  // Only build if we are using the TL (nonAXI4) version
  val aes = p(AESKey) match {
    case Some(params) => {
      val aes = LazyModule(new AESTL(params, pbus.beatBytes)(p))
      pbus.coupleTo(portName) { aes.node := TLFragmenter(pbus.beatBytes, pbus.blockBytes) := _ }
      Some(aes)
    }
    case None => None
  }
}
// DOC include end: GCD lazy trait

// DOC include start: GCD imp trait
trait CanHavePeripheryAESModuleImp extends LazyModuleImp {
  val outer: CanHavePeripheryAES
  val aes_busy = outer.aes match {
    case Some(aes) => {
      val busy = IO(Output(Bool()))
      busy := aes.module.io.aes_busy
      Some(busy)
    }
    case None => None
  }
}

// DOC include end: GCD imp trait


// DOC include start: GCD config fragment
class WithAES(address: BigInt = 0x1000) extends Config((site, here, up) => {
  case AESKey => Some(AESParams(address = address))
})
// DOC include end: GCD config fragment

