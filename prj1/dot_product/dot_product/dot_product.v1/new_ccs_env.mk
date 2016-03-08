ifeq "$(CXX_HOME)" ""
CXX_HOME                                      := c:/PROGRA~2/MICROS~4.0/VC
export CXX_HOME
endif
ifeq "$(CXX_TYPE)" ""
CXX_TYPE                                      := msvc
export CXX_TYPE
endif
ifeq "$(CXX_VCO)" ""
CXX_VCO                                       := ixn
export CXX_VCO
endif
ifeq "$(PATH)" ""
PATH                                          := c:/PROGRA~2/MICROS~4.0/VC/../Common7/IDE;c:/PROGRA~2/MICROS~4.0/VC/bin;C:\PROGRA~1\CALYPT~1\CATAPU~1.126\Mgc_home\bin;C:\PROGRA~1\CALYPT~1\CATAPU~1.126\Mgc_home\lib;C:\PROGRA~1\CALYPT~1\CATAPU~1.126\Mgc_home\pkgs\sif\.lib;
export PATH
endif
ifeq "$(INCLUDE)" ""
INCLUDE                                       := C:/PROGRA~1/CALYPT~1/CATAPU~1.126/Mgc_home/shared/include;c:/Program Files (x86)/Microsoft Visual Studio 9.0/VC/Include;C:/Program Files/Microsoft SDKs/Windows/v6.0A/Include
export INCLUDE
endif
ifeq "$(LIB)" ""
LIB                                           := c:/Program Files (x86)/Microsoft Visual Studio 9.0/VC/Lib;C:/Program Files/Microsoft SDKs/Windows/v6.0A/Lib
export LIB
endif
ifeq "$(SystemRoot)" ""
SystemRoot                                    := C:\windows
export SystemRoot
endif
ifeq "$(SYN_DIR)" ""
SYN_DIR                                       := gate_synthesis_psr
export SYN_DIR
endif
ifeq "$(HLD_CONSTRAINT_FNAME)" ""
HLD_CONSTRAINT_FNAME                          := top_gate_constraints.cpp
export HLD_CONSTRAINT_FNAME
endif
ifeq "$(ModelSim_Path)" ""
ModelSim_Path                                 := 
export ModelSim_Path
endif
ifeq "$(ModelSim_Flags)" ""
ModelSim_Flags                                := 
export ModelSim_Flags
endif
ifeq "$(ModelSim_RADIX)" ""
ModelSim_RADIX                                := hex
export ModelSim_RADIX
endif
ifeq "$(ModelSim_MSIM_AC_TYPES)" ""
ModelSim_MSIM_AC_TYPES                        := true
export ModelSim_MSIM_AC_TYPES
endif
ifeq "$(ModelSim_VCOM_OPTS)" ""
ModelSim_VCOM_OPTS                            := 
export ModelSim_VCOM_OPTS
endif
ifeq "$(ModelSim_VLOG_OPTS)" ""
ModelSim_VLOG_OPTS                            := 
export ModelSim_VLOG_OPTS
endif
ifeq "$(ModelSim_SCCOM_OPTS)" ""
ModelSim_SCCOM_OPTS                           := -g -x c++
export ModelSim_SCCOM_OPTS
endif
ifeq "$(ModelSim_FORCE_32BIT)" ""
ModelSim_FORCE_32BIT                          := false
export ModelSim_FORCE_32BIT
endif
ifeq "$(ModelSim_VSIM_OPTS)" ""
ModelSim_VSIM_OPTS                            := -t ps -novopt
export ModelSim_VSIM_OPTS
endif
ifeq "$(ModelSim_GATE_VSIM_OPTS)" ""
ModelSim_GATE_VSIM_OPTS                       := +notimingchecks -sdfnoerror -noglitch
export ModelSim_GATE_VSIM_OPTS
endif
ifeq "$(ModelSim_DEF_MODELSIM_INI)" ""
ModelSim_DEF_MODELSIM_INI                     := 
export ModelSim_DEF_MODELSIM_INI
endif
ifeq "$(ModelSim_SHOW_LIST)" ""
ModelSim_SHOW_LIST                            := false
export ModelSim_SHOW_LIST
endif
ifeq "$(ModelSim_MSIM_DOFILE)" ""
ModelSim_MSIM_DOFILE                          := 
export ModelSim_MSIM_DOFILE
endif
ifeq "$(ModelSim_ENABLE_OLD_MSIM_FLOW)" ""
ModelSim_ENABLE_OLD_MSIM_FLOW                 := false
export ModelSim_ENABLE_OLD_MSIM_FLOW
endif
ifeq "$(ModelSim_VCD_SIZE_LIMIT)" ""
ModelSim_VCD_SIZE_LIMIT                       := 2000
export ModelSim_VCD_SIZE_LIMIT
endif
ifeq "$(NCSim_NC_ROOT)" ""
NCSim_NC_ROOT                                 := $(NC_ROOT)
export NCSim_NC_ROOT
endif
ifeq "$(NCSim_NCVHDL_OPTS)" ""
NCSim_NCVHDL_OPTS                             := -v93
export NCSim_NCVHDL_OPTS
endif
ifeq "$(NCSim_NCVLOG_OPTS)" ""
NCSim_NCVLOG_OPTS                             := 
export NCSim_NCVLOG_OPTS
endif
ifeq "$(NCSim_NCSC_OPTS)" ""
NCSim_NCSC_OPTS                               := 
export NCSim_NCSC_OPTS
endif
ifeq "$(NCSim_NCSC_CXX_OPTS)" ""
NCSim_NCSC_CXX_OPTS                           := -x c++ -Wno-deprecated
export NCSim_NCSC_CXX_OPTS
endif
ifeq "$(NCSim_NCELAB_OPTS)" ""
NCSim_NCELAB_OPTS                             := 
export NCSim_NCELAB_OPTS
endif
ifeq "$(NCSim_NCSIM_OPTS)" ""
NCSim_NCSIM_OPTS                              := 
export NCSim_NCSIM_OPTS
endif
ifeq "$(NCSim_NCSIM_TIMESCALE)" ""
NCSim_NCSIM_TIMESCALE                         := 1 ns / 1 ps
export NCSim_NCSIM_TIMESCALE
endif
ifeq "$(NCSim_NCSIM_GCCVERSION)" ""
NCSim_NCSIM_GCCVERSION                        := 4.1
export NCSim_NCSIM_GCCVERSION
endif
ifeq "$(NCSim_FORCE_32BIT)" ""
NCSim_FORCE_32BIT                             := false
export NCSim_FORCE_32BIT
endif
ifeq "$(NCSim_GCC_HOME)" ""
NCSim_GCC_HOME                                := 
export NCSim_GCC_HOME
endif
ifeq "$(OSCI_SYSTEMC_INCLUDE)" ""
OSCI_SYSTEMC_INCLUDE                          := C:/PROGRA~1/CALYPT~1/CATAPU~1.126/Mgc_home/shared/include
export OSCI_SYSTEMC_INCLUDE
endif
ifeq "$(OSCI_SYSTEMC_LIB)" ""
OSCI_SYSTEMC_LIB                              := C:/PROGRA~1/CALYPT~1/CATAPU~1.126/Mgc_home/shared/lib/$(CXX_OS)/$(CXX_TYPE)
export OSCI_SYSTEMC_LIB
endif
ifeq "$(OSCI_SYSTEMC_NAME)" ""
OSCI_SYSTEMC_NAME                             := systemc
export OSCI_SYSTEMC_NAME
endif
ifeq "$(OSCI_COMP_FLAGS)" ""
OSCI_COMP_FLAGS                               := 
export OSCI_COMP_FLAGS
endif
ifeq "$(OSCI_USE_32BIT_COMPILER)" ""
OSCI_USE_32BIT_COMPILER                       := true
export OSCI_USE_32BIT_COMPILER
endif
ifeq "$(OSCI_GDBGUI)" ""
OSCI_GDBGUI                                   := ddd
export OSCI_GDBGUI
endif
ifeq "$(Novas_NOVAS_INST_DIR)" ""
Novas_NOVAS_INST_DIR                          := $(NOVAS_INST_DIR)
export Novas_NOVAS_INST_DIR
endif
ifeq "$(Novas_NOVAS_PLATFORM)" ""
Novas_NOVAS_PLATFORM                          := LINUX
export Novas_NOVAS_PLATFORM
endif
ifeq "$(Novas_NOVAS_MSIM_PLI)" ""
Novas_NOVAS_MSIM_PLI                          := modelsim_fli61
export Novas_NOVAS_MSIM_PLI
endif
ifeq "$(Novas_NOVAS_NCSIM_VER)" ""
Novas_NOVAS_NCSIM_VER                         := nc57_vhdl
export Novas_NOVAS_NCSIM_VER
endif
ifeq "$(Novas_NOVAS_NCSIM_PLI)" ""
Novas_NOVAS_NCSIM_PLI                         := ncsc57/lib-linux_gcc3_23
export Novas_NOVAS_NCSIM_PLI
endif
ifeq "$(Novas_NOVAS_NCSIM_LDV)" ""
Novas_NOVAS_NCSIM_LDV                         := ius_vhpi_latest
export Novas_NOVAS_NCSIM_LDV
endif
ifeq "$(Novas_NOVAS_NCSIM_FSDBW)" ""
Novas_NOVAS_NCSIM_FSDBW                       := LINUX_GNU_296
export Novas_NOVAS_NCSIM_FSDBW
endif
ifeq "$(Valgrind_VALGRIND)" ""
Valgrind_VALGRIND                             := /usr/opt/bin/valgrind
export Valgrind_VALGRIND
endif
ifeq "$(Valgrind_VALGRIND_OPTS)" ""
Valgrind_VALGRIND_OPTS                        := --demangle=yes --leak-check=no --undef-value-errors=yes
export Valgrind_VALGRIND_OPTS
endif
ifeq "$(Vista_VISTA_HOME)" ""
Vista_VISTA_HOME                              := $(VISTA_HOME)
export Vista_VISTA_HOME
endif
ifeq "$(Vista_MODEL_BUILDER_HOME)" ""
Vista_MODEL_BUILDER_HOME                      := $(MODEL_BUILDER_HOME)
export Vista_MODEL_BUILDER_HOME
endif
ifeq "$(VCS_VCS_HOME)" ""
VCS_VCS_HOME                                  := $(VCS_HOME)
export VCS_VCS_HOME
endif
ifeq "$(VCS_COMP_FLAGS)" ""
VCS_COMP_FLAGS                                := -g
export VCS_COMP_FLAGS
endif
ifeq "$(VCS_FORCE_32BIT)" ""
VCS_FORCE_32BIT                               := false
export VCS_FORCE_32BIT
endif
ifeq "$(VCS_VCS_GCC_VER)" ""
VCS_VCS_GCC_VER                               := 4.2.2
export VCS_VCS_GCC_VER
endif
ifeq "$(VCS_VHDLAN_OPTS)" ""
VCS_VHDLAN_OPTS                               := 
export VCS_VHDLAN_OPTS
endif
ifeq "$(VCS_VLOGAN_OPTS)" ""
VCS_VLOGAN_OPTS                               := +v2k
export VCS_VLOGAN_OPTS
endif
ifeq "$(VCS_VCSELAB_OPTS)" ""
VCS_VCSELAB_OPTS                              := -debug_all -timescale=1ps/1ps
export VCS_VCSELAB_OPTS
endif
ifeq "$(VCS_VCSSIM_OPTS)" ""
VCS_VCSSIM_OPTS                               := 
export VCS_VCSSIM_OPTS
endif
ifeq "$(SCVerify_RESET_CYCLES)" ""
SCVerify_RESET_CYCLES                         := 2
export SCVerify_RESET_CYCLES
endif
ifeq "$(SCVerify_SYNC_ALL_RESETS)" ""
SCVerify_SYNC_ALL_RESETS                      := true
export SCVerify_SYNC_ALL_RESETS
endif
ifeq "$(SCVerify_TB_STACKSIZE)" ""
SCVerify_TB_STACKSIZE                         := 64000000
export SCVerify_TB_STACKSIZE
endif
ifeq "$(SCVerify_INVOKE_ARGS)" ""
SCVerify_INVOKE_ARGS                          := 
export SCVerify_INVOKE_ARGS
endif
ifeq "$(SCVerify_REPLAY_ARGS)" ""
SCVerify_REPLAY_ARGS                          := 
export SCVerify_REPLAY_ARGS
endif
ifeq "$(SCVerify_MSIM_DEBUG)" ""
SCVerify_MSIM_DEBUG                           := false
export SCVerify_MSIM_DEBUG
endif
ifeq "$(SCVerify_MAX_ERROR_CNT)" ""
SCVerify_MAX_ERROR_CNT                        := 0
export SCVerify_MAX_ERROR_CNT
endif
ifeq "$(SCVerify_DEADLOCK_DETECTION)" ""
SCVerify_DEADLOCK_DETECTION                   := true
export SCVerify_DEADLOCK_DETECTION
endif
ifeq "$(SCVerify_INCL_DIRS)" ""
SCVerify_INCL_DIRS                            := 
export SCVerify_INCL_DIRS
endif
ifeq "$(SCVerify_LINK_LIBPATHS)" ""
SCVerify_LINK_LIBPATHS                        := 
export SCVerify_LINK_LIBPATHS
endif
ifeq "$(SCVerify_LINK_LIBNAMES)" ""
SCVerify_LINK_LIBNAMES                        := 
export SCVerify_LINK_LIBNAMES
endif
ifeq "$(SCVerify_USE_MSIM)" ""
SCVerify_USE_MSIM                             := true
export SCVerify_USE_MSIM
endif
ifeq "$(SCVerify_USE_OSCI)" ""
SCVerify_USE_OSCI                             := true
export SCVerify_USE_OSCI
endif
ifeq "$(SCVerify_USE_NCSIM)" ""
SCVerify_USE_NCSIM                            := false
export SCVerify_USE_NCSIM
endif
ifeq "$(SCVerify_USE_VISTA)" ""
SCVerify_USE_VISTA                            := false
export SCVerify_USE_VISTA
endif
ifeq "$(SCVerify_USE_VCS)" ""
SCVerify_USE_VCS                              := false
export SCVerify_USE_VCS
endif
ifeq "$(SCVerify_DISABLE_EMPTY_INPUTS)" ""
SCVerify_DISABLE_EMPTY_INPUTS                 := false
export SCVerify_DISABLE_EMPTY_INPUTS
endif
ifeq "$(SCVerify_ENABLE_REPLAY_VERIFICATION)" ""
SCVerify_ENABLE_REPLAY_VERIFICATION           := false
export SCVerify_ENABLE_REPLAY_VERIFICATION
endif
ifeq "$(SCVerify_IDLE_SYNCHRONIZATION_MODE)" ""
SCVerify_IDLE_SYNCHRONIZATION_MODE            := false
export SCVerify_IDLE_SYNCHRONIZATION_MODE
endif
ifeq "$(SCVerify_MISMATCHED_OUTPUTS_ONLY)" ""
SCVerify_MISMATCHED_OUTPUTS_ONLY              := true
export SCVerify_MISMATCHED_OUTPUTS_ONLY
endif
ifeq "$(Precision_Path)" ""
Precision_Path                                := can't read "PRECISION_HOME": no such variable
export Precision_Path
endif
ifeq "$(Precision_Flags)" ""
Precision_Flags                               := 
export Precision_Flags
endif
ifeq "$(Precision_addio)" ""
Precision_addio                               := true
export Precision_addio
endif
ifeq "$(Precision_retiming)" ""
Precision_retiming                            := false
export Precision_retiming
endif
ifeq "$(Precision_run_pnr)" ""
Precision_run_pnr                             := false
export Precision_run_pnr
endif
ifeq "$(Precision_newgui)" ""
Precision_newgui                              := true
export Precision_newgui
endif
ifeq "$(Precision_rtlplus)" ""
Precision_rtlplus                             := false
export Precision_rtlplus
endif
ifeq "$(Precision_OutputEDIF)" ""
Precision_OutputEDIF                          := true
export Precision_OutputEDIF
endif
ifeq "$(Precision_bottom_up_flow)" ""
Precision_bottom_up_flow                      := false
export Precision_bottom_up_flow
endif
ifeq "$(Precision_PlaceAndRouteInstallPath)" ""
Precision_PlaceAndRouteInstallPath            := 
export Precision_PlaceAndRouteInstallPath
endif
ifeq "$(Precision_GatherDetailedTimingData)" ""
Precision_GatherDetailedTimingData            := true
export Precision_GatherDetailedTimingData
endif
ifeq "$(Precision_TimingReportingMode)" ""
Precision_TimingReportingMode                 := p2p
export Precision_TimingReportingMode
endif
ifeq "$(Precision_EnableClockGating)" ""
Precision_EnableClockGating                   := false
export Precision_EnableClockGating
endif
ifeq "$(Altera_QUARTUS_ROOTDIR)" ""
Altera_QUARTUS_ROOTDIR                        := C:/altera/15.0/quartus
export Altera_QUARTUS_ROOTDIR
endif
ifeq "$(Altera_QUARTUS_LIB)" ""
Altera_QUARTUS_LIB                            := $(QUARTUS_LIB)
export Altera_QUARTUS_LIB
endif
ifeq "$(LINK_LIBPATHS)" ""
LINK_LIBPATHS                                 := 
export LINK_LIBPATHS
endif
ifeq "$(LINK_LIBNAMES)" ""
LINK_LIBNAMES                                 := 
export LINK_LIBNAMES
endif
ifeq "$(INCL_DIRS)" ""
INCL_DIRS                                     := 
export INCL_DIRS
endif
