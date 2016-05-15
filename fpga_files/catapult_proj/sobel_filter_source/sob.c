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
//  File:           sob.cpp
//  Description:    video to vga sobel filter - real-time processing
//  By:             rad09, gsp14
////////////////////////////////////////////////////////////////////////////////
// this hardware block receives the VGA stream and then produces a sobel filtered output
// based on the FIR design - page 230 of HLS Blue Book
////////////////////////////////////////////////////////////////////////////////
// Catapult Project options
// Constraint Editor: 
//  Frequency: 50 MHz
//  Top design: sobel_filter
//  clk>reset sync: disable; reset async: enable; enable: enable
// Architecture Constraints: 
//  interface>vin: wordlength = 150, streaming = 150
//  interface>vout: wordlength = 30, streaming = 30
//  core>main: pipeline + distributed + merged
//  core>main>frame: merged
//  core>main>frame>shift, mac1, mac2: unroll + merged
////////////////////////////////////////////////////////////////////////////////


#include <ac_fixed.h>
#include "sob.h"
#include "stdio.h"
#include "ac_int.h"
#include <iostream>

const ac_int<8,true> X_MASK[3][3] = {
    {-1, 0, 1},
    {-2, 0, 2},
    {-1, 0, 1}
};


const ac_int<8,true> Y_MASK[3][3] = {
    {1, 2, 1},
    {0, 0, 0},
    {-1, -2,-1}
};

// shift_class: page 119 HLS Blue Book
#include "shift_class_sob.h" 

ac_int<16, false> abs(ac_int<16, true> din){
    if(din < 0){
        din = -din;
    }
    ac_int<16, false> tmp = din;
    return tmp;
 }

#pragma hls_design top
void sobel_filter(ac_int<PIXEL_WL*KERNEL_WIDTH,false> vin[NUM_PIXELS], ac_int<PIXEL_WL,false> vout[NUM_PIXELS], ac_int<(COORD_WL+COORD_WL), false> * vga_xy)
{
    ac_int<16, false> val, r[KERNEL_WIDTH], g[KERNEL_WIDTH], b[KERNEL_WIDTH];
    ac_int<16, true> greyx, greyy, gr[KERNEL_WIDTH][KERNEL_WIDTH];
    ac_int<10, false> vga_x, vga_y; // screen coordinates
    
// extract VGA pixel X-Y coordinates
    
    vga_x = (*vga_xy).slc<COORD_WL>(0);
    vga_y = (*vga_xy).slc<COORD_WL>(10);

    
    // shifts pixels from KERNEL_WIDTH rows and keeps KERNEL_WIDTH columns (KERNEL_WIDTHxKERNEL_WIDTH pixels stored)
    static shift_class<ac_int<PIXEL_WL*KERNEL_WIDTH,false>, KERNEL_WIDTH> regs;
	
    ac_int<2,false> k = 0;
    ac_int<2,false> i;
    bool set_en;
    
	// init
	greyx = 0;
	greyy = 0;
		
		// shift input data in the filter fifo
	regs << vin[0];
		
	// greyscale
	ACC1: for(i = 0; i < KERNEL_WIDTH; i++) {
		k = 0;
		// first line ...
		r[0] = (regs[i].slc<COLOUR_WL>(2*COLOUR_WL + 2*PIXEL_WL));
		g[0] = (regs[i].slc<COLOUR_WL>(COLOUR_WL + 2*PIXEL_WL)) ;
		b[0] = (regs[i].slc<COLOUR_WL>(0 + 2*PIXEL_WL));
		gr[i][k] = (r[0] + g[0] + b[0])/3;
		k++;
		// second line ... 
		r[1] = (regs[i].slc<COLOUR_WL>(2*COLOUR_WL + PIXEL_WL));
		g[1] = (regs[i].slc<COLOUR_WL>(COLOUR_WL + PIXEL_WL));
		b[1] = (regs[i].slc<COLOUR_WL>(0 + PIXEL_WL));
		gr[i][k]= (r[1] + g[1] + b[1])/3;
		k++;
		// current line
		r[2] = (regs[i].slc<COLOUR_WL>(2*COLOUR_WL));
		g[2] = (regs[i].slc<COLOUR_WL>(COLOUR_WL));
		b[2] = (regs[i].slc<COLOUR_WL>(0));
		gr[i][k] = (r[2] + g[2] + b[2])/3;
	}
	
	// dot product
	ACC3: for(i = 0; i < KERNEL_WIDTH; i++) {
	   MAC2: for(k = 0; k < KERNEL_WIDTH; k++){
	       greyx += gr[i][k]*X_MASK[i][k];
	       greyy += gr[i][k]*Y_MASK[i][k];
	   }
	}
	
	// sobel addition
	val = abs(greyx) + abs(greyy);
	
	// if greater than white, set to white.
	if (val >= 1023) { 
	   val = 1023;
	}
	
	// group the RGB components into a single signal
	vout[0] = ((((ac_int<PIXEL_WL, false>)val) << (2*COLOUR_WL)) | (((ac_int<PIXEL_WL, false>)val) << COLOUR_WL) | (ac_int<PIXEL_WL, false>)val);	
}
// end of file
