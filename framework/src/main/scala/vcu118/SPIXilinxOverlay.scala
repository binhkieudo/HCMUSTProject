package framework.fpga.vcu118

import chisel3._
import chisel3.util.Cat
import freechips.rocketchip.diplomacy._
import sifive.fpgashells.shell._
import sifive.fpgashells.ip.xilinx._
import sifive.fpgashells.shell.xilinx.XilinxShell

abstract class SPIXilinxPlacedOverlay(name: String, di: SPIDesignInput, si: SPIShellInput)
  extends SPIPlacedOverlay(name, di, si)
{
  def shell: XilinxShell

  //val dqiVec = VecInit.tabulate(4)(j =>tlqspiSink.bundle.dq(j))
  InModuleBody {
    val tlspiport = tlspiSink.bundle
    spiSource.bundle.sck := tlspiport.sck
    spiSource.bundle.dq.zip(tlspiport.dq).foreach { case(outerBundle, innerBundle) =>
      outerBundle.o := innerBundle.o
      outerBundle.oe := innerBundle.oe
      innerBundle.i := RegNext(RegNext(outerBundle.i))
    }
    spiSource.bundle.cs := tlspiport.cs
  }

  shell { InModuleBody {
    val spi_sck = spiSink.bundle.sck
    val spi_cs = spiSink.bundle.cs(0)

    val spi_dq_i = Wire(Vec(4, Bool()))
    val spi_dq_o = Wire(Vec(4, Bool()))

    spiSink.bundle.dq.zipWithIndex.foreach {
      case(pin, idx) =>
        spi_dq_o(idx) := pin.o
        pin.i := spi_dq_i(idx)
    }

    
    UIntToAnalog(spi_sck, io.spi_clk, true.B)
    UIntToAnalog(spi_cs, io.spi_cs, true.B)
    UIntToAnalog(spi_dq_o(0), io.spi_dat(0), true.B)
    spi_dq_i := Seq(false.B, AnalogToUInt(io.spi_dat(1)).asBool, false.B, false.B)
  } }
}

