//
//  main.cpp
//  SobelFilter
//
//  Created by Alexander Luisi on 08/03/2016.
//  Copyright © 2016 Alexander Luisi. All rights reserved.
//

#include <fstream>
#include <iostream>
#include <cstdlib>
#include <cmath>
#include <vector>

using namespace std;

int main(int argc, const char * argv[]) {
    //rgb arrays:
    int redArray[376][500];
    int greenArray[376][500];
    int blueArray[376][500];
    //greyscale variables
    double avgVal;
    double sobelVal;
    double gsArray[376][500];
    double xDirec[376][500];
    double yDirec[376][500];
    double sobelArray[376][500];
    //initialise the sobel array
    for(int i = 0; i < 376; i++){
        for(int j = 0; j < 500; j++){
            sobelArray[i][j] = 0;
        }
    }
    
    
    //read in the RGB text file:
    ifstream redFile;
    ifstream greenFile;
    ifstream blueFile;
    ofstream gsFile;
    ofstream sobelFile;
    //for greyscale:
    redFile.open("/Users/alexluisi/Documents/MATLAB/red");
    greenFile.open("/Users/alexluisi/Documents/MATLAB/green");
    blueFile.open("/Users/alexluisi/Documents/MATLAB/blue");
    
    for(int i = 0; i < 376; i++){
        for(int j = 0; j < 500; j++){
            redFile >> redArray[i][j];
            greenFile >> greenArray[i][j];
            blueFile >> blueArray[i][j];
        }
    }
    
    //greyscale
    for(int i = 0; i < 376; i++){
        for(int j = 0; j < 500; j++){
            avgVal = floor((redArray[i][j] + greenArray[i][j] + blueArray[i][j]) / 3);
            gsArray[i][j] = avgVal;
        }
    }
    
    
    gsFile.open("/Users/alexluisi/Documents/MATLAB/grey");
    for(int i = 0; i < 376; i++){
        for(int j = 0; j < 500; j++){
            gsFile << (gsArray[i][j]) << " ";
        }
        gsFile << endl; //<-- may or may not need this, not sure.
    }
    
    /*
     Need to implement the Sobel Filter and create a new file after the convolution
     */
    //sobelise
    
    int topleft, topmiddle, topright;
    int left, middle, right;
    int lowleft, lowmiddle, lowright;
    //convolve for the x direction
    for(int i = 1; i < 375; i++){
        for(int j = 1; j < 499; j++){
            topleft = -1 * (gsArray[i-1][j-1]);
            topmiddle = 0;
            topright = gsArray[i+1][j+1];
            left = -2 * gsArray[i-1][j];
            middle = 0;
            right = 2 * gsArray[i+1][j];
            lowleft = -1 * (gsArray[i-1][j+1]);
            lowmiddle = 0;
            lowright = gsArray[i+1][j+1];
            xDirec[i][j] = (topleft + topmiddle + topright);
            xDirec[i][j] += (left + middle + right);
            xDirec[i][j] += (lowleft + lowmiddle + lowright);
        }
    }
    
    //convolve for the y direction
    for(int i = 1; i < 375; i++){
        for(int j = 1; j < 499; j++){
            topleft = -1 * (gsArray[i-1][j-1]);
            topmiddle = -2 * gsArray[i][j-1];;
            topright = -1 * (gsArray[i+1][j-1]);
            left = 0;
            middle = 0;
            right = 0;
            lowleft =gsArray[i-1][j+1];
            lowmiddle = 2 * gsArray[i][j+1];
            lowright = gsArray[i+1][j+1];
            yDirec[i][j] = (topleft + topmiddle + topright);
            yDirec[i][j] += (left + middle + right);
            yDirec[i][j] += (lowleft + lowmiddle + lowright);
        }
    }
    
    for(int i = 1; i < 375; i++){
        for(int j = 1; j < 499; j++){
            sobelVal = sqrt((xDirec[i][j]*xDirec[i][j])+(yDirec[i][j]*yDirec[i][j]));
            sobelArray[i][j] = floor(sobelVal);
        }
    }
    
    sobelFile.open("/Users/alexluisi/Documents/MATLAB/sobel");
    for(int i = 0; i < 376; i++){
        for(int j = 0; j < 500; j++){
            sobelFile << (sobelArray[i][j]) << " ";
        }
        sobelFile << endl; //<-- may or may not need this, not sure.
    }
    
    
    redFile.close();
    greenFile.close();
    blueFile.close();
    gsFile.close();
    sobelFile.close();
  
    return 0;
}