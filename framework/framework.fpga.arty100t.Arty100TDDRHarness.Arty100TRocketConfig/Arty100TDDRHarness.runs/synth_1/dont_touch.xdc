# This file is automatically generated.
# It contains project source information necessary for synthesis and implementation.

# XDC: /home/binhkieudo/Workspace/tmp/HCMUSTProject/fpga/fpga-shells/xilinx/arty_a7_100/constraints/arty-config.xdc

# XDC: /home/binhkieudo/Workspace/tmp/HCMUSTProject/fpga/fpga-shells/xilinx/arty_a7_100/constraints/arty-master.xdc

# XDC: /home/binhkieudo/Workspace/tmp/HCMUSTProject/framework/generated-src/framework.fpga.arty100t.Arty100TDDRHarness.Arty100TRocketConfig/framework.fpga.arty100t.Arty100TDDRHarness.Arty100TRocketConfig.shell.sdc

# XDC: /home/binhkieudo/Workspace/tmp/HCMUSTProject/framework/generated-src/framework.fpga.arty100t.Arty100TDDRHarness.Arty100TRocketConfig/framework.fpga.arty100t.Arty100TDDRHarness.Arty100TRocketConfig.shell.xdc

# IP: /home/binhkieudo/Workspace/tmp/HCMUSTProject/framework/generated-src/framework.fpga.arty100t.Arty100TDDRHarness.Arty100TRocketConfig/obj/ip/harnessSysPLL/harnessSysPLL.xci
set_property KEEP_HIERARCHY SOFT [get_cells -hier -filter {REF_NAME==harnessSysPLL || ORIG_REF_NAME==harnessSysPLL} -quiet] -quiet

# XDC: /home/binhkieudo/Workspace/tmp/HCMUSTProject/framework/generated-src/framework.fpga.arty100t.Arty100TDDRHarness.Arty100TRocketConfig/obj/ip/harnessSysPLL/harnessSysPLL_board.xdc
set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==harnessSysPLL || ORIG_REF_NAME==harnessSysPLL} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: /home/binhkieudo/Workspace/tmp/HCMUSTProject/framework/generated-src/framework.fpga.arty100t.Arty100TDDRHarness.Arty100TRocketConfig/obj/ip/harnessSysPLL/harnessSysPLL.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==harnessSysPLL || ORIG_REF_NAME==harnessSysPLL} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: /home/binhkieudo/Workspace/tmp/HCMUSTProject/framework/generated-src/framework.fpga.arty100t.Arty100TDDRHarness.Arty100TRocketConfig/obj/ip/harnessSysPLL/harnessSysPLL_late.xdc
#dup# set_property KEEP_HIERARCHY SOFT [get_cells [split [join [get_cells -hier -filter {REF_NAME==harnessSysPLL || ORIG_REF_NAME==harnessSysPLL} -quiet] {/inst } ]/inst ] -quiet] -quiet

# XDC: /home/binhkieudo/Workspace/tmp/HCMUSTProject/framework/generated-src/framework.fpga.arty100t.Arty100TDDRHarness.Arty100TRocketConfig/obj/ip/harnessSysPLL/harnessSysPLL_ooc.xdc
