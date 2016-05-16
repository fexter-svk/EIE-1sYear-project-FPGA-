#include <ac_fixed.h>
#include "memory_block.h"
#include "stdio.h"
#include "ac_int.h"
#include <iostream>



//2-dimensional array to store reference image
//stored on switch in the up position

#pragma hls_design top

//try to output one bit to check if stored.

static ac_int<1,false> mem_ref[4800];
ac_int<8,false> x_index = 0;
ac_int<8,false> y_index = 0;
void memory(bool save_enable, ac_int<PIXEL_WL,false> vout_ref[NUM_PIXELS], ac_int<1,false> bit_in){
    
    
    ac_int<16,false> out_index = 0;
    ac_int<1,false> val; 
    ac_int<10,false> no_columns = 80;
    ac_int<10,false> no_rows = 60;
    ac_int<10,false> index = 0;
    ac_int<10,false> v = 0;
    

    if(save_enable == true){
        index = (y_index * no_columns) + x_index;
        mem_ref[index] = bit_in;
        x_index++;
        if(x_index == 80){
            x_index = 0;
            y_index++;
        }
	}
	else{
        v = mem_ref[out_index];
        v = v * 1023;
        out_index++;
        if(out_index == 4800){
            out_index = 0;
        }
	    vout_ref[0] = ((((ac_int<PIXEL_WL, false>)v) << (2*COLOUR_WL)) | (((ac_int<PIXEL_WL, false>)0) << COLOUR_WL) | (ac_int<PIXEL_WL, false>)0);
    }

}		
// end of file
