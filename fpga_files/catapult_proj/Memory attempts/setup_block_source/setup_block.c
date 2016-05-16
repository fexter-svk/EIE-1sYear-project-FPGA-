////////////////////////////////////////////////////////////////////////////////
//  _____                           _       _    _____      _ _
// |_   _|                         (_)     | |  / ____|    | | |
//   | |  _ __ ___  _ __   ___ _ __ _  __ _| | | |     ___ | | | ___  __ _  ___
//   | | | '_ ` _ \| '_ \ / _ \ '__| |/ _` | | | |    / _ \| | |/ _ \/ _` |/ _ \
//  _| |_| | | | | | |_) |  __/ |  | | (_| | | | |___| (_) | | |  __/ (_| |  __/
// |_____|_| |_| |_| .__/ \___|_|  |_|\__,_|_|  \_____\___/|_|_|\___|\__, |\___|
//                 | |                                                __/ |
//                 |_|                                               |___/
//  _                     _
// | |                   | |
// | |     ___  _ __   __| | ___  _ __
// | |    / _ \| '_ \ / _` |/ _ \| '_ \
// | |___| (_) | | | | (_| | (_) | | | |
// |______\___/|_| |_|\__,_|\___/|_| |_|
//
////////////////////////////////////////////////////////////////////////////////
//  File:           blur_sob.cpp
//  Description:    video to vga blur filter - real-time processing
//  By:             rad09
////////////////////////////////////////////////////////////////////////////////
// this hardware block receives the VGA stream and then produces a blured output
// based on the FIR design - page 230 of HLS Blue Book
////////////////////////////////////////////////////////////////////////////////
// Catapult Project options
// Constraint Editor: 
//  Frequency: 50 MHz
//  Top design: vga_blur
//  clk>reset sync: disable; reset async: enable; enable: enable
// Architecture Constraints: 
//  interface>vin: wordlength = 150, streaming = 150
//  interface>vout: wordlength = 30, streaming = 30
//  core>main: pipeline + distributed + merged
//  core>main>frame: merged
//  core>main>frame>shift, mac1, mac2: unroll + merged
////////////////////////////////////////////////////////////////////////////////


#include <ac_fixed.h>
#include "setup_block.h"
#include "stdio.h"
#include "ac_int.h"
#include <iostream>



//2-dimensional array to store reference image
//stored on button press and held persistently by this structure

#pragma hls_design top
void setup(bool r_enable, bool l_enable, ac_int<1, false> bit_img, ac_int<10, false> x_in,ac_int<10, false> y_in, ac_int<1, false> bit_ref_img, ac_int<10, false> * x_L_setup, ac_int<10, false> * y_L_setup, ac_int<10, false> * x_R_setup, ac_int<10, false> * y_R_setup)
{
    ac_int<10, false> x_l_compare=640;
    ac_int<10, false> y_l_compare=480;
    
    if(l_enable) {
        if ()
        
  
    if(save_enable) {
            mem_ref[x_in][y_in] = bit_in;
        }
    if ((x_L_in!=0) && (y_L_in!=0)){
        *bit_L_out = mem_ref[x_L_in][y_L_in];
    }
    if ((x_R_in!=0) && (y_R_in!=0)){
        *bit_R_out = mem_ref[x_R_in][y_R_in];
    }
    
	
}

// end of file
