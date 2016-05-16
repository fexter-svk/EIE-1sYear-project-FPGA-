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
//  File:           blur.h
//  Description:    vga blur - real-time processing
//  By:             rad09
////////////////////////////////////////////////////////////////////////////////
// this hardware block receives the VGA stream and then produces a blured output
////////////////////////////////////////////////////////////////////////////////


#ifndef _SETUP
#define _SETUP

#include <ac_int.h>
#include <iostream>

#define NUM_PIXELS 1

#define COLOUR_WL         10
#define PIXEL_WL          (3 * COLOUR_WL)

//void memory(bool save_enable, ac_int<10,false> x_in, ac_int<10,false> y_in, ac_int<1,false> bit_in, ac_int<10,false> x_L_in, ac_int<10,false> y_L_in, ac_int<10,false> x_R_in, ac_int<10,false> y_R_in, ac_int<1,false> * bit_L_out, ac_int<1,false> * bit_R_out );
void memory(bool save_enable, ac_int<PIXEL_WL,false> vout_ref[NUM_PIXELS], ac_int<1,false> bit_in);

#endif
