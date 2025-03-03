//  Catapult University Version 2011a.126 (Production Release) Wed Aug  8 00:52:07 PDT 2012
//  
//  Copyright (c) Calypto Design Systems, Inc., 1996-2012, All Rights Reserved.
//                       UNPUBLISHED, LICENSED SOFTWARE.
//            CONFIDENTIAL AND PROPRIETARY INFORMATION WHICH IS THE
//          PROPERTY OF CALYPTO DESIGN SYSTEMS OR ITS LICENSORS
//  
//  Running on Windows 7 mf2915@EEWS305-026 Service Pack 1 6.01.7601 i686
//  
//  Package information: SIFLIBS v17.0_1.1, HLS_PKGS v17.0_1.1, 
//                       DesignPad v2.78_0.0
//  
//  This version may only be used for academic purposes.  Some optimizations 
//  are disabled, so results obtained from this version may be sub-optimal.
//  
project new
solution file add {../sobel_filter_compressed_source/blur_sob.c} -type C++
solution file add {../sobel_filter_compressed_source/shift_class_sob.h} -type CHEADER
solution file add {../sobel_filter_compressed_source/blur_sob.h} -type CHEADER
directive set -REGISTER_IDLE_SIGNAL false
directive set -IDLE_SIGNAL {}
directive set -TRANSACTION_DONE_SIGNAL false
directive set -DONE_FLAG {}
directive set -START_FLAG {}
directive set -FSM_ENCODING none
directive set -REG_MAX_FANOUT 0
directive set -NO_X_ASSIGNMENTS true
directive set -SAFE_FSM false
directive set -RESET_CLEARS_ALL_REGS true
directive set -ASSIGN_OVERHEAD 0
directive set -DESIGN_GOAL area
directive set -OLD_SCHED false
directive set -PIPELINE_RAMP_UP true
directive set -COMPGRADE fast
directive set -SPECULATE true
directive set -MERGEABLE true
directive set -REGISTER_THRESHOLD 307200
directive set -MEM_MAP_THRESHOLD 32
directive set -UNROLL no
directive set -CLOCK_OVERHEAD 20.000000
directive set -OPT_CONST_MULTS -1
go analyze
directive set -TECHLIBS {{Altera_accel_CycloneIII.lib Altera_accel_CycloneIII} {mgc_Altera-Cyclone-III-6_beh_psr.lib {{mgc_Altera-Cyclone-III-6_beh_psr part EP3C16F484C}}}}
directive set -CLOCK_NAME clk
directive set -CLOCKS {clk {-CLOCK_PERIOD 20.0 -CLOCK_EDGE rising -CLOCK_UNCERTAINTY 0.0 -CLOCK_HIGH_TIME 10.0 -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n -RESET_KIND async -RESET_SYNC_ACTIVE high -RESET_ASYNC_ACTIVE low -ENABLE_NAME en -ENABLE_ACTIVE high}}
directive set -DESIGN_HIERARCHY sobel_filter_comp
go compile
directive set /sobel_filter_comp/vout -STREAM 30
directive set /sobel_filter_comp/vga_xy:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /sobel_filter_comp/vin -STREAM 90
directive set /sobel_filter_comp/vin:rsc -MAP_TO_MODULE {[DirectInput]}
directive set /sobel_filter_comp/core/MAC2 -UNROLL yes
directive set /sobel_filter_comp/core/ACC3 -UNROLL yes
directive set /sobel_filter_comp/core/ACC1 -UNROLL yes
directive set /sobel_filter_comp/core/SHIFT -UNROLL yes
directive set /sobel_filter_comp/core/main -DISTRIBUTED_PIPELINE true
directive set /sobel_filter_comp/core/main -PIPELINE_INIT_INTERVAL 1
go architect
go extract
