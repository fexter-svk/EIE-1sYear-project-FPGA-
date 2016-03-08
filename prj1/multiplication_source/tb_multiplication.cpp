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
//  File:           multiplication.cpp
//  Description:    multiplication calculator testbench
//  By:             rad09
////////////////////////////////////////////////////////////////////////////////

#include "multiplication.h"
#include <mc_scverify.h>

CCS_MAIN(int argc, char *argv[])
{
  ac_int<8> inA[VECTOR_LEN] = {1,2,3,4,5};
  ac_int<8> inB[VECTOR_LEN] = {5,4,3,2,1};
  ac_int<8> output[VECTOR_LEN] = {0,0,0,0,0};
  int i;
  ac_int<8> exp_out[VECTOR_LEN] = {0,0,0,0,0};
  // Test design
  CCS_DESIGN(multiplication)(inA,inB,output);

  // Expected result  
  
  for(i = 0; i < VECTOR_LEN; i++) {
    exp_out[i] = inA[i] * inB[i];
  }

  // Display results
  for(i = 0; i < VECTOR_LEN; i++) {
    printf ("Inputs: A = %d, B = %d \n", (int)inA[i], (int)inB[i]);
  }
  printf ("Design output  : ");
  for(i = 0; i < VECTOR_LEN; i++){
      printf ("%d",(int)output[i]);
  }
  printf ("\n Expected output: ");
  for(i = 0; i < VECTOR_LEN; i++){
      printf ("%d",(int)exp_out[i]);
  }
  CCS_RETURN(0);
}

