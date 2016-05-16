#include <iostream>
#include <ac_int.h>
#define ROWS 80
#define COLS 60

bool init = false;

void MemoryTester(ac_int<1, false>*bit_out, bool *enabled, ac_int<6, false> *row, ac_int<7, false> *col){
    if (!init){
        *enabled = true;
        for(int i = 0; i < 60; i++){
            for(int j = 0; j <80; j++){
                *row = i;
                *col = i;
                if (((ROWS * *row) + *col) % 8 == 0){
                    *bit_out = 0;
                }
                else{
                    *bit_out = 1;
                }
            }
        }
    }
    else{
        *enabled = false;
    }
}