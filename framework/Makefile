#########################################################################################
# fpga prototype makefile
#########################################################################################

#########################################################################################
# general path variables
#########################################################################################
base_dir=$(abspath ..)
sim_dir=$(abspath .)

# do not generate simulation files
sim_name := none

#########################################################################################
# include shared variables
#########################################################################################
SUB_PROJECT ?= vcu118_Final

#########################################################################################
# VCU118 configuration
#########################################################################################
ifeq ($(SUB_PROJECT),vcu118_rocketsmall)
	SBT_PROJECT       ?= framework
	MODEL             ?= VCU118Harness
	VLOG_MODEL        ?= VCU118Harness
	MODEL_PACKAGE     ?= framework.fpga.vcu118
	CONFIG            ?= SmallRocketVCU118Config
	CONFIG_PACKAGE    ?= framework.fpga.vcu118
	GENERATOR_PACKAGE ?= chipyard
	TB                ?= none # unused
	TOP               ?= ChipTop
	BOARD             ?= vcu118
	FPGA_BRAND        ?= xilinx
endif

ifeq ($(SUB_PROJECT),vcu118_rocketsmalSerialmem)
	SBT_PROJECT       ?= framework
	MODEL             ?= VCU118woDDRHarness
	VLOG_MODEL        ?= VCU118woDDRHarness
	MODEL_PACKAGE     ?= framework.fpga.vcu118
	CONFIG            ?= SmallRocketSerialMemVCU118Config
	CONFIG_PACKAGE    ?= framework.fpga.vcu118
	GENERATOR_PACKAGE ?= chipyard
	TB                ?= none # unused
	TOP               ?= ChipTop
	BOARD             ?= vcu118
	FPGA_BRAND        ?= xilinx
endif

ifeq ($(SUB_PROJECT),vcu118_MCRocket_DDR)
	SBT_PROJECT       ?= framework
	MODEL             ?= VCU118Harness
	VLOG_MODEL        ?= VCU118Harness
	MODEL_PACKAGE     ?= framework.fpga.vcu118
	CONFIG            ?= FourCoreRocketDDRVCU118Config
	CONFIG_PACKAGE    ?= framework.fpga.vcu118
	GENERATOR_PACKAGE ?= chipyard
	TB                ?= none # unused
	TOP               ?= ChipTop
	BOARD             ?= vcu118
	FPGA_BRAND        ?= xilinx
endif

ifeq ($(SUB_PROJECT),vcu118_MCRocket_Serial)
	SBT_PROJECT       ?= framework
	MODEL             ?= VCU118woDDRHarness
	VLOG_MODEL        ?= VCU118woDDRHarness
	MODEL_PACKAGE     ?= framework.fpga.vcu118
	CONFIG            ?= FourCoreRocketSerialVCU118Config
	CONFIG_PACKAGE    ?= framework.fpga.vcu118
	GENERATOR_PACKAGE ?= chipyard
	TB                ?= none # unused
	TOP               ?= ChipTop
	BOARD             ?= vcu118
	FPGA_BRAND        ?= xilinx
endif

ifeq ($(SUB_PROJECT),vcu118_Final)
	SBT_PROJECT       ?= framework
	MODEL             ?= VCU118woDDRHarness
	VLOG_MODEL        ?= VCU118woDDRHarness
	MODEL_PACKAGE     ?= framework.fpga.vcu118
	CONFIG            ?= FourCorePrivateChannelConfig
	CONFIG_PACKAGE    ?= framework.fpga.vcu118
	GENERATOR_PACKAGE ?= chipyard
	TB                ?= none # unused
	TOP               ?= ChipTop
	BOARD             ?= vcu118
	FPGA_BRAND        ?= xilinx
endif

ifeq ($(SUB_PROJECT),vcu118_Tiny)
	SBT_PROJECT       ?= framework
	MODEL             ?= USBATCHarness
	VLOG_MODEL        ?= USBATCHarness
	MODEL_PACKAGE     ?= framework.fpga.vcu118
	CONFIG            ?= USBACTCoreConfig
	CONFIG_PACKAGE    ?= framework.fpga.vcu118
	GENERATOR_PACKAGE ?= chipyard
	TB                ?= none # unused
	TOP               ?= ChipTop
	BOARD             ?= vcu118
	FPGA_BRAND        ?= xilinx
endif

#########################################################################################
# Arty configuration
#########################################################################################
ifeq ($(SUB_PROJECT),arty100t_rockettiny)
	# TODO: Fix with Arty
	SBT_PROJECT       ?= framework
	MODEL             ?= Arty100TwoDDRHarness
	VLOG_MODEL        ?= Arty100TwoDDRHarness
	MODEL_PACKAGE     ?= framework.fpga.arty100t
	CONFIG            ?= SmallRocketArty100TConfig
	CONFIG_PACKAGE    ?= framework.fpga.arty100t
	GENERATOR_PACKAGE ?= chipyard
	TB                ?= none # unused
	TOP               ?= ChipTop
	BOARD             ?= arty_a7_100
	FPGA_BRAND        ?= xilinx
endif

ifeq ($(SUB_PROJECT),arty100t_4rocketsmall)
	# TODO: Fix with Arty
	SBT_PROJECT       ?= framework
	MODEL             ?= Arty100TwoDDRHarness
	VLOG_MODEL        ?= Arty100TwoDDRHarness
	MODEL_PACKAGE     ?= framework.fpga.arty100t
	CONFIG            ?= Rocket4Arty100TConfig
	CONFIG_PACKAGE    ?= framework.fpga.arty100t
	GENERATOR_PACKAGE ?= chipyard
	TB                ?= none # unused
	TOP               ?= ChipTop
	BOARD             ?= arty_a7_100
	FPGA_BRAND        ?= xilinx
endif

ifeq ($(SUB_PROJECT),arty100t_rocketgcsmall)
	# TODO: Fix with Arty
	SBT_PROJECT       ?= framework
	MODEL             ?= Arty100THarness
	VLOG_MODEL        ?= Arty100THarness
	MODEL_PACKAGE     ?= framework.fpga.arty100t
	CONFIG            ?= SmallRocketGCArty100TConfig
	CONFIG_PACKAGE    ?= framework.fpga.arty100t
	GENERATOR_PACKAGE ?= chipyard
	TB                ?= none # unused
	TOP               ?= ChipTop
	BOARD             ?= arty_a7_100
	FPGA_BRAND        ?= xilinx
endif

ifeq ($(SUB_PROJECT),arty100t_rockettiny)
	# TODO: Fix with Arty
	SBT_PROJECT       ?= framework
	MODEL             ?= Arty100TwoDDRHarness
	VLOG_MODEL        ?= Arty100TwoDDRHarness
	MODEL_PACKAGE     ?= framework.fpga.arty100t
	CONFIG            ?= Arty100TTinyRocketConfig
	CONFIG_PACKAGE    ?= framework.fpga.arty100t
	GENERATOR_PACKAGE ?= chipyard
	TB                ?= none # unused
	TOP               ?= ChipTop
	BOARD             ?= arty_a7_100
	FPGA_BRAND        ?= xilinx
endif

# Featured configurations
ifeq ($(SUB_PROJECT),arty100t_sha3rocket)
	# TODO: Fix with Arty
	SBT_PROJECT       ?= framework
	MODEL             ?= Arty100THarness
	VLOG_MODEL        ?= Arty100THarness
	MODEL_PACKAGE     ?= framework.fpga.arty100t
	CONFIG            ?= SmallSha3RocketArty100TConfig
	CONFIG_PACKAGE    ?= framework.fpga.arty100t
	GENERATOR_PACKAGE ?= chipyard
	TB                ?= none # unused
	TOP               ?= ChipTop
	BOARD             ?= arty_a7_100
	FPGA_BRAND        ?= xilinx
endif

#########################################################################################
# VC707 configuration
#########################################################################################
ifeq ($(SUB_PROJECT),vc707_rocketsmall)
	SBT_PROJECT       ?= framework
	MODEL             ?= VC707Harness
	VLOG_MODEL        ?= VC707Harness
	MODEL_PACKAGE     ?= framework.fpga.vc707
	CONFIG            ?= SmallRocketVC707Config
	CONFIG_PACKAGE    ?= framework.fpga.vc707
	GENERATOR_PACKAGE ?= chipyard
	TB                ?= none # unused
	TOP               ?= ChipTop
	BOARD             ?= vc707
	FPGA_BRAND        ?= xilinx
endif

ifeq ($(SUB_PROJECT),vc707_rocketsmalSerialmem)
	SBT_PROJECT       ?= framework
	MODEL             ?= VC707woDDRHarness
	VLOG_MODEL        ?= VC707woDDRHarness
	MODEL_PACKAGE     ?= framework.fpga.vc707
	CONFIG            ?= SmallRocketSerialMemVC707Config
	CONFIG_PACKAGE    ?= framework.fpga.vc707
	GENERATOR_PACKAGE ?= chipyard
	TB                ?= none # unused
	TOP               ?= ChipTop
	BOARD             ?= vc707
	FPGA_BRAND        ?= xilinx
endif

ifeq ($(SUB_PROJECT),vc707_rocketsmalMTSerialmem)
	SBT_PROJECT       ?= framework
	MODEL             ?= VC707woDDRHarness
	VLOG_MODEL        ?= VC707woDDRHarness
	MODEL_PACKAGE     ?= framework.fpga.vc707
	CONFIG            ?= SmallRocketMTSerialMemVC707Config
	CONFIG_PACKAGE    ?= framework.fpga.vc707
	GENERATOR_PACKAGE ?= chipyard
	TB                ?= none # unused
	TOP               ?= ChipTop
	BOARD             ?= vc707
	FPGA_BRAND        ?= xilinx
endif

ifeq ($(SUB_PROJECT),vc707_rocketsmalMCDDRmem)
	SBT_PROJECT       ?= framework
	MODEL             ?= VC707Harness
	VLOG_MODEL        ?= VC707Harness
	MODEL_PACKAGE     ?= framework.fpga.vc707
	CONFIG            ?= SmallRocketMCDDRVC707Config
	CONFIG_PACKAGE    ?= framework.fpga.vc707
	GENERATOR_PACKAGE ?= chipyard
	TB                ?= none # unused
	TOP               ?= ChipTop
	BOARD             ?= vc707
	FPGA_BRAND        ?= xilinx
endif

ifeq ($(SUB_PROJECT),vc707_rocketAXI)
	SBT_PROJECT       ?= framework
	MODEL             ?= VC707woDDRHarness
	VLOG_MODEL        ?= VC707woDDRHarness
	MODEL_PACKAGE     ?= framework.fpga.vc707
	CONFIG            ?= SmallRocketAXIVC707Config
	CONFIG_PACKAGE    ?= framework.fpga.vc707
	GENERATOR_PACKAGE ?= chipyard
	TB                ?= none # unused
	TOP               ?= ChipTop
	BOARD             ?= vc707
	FPGA_BRAND        ?= xilinx
endif

ifeq ($(SUB_PROJECT),vc707_rocketAXITest)
	SBT_PROJECT       ?= framework
	MODEL             ?= VC707woDDRHarness
	VLOG_MODEL        ?= VC707woDDRHarness
	MODEL_PACKAGE     ?= framework.fpga.vc707
	CONFIG            ?= SmallRocketAXITestVC707Config
	CONFIG_PACKAGE    ?= framework.fpga.vc707
	GENERATOR_PACKAGE ?= chipyard
	TB                ?= none # unused
	TOP               ?= ChipTop
	BOARD             ?= vc707
	FPGA_BRAND        ?= xilinx
endif

ifeq ($(SUB_PROJECT),vc707_MC)
	SBT_PROJECT       ?= framework
	MODEL             ?= VC707woDDRHarness
	VLOG_MODEL        ?= VC707woDDRHarness
	MODEL_PACKAGE     ?= framework.fpga.vc707
	CONFIG            ?= SmallRocketMTOptimizedMemVC707Config
	CONFIG_PACKAGE    ?= framework.fpga.vc707
	GENERATOR_PACKAGE ?= chipyard
	TB                ?= none # unused
	TOP               ?= ChipTop
	BOARD             ?= vc707
	FPGA_BRAND        ?= xilinx
endif

ifeq ($(SUB_PROJECT),vc707_TestRocket)
	SBT_PROJECT       ?= framework
	MODEL             ?= VC707woDDRHarness
	VLOG_MODEL        ?= VC707woDDRHarness
	MODEL_PACKAGE     ?= framework.fpga.vc707
	CONFIG            ?= SmallRocketTestVC707Config
	CONFIG_PACKAGE    ?= framework.fpga.vc707
	GENERATOR_PACKAGE ?= chipyard
	TB                ?= none # unused
	TOP               ?= ChipTop
	BOARD             ?= vc707
	FPGA_BRAND        ?= xilinx
endif

ifeq ($(SUB_PROJECT),vc707_TestCVA6)
	SBT_PROJECT       ?= framework
	MODEL             ?= VC707Harness
	VLOG_MODEL        ?= VC707Harness
	MODEL_PACKAGE     ?= framework.fpga.vc707
	CONFIG            ?= CVA6TestVC707Config
	CONFIG_PACKAGE    ?= framework.fpga.vc707
	GENERATOR_PACKAGE ?= chipyard
	TB                ?= none # unused
	TOP               ?= ChipTop
	BOARD             ?= vc707
	FPGA_BRAND        ?= xilinx
endif



################### End my configurations #################################################

include $(base_dir)/variables.mk

# default variables to build the arty example
# setup the board to use

.PHONY: default
default: $(mcs)

#########################################################################################
# misc. directories
#########################################################################################
fpga_dir := $(base_dir)/fpga/fpga-shells/$(FPGA_BRAND)
fpga_common_script_dir := $(fpga_dir)/common/tcl

#########################################################################################
# setup misc. sim files
#########################################################################################
# copy files but ignore *.h files in *.f (match vcs)
$(sim_files): $(SIM_FILE_REQS) $(ALL_MODS_FILELIST) | $(GEN_COLLATERAL_DIR)
	-cp -f $(SIM_FILE_REQS) $(GEN_COLLATERAL_DIR)
	touch $@
	$(foreach file,\
		$(SIM_FILE_REQS),\
		$(if $(filter %.h,$(file)),\
			,\
			echo "$(addprefix $(GEN_COLLATERAL_DIR)/, $(notdir $(file)))" >> $@;))

#########################################################################################
# import other necessary rules and variables
#########################################################################################
include $(base_dir)/common.mk

#########################################################################################
# copy from other directory
#########################################################################################
all_vsrcs := \
	$(base_dir)/generators/sifive-blocks/vsrc/SRLatch.v

#########################################################################################
# vivado rules
#########################################################################################
# combine all sources into single .f
synth_list_f := $(build_dir)/$(long_name).vsrcs.f
$(synth_list_f): $(sim_common_files) $(all_vsrcs)
	$(foreach file,$(all_vsrcs),echo "$(file)" >> $@;)
	cat $(sim_common_files) >> $@

BIT_FILE := $(build_dir)/obj/$(MODEL).bit
$(BIT_FILE): $(synth_list_f)
	cd $(build_dir); vivado \
		-nojournal -mode batch \
		-source $(fpga_common_script_dir)/vivado.tcl \
		-tclargs \
			-top-module "$(MODEL)" \
			-F "$(synth_list_f)" \
			-board "$(BOARD)" \
			-ip-vivado-tcls "$(shell find '$(build_dir)' -name '*.vivado.tcl')"

.PHONY: bitstream
bitstream: clean_cache $(BIT_FILE)

.PHONY: debug-bitstream
debug-bitstream: $(build_dir)/obj/post_synth.dcp
	cd $(build_dir); vivado \
		-nojournal -mode batch \
		-source $(sim_dir)/scripts/run_impl_bitstream.tcl \
		-tclargs \
			$(build_dir)/obj/post_synth.dcp \
			$(BOARD) \
			$(build_dir)/debug_obj \
			$(fpga_common_script_dir)

.PHONY: download_bitstream
download_bitstream:
	if [ $(BOARD) = arty_a7_100 ]; then \
		vivado -mode batch -nolog -nojournal -notrace \
			-source $(sim_dir)/src/main/resources/arty100t/program.tcl \
			-tclargs $(build_dir)/obj/$(MODEL).bit; \
	elif [ $(BOARD) = vc707 ]; then \
		vivado -mode batch -nolog -nojournal -notrace \
			-source $(sim_dir)/src/main/resources/vc707/program.tcl \
			-tclargs $(build_dir)/obj/$(MODEL).bit; \
	elif [ $(BOARD) = vcu118 ]; then \
		vivado -mode batch -nolog -nojournal -notrace \
			-source $(sim_dir)/src/main/resources/vcu118/program.tcl \
			-tclargs $(build_dir)/obj/$(MODEL).bit; \
	else \
		vivado -mode batch -nolog -nojournal -notrace \
			-source $(sim_dir)/scripts/program.tcl \
			-tclargs $(build_dir)/obj/$(MODEL).bit; \
    fi


.PHONY: clean_cache
clean_cache:
	rm -f $(base_dir)/.classpath_cache/*

.PHONY: gen_config
gen_config:
	rm -f ./config/*
	ln -s $(base_dir)/generators/chipyard/src/main/scala/config/RoCCTutorialConfig.scala $(sim_dir)/config/
	ln -s $(base_dir)/generators/chipyard/src/main/scala/config/CustomCoresConfig.scala $(sim_dir)/config/
	ln -s $(base_dir)/generators/rocket-chip/src/main/scala/devices/tilelink/BootROM.scala $(sim_dir)/config/

.PHONY: everything
everything: bitstream download_bitstream

#########################################################################################
# general cleanup rules
#########################################################################################
.PHONY: clean
clean:
	rm -f $(base_dir)/.classpath_cache/*
	rm -rf $(gen_dir)
