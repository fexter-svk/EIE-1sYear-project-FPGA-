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
//  File:           blur.cpp
//  Description:    video to vga blur filter - real-time processing
//  By:             rad09
////////////////////////////////////////////////////////////////////////////////
// this hardware block receives the VGA stream and then produces a blured output
// based on the FIR design - page 230 of HLS Blue Book
////////////////////////////////////////////////////////////////////////////////
// Catapult Project options
// Constraint Editor:
//  Frequency: 27 MHz
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
#include "blur.h"

#include <iostream>
#include "stdio.h"
#include "ac_int.h"
#include "shift_class.h" 


static ac_int<8, false> volume_previous[1] = {0};
static ac_int<4,false> acc[2];
static ac_int<10, false> red_xy[2];
static ac_int<10, false> blue_xy[2];



static ac_int<10, false> red_xy_previous[2] = {0,0};
static ac_int<10, false> blue_xy_previous[2] = {0,0};

#pragma hls_design top
void markers(ac_int<PIXEL_WL*KERNEL_WIDTH,false> vin[NUM_PIXELS], ac_int<PIXEL_WL,false> vout[NUM_PIXELS], ac_int<(COORD_WL+COORD_WL), false> vga_xy, ac_int<8,false> * volume)
{
    ac_int<10, false> red_out, green_out, blue_out;
    ac_int<10, false> red, green, blue;
    ac_int<10, false> vga_x, vga_y; // screen coordinates
    ac_int<1, false> detected;
    ac_int<3, false> counter;
    
    // extract VGA pixel X-Y coordinates from input
    vga_x = (vga_xy).slc<COORD_WL>(0);
    vga_y = (vga_xy).slc<COORD_WL>(10);

    //Extract the colour from the input 
    red = (vin[0].slc<COLOUR_WL>(2*COLOUR_WL));
    green = vin[0].slc<COLOUR_WL>(1*COLOUR_WL);
    blue = vin[0].slc<COLOUR_WL>(0*COLOUR_WL);
    
    // Reset of the valid accumulators acc[0] for RED acc[1] for BLUE reset every 15 pixels
    if ((vga_x % 15) == 0){
        acc[0] = 0; 
        acc[1] = 0;
    }
    
    // Reset of the CURRENT x,y coordinates for BLUE and RED pixels
    if ((vga_y == 0) && (vga_x == 0)) {
        red_xy[0] = 0;
        red_xy[1] = 0;
        blue_xy[0] = 0;
        blue_xy[1] = 0;
    }
    
    //RED marker (left hand)
    if ((((160*4)<=red) && (red<=4*255)) && ((0<=green) && (green<=(4*120))) && ((0<=blue) && (0<=(4*120)))){
        acc[0]++; //RED
    } 
    //BLUE marker (right hand)
    if (((0<=red) && (red<=(4*90))) && ((0<=green) && (green<=(4*90))) && (((4*90)<=blue) && (blue<=(4*255)))){
        acc[1]++; //BLUE
    }
    //If 4 familiar pixels, probably the right point, assign it to corrent x,y coordinates 
    if (acc[0] > 4){
        if ((red_xy[0]==0) && (red_xy[1]==0)) {
            red_xy[0] = vga_x;
            red_xy[1] = vga_y;
        }
    } 
    if (acc[1] > 4){
        if ((blue_xy[0]==0) && (blue_xy[1]==0)) {
            blue_xy[0] = vga_x;
            blue_xy[1] = vga_y;
        }
    }
    
    // RED marker previous value initialisation  - only during the SETUP phase
    if ((red_xy_previous[0]==0) && (red_xy[0]!=0)) {
        red_xy_previous[0] = red_xy[0];
        red_xy_previous[1] = red_xy[1];
    }
    // RED marker
    // If the previous value and the current value match to certain distance, rewrite them
    int deltax_red = (red_xy[0] - red_xy_previous[0]);
    int deltay_red = (red_xy[1] - red_xy_previous[1]);
    
    if (((deltay_red>-10) && (deltay_red<10))||((deltax_red<10) &&(deltax_red>-10))) {
       // if (!(((deltay_red>-5) && (deltay_red<5))||((deltax_red<5) &&(deltax_red>-5)))){
        red_xy_previous[0] = red_xy[0];
        red_xy_previous[1] = red_xy[1];
       // }
    }
    //RED
    //Calculate the coordinates for the square
    int deltax_square_red = vga_x - red_xy_previous[0];
    int deltay_square_red = vga_y - red_xy_previous[1];
    
    //
    //
    //
    //
    //BLUE marker previous value initialisation - only during the SETUP phase
    if ((blue_xy_previous[0]==0) && (blue_xy[0]!=0)) {
        blue_xy_previous[0] = blue_xy[0];
        blue_xy_previous[1] = blue_xy[1];
    }
    // BLUE marker
    // If the previous value and the current value match to certain distance, rewrite them
    int deltax_blue = (blue_xy[0] - blue_xy_previous[0]);
    int deltay_blue = (blue_xy[1] - blue_xy_previous[1]);
    
    //BLUE
    //Calculate the coordinates for the square
    if (((deltay_blue>-10) && (deltay_blue<10))||((deltax_blue<10) &&(deltax_blue>-10))){
       // if (!(((deltay_blue>-5) && (deltay_blue<5))||((deltax_blue<5) &&(deltax_blue>-5)))){
            blue_xy_previous[0] = blue_xy[0];
            blue_xy_previous[1] = blue_xy[1];
       // }
    }
    int deltax_square_blue = vga_x - blue_xy_previous[0];
    int deltay_square_blue = vga_y - blue_xy_previous[1];
    
    //Make all the other pixels black
    red_out = 0;
    green_out = 0;
    blue_out = 0;
    
    //Draw both the RED and BLUE squares
    if (((deltax_square_red >= 0)&&(deltax_square_red <= 40)) && ((deltay_square_red >= 0) &&(deltay_square_red <= 40))){
        red_out = 1023;
        green_out = 0;
        blue_out = 0;
    }
    if (((deltax_square_blue >= 0)&&(deltax_square_blue <= 40)) && ((deltay_square_blue >= 0) &&(deltay_square_blue <= 40))){
        red_out = 0;
        green_out = 0;
        blue_out = 1023;
    } 
    
    //adjustment of the volume
    int volume_current = (red_xy_previous[1] + blue_xy_previous[1])-960;
    volume_current = int((-1*volume_current) / 256);
    if ((((volume_current-volume_previous[0])>=-1) &&((volume_current-volume_previous[0])<=1)) && (volume_current>=0)){
        volume_previous[0] = volume_current;
    }
    *volume = volume_previous[0]; 
	    
    // group the RGB components into a single signal
	vout[0] = ((((ac_int<PIXEL_WL, false>)red_out) << (2*COLOUR_WL)) | (((ac_int<PIXEL_WL, false>)green_out) << COLOUR_WL) | (ac_int<PIXEL_WL, false>)blue_out);
	    
}



// end of file
