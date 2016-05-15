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


#include <ac_fixed.h>
#include "marker.h"

#include <iostream>
#include "stdio.h"

#include "ac_int.h"
#include "shift_class.h" 

//Initialise the memory variables for volume, accumulators, red and blue markers
static ac_int<4, false> volume_previous[1] = {0};
static ac_int<4,false> acc[2];
static ac_int<10, false> red_xy[2];
static ac_int<10, false> blue_xy[2];

// Gaussian blur - MATRIX
const ac_int<8,true> gauss[3][3] = {
    {1, 2, 1},
    {2, 4, 2},
    {1, 2, 1}
};

//Initialise the memory variables for previous values of red and blue markers
static ac_int<10, false> red_xy_previous[2] = {0,0};
static ac_int<10, false> blue_xy_previous[2] = {0,0};

#pragma hls_design top

void markers(ac_int<PIXEL_WL*KERNEL_WIDTH,false> vin[NUM_PIXELS], ac_int<PIXEL_WL,false> vout[NUM_PIXELS], ac_int<(COORD_WL+COORD_WL), false> vga_xy, ac_int<4,false> * volume)
{
    ac_int<16, false> r[KERNEL_WIDTH], g[KERNEL_WIDTH], b[KERNEL_WIDTH];
    ac_int<10, false> red_out, green_out, blue_out;
    ac_int<10, false> red, green, blue;
    ac_int<10, false> vga_x, vga_y; // screen coordinates
    
    //Extract VGA pixel X-Y coordinates from input
    vga_x = (vga_xy).slc<COORD_WL>(0);
    vga_y = (vga_xy).slc<COORD_WL>(10);
    
    //
    //Blur/noise storage values
    ac_int<10,false> gauss_store[KERNEL_WIDTH][KERNEL_WIDTH][3];
    ac_int<2,false> i = 0;
    ac_int<16,false> gauss_blur_val[3];
    
    //
    ac_int<2,false> k = 0;
   
    //Initialize to 0
    gauss_blur_val[0] = 0;
    gauss_blur_val[1] = 0;
    gauss_blur_val[2] = 0;
    
    //Shifts pixels from KERNEL_WIDTH rows and keeps KERNEL_WIDTH columns (KERNEL_WIDTHxKERNEL_WIDTH pixels stored)
    static shift_class<ac_int<PIXEL_WL*KERNEL_WIDTH,false>, KERNEL_WIDTH> regs;
    regs << vin[0];
    
    //Pass the colours through a Gaussian blur to eliminate noise:
    ACC1: for(i = 0; i < KERNEL_WIDTH; i++){
        k = 0;
        gauss_store[i][k][0] = (regs[i].slc<COLOUR_WL>(2*COLOUR_WL + 2*PIXEL_WL));
		// first line of pixel stream
		gauss_store[i][k][1] = (regs[i].slc<COLOUR_WL>(COLOUR_WL + 2*PIXEL_WL)) ;
		gauss_store[i][k][2] = (regs[i].slc<COLOUR_WL>(0 + 2*PIXEL_WL));
		k++;
		// second line of pixel stream
		gauss_store[i][k][0] = (regs[i].slc<COLOUR_WL>(2*COLOUR_WL + PIXEL_WL));
		gauss_store[i][k][1] = (regs[i].slc<COLOUR_WL>(COLOUR_WL + PIXEL_WL));
		gauss_store[i][k][2] = (regs[i].slc<COLOUR_WL>(0 + PIXEL_WL));
		k++;
		// current line of pixel stream
		gauss_store[i][k][0] = (regs[i].slc<COLOUR_WL>(2*COLOUR_WL));
		gauss_store[i][k][1] = (regs[i].slc<COLOUR_WL>(COLOUR_WL));
		gauss_store[i][k][2] = (regs[i].slc<COLOUR_WL>(0));
		}
    
    //Approximate Gaussian filter, requires only a single pass of the kernel
    ACC2: for(i = 0; i < KERNEL_WIDTH; i++){
        MAC1: for(k = 0; k < KERNEL_WIDTH; k++){
            //store the value;
            gauss_blur_val[0] += gauss_store[i][k][0] * gauss[i][k];
            gauss_blur_val[1] += gauss_store[i][k][1] * gauss[i][k];
            gauss_blur_val[2] += gauss_store[i][k][2] * gauss[i][k];
        }
    }
    
    //Normalise the calculated blur values
    gauss_blur_val[0] = (gauss_blur_val[0]/16);
    gauss_blur_val[1] = (gauss_blur_val[1]/16);
    gauss_blur_val[2] = (gauss_blur_val[2]/16);
    
    //Extract the colour from the input 
    red = gauss_blur_val[0];
    green = gauss_blur_val[1];
    blue = gauss_blur_val[2];
    
    // Reset of the valid accumulators acc[0] for RED acc[1] for BLUE reset every 15 pixels
    if ((vga_x % 15) == 0){
        acc[0] = 0; 
        acc[1] = 0;
    }
    
    // Reset of the CURRENT x,y coordinates for BLUE and RED pixels at the very beginning of the stream x,y = 0,0
    if ((vga_y == 0) && (vga_x == 0)) {
        red_xy[0] = 0;
        red_xy[1] = 0;
        blue_xy[0] = 0;
        blue_xy[1] = 0;
    }
    
    //RED marker (left hand) - colours are 10 bit, in comparison shifted to right, therefore 4* (0-255)
    if ((((160*4)<=red) && (red<=4*255)) && ((0<=green) && (green<=(4*100))) && ((0<=blue) && (0<=(4*100)))){
        acc[0]++; //RED
    } 
    //BLUE marker (right hand)
    if (((0<=red) && (red<=(4*100))) && ((0<=green) && (green<=(4*100))) && (((4*90)<=blue) && (blue<=(4*220)))){
        acc[1]++; //BLUE
    }
    
    //If 4 familiar pixels, estimate as the right point, assign it to current x,y coordinates, only if not initalized
    //acc[0] - RED
    if (acc[0] > 6){
        if ((red_xy[0]==0) && (red_xy[1]==0)) {
            red_xy[0] = vga_x;
            red_xy[1] = vga_y;
        }
    }
    //acc[1] - BLUE
    if (acc[1] > 6){
        if ((blue_xy[0]==0) && (blue_xy[1]==0)) {
            blue_xy[0] = vga_x;
            blue_xy[1] = vga_y;
        }
    }
    
    //////RED///////
    
    // RED marker previous value initialisation  - only during the SETUP phase - first run of algorithm
    // red_xy[0] - x coordinate red_xy[1] - y coordinate
    
    if ((red_xy_previous[0]==0) && (red_xy[0]!=0)) {
        red_xy_previous[0] = red_xy[0];
        red_xy_previous[1] = red_xy[1];
    }
    // RED marker
    // If the previous value and the current value match to certain distance, rewrite them
    int deltax_red = (red_xy[0] - red_xy_previous[0]);
    int deltay_red = (red_xy[1] - red_xy_previous[1]);
    
    if (((deltay_red>-10) && (deltay_red<10))||((deltax_red<10) &&(deltax_red>-10))) {
        red_xy_previous[0] = red_xy[0];
        red_xy_previous[1] = red_xy[1];
    }
    
    //RED
    //Calculate the range for the square
    int deltax_square_red = vga_x - red_xy_previous[0];
    int deltay_square_red = vga_y - red_xy_previous[1];
    
    //////BLUE///////
    
    //BLUE marker previous value initialisation - only during the SETUP phase
    //blue_xy[0] - x coordinate blue_xy[1] - y coordinate
    
    if ((blue_xy_previous[0]==0) && (blue_xy[0]!=0)) {
        blue_xy_previous[0] = blue_xy[0];
        blue_xy_previous[1] = blue_xy[1];
    }
    // BLUE marker
    // If the previous value and the current value match to certain distance, rewrite them
    int deltax_blue = (blue_xy[0] - blue_xy_previous[0]);
    int deltay_blue = (blue_xy[1] - blue_xy_previous[1]);
    
    //BLUE
    //Calculate the range for the square
    if (((deltay_blue>-10) && (deltay_blue<10))||((deltax_blue<10) &&(deltax_blue>-10))){
        blue_xy_previous[0] = blue_xy[0];
        blue_xy_previous[1] = blue_xy[1];
    }
    int deltax_square_blue = vga_x - blue_xy_previous[0];
    int deltay_square_blue = vga_y - blue_xy_previous[1];
    
    //Set the output values to the input values
    red_out = red;
    green_out = green;
    blue_out = blue;
    
    
    //Draw both the RED and BLUE squares - 40x40 pixels
    if (((deltax_square_red >= 0)&&(deltax_square_red <= 40)) && ((deltay_square_red >= 0) &&(deltay_square_red <= 40))){
        green_out = 0;
        blue_out = 0;
        red_out = 1023;
    }
    if (((deltax_square_blue >= 0)&&(deltax_square_blue <= 40)) && ((deltay_square_blue >= 0) &&(deltay_square_blue <= 40))){
        blue_out = 1023;
        green_out = 0;
        red_out = 0;
    } 
    
    //Volume Adjustment:
    //Calculate the volume through the y coordinate of the RED marker
    //Multiplied by -1 as must be inverted to enable the increase from bottom of the screen
    //Volume stored in memory to keep the same volume value even during an error
    //Otherwise volume set to 0
    
    ac_int<4, false> volume_current = ((-1*((red_xy_previous[1])-480))/90);
    if (((volume_current-volume_previous[0])>=-2)&&((volume_current-volume_previous[0])<=2)){
        volume_previous[0] = volume_current;
    }
    if (red_xy_previous[1]==0) {
        *volume = 0;
    } else {
        *volume = volume_previous[0];
    }

    
    //Lines for volume threshold
    //Shifted, because of the monitor
    if ((vga_y == 0) ||  (vga_y == 145) ||  (vga_y == 265) || (vga_y == 385) ||  (vga_y == 505)) {
        blue_out = 0;
        green_out = 0;
        red_out = 0;
    }

    //Group the RGB components into a single signal
	vout[0] = ((((ac_int<PIXEL_WL, false>)red_out) << (2*COLOUR_WL)) | (((ac_int<PIXEL_WL, false>)green_out) << COLOUR_WL) | (ac_int<PIXEL_WL, false>)blue_out);
	    
}



// end of file
