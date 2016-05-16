#include <iostream>
#include <ac_int.h>
#include "NewMemory.h"
#define ROWS 60
#define COLS 80

//addressing is done externally
//this means that the incoming x and y values from the vga must be divided by 8 as there is a downscale on the actual memory unit

ac_int<1, false> data[ROWS * COLS];

void MemoryBlock(ac_int<6,false> row, ac_int<7,false> col, ac_int<1,false> bit_in, bool write_enable, ac_int<30,false> *bits_out){
	if (write_enable){
		data[(ROWS * row) + col] = bit_in;
        //bits_out = ((((ac_int<PIXEL_WL, false>)bit_in) << (2*COLOUR_WL)) | (((ac_int<PIXEL_WL, false>)0) << COLOUR_WL) | (ac_int<PIXEL_WL, false>)0);
	}else{
		*bits_out = ((((ac_int<PIXEL_WL, false>)data[ROWS*row + col]) << (2*COLOUR_WL)) | (((ac_int<PIXEL_WL, false>)0) << COLOUR_WL) | (ac_int<PIXEL_WL, false>)0);
	}
}
