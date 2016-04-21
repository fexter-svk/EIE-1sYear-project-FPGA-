from __future__ import print_function
from PIL import Image, ImageChops, ImageFilter, ImageOps, ImageDraw

import string

def BW(image):
    image = image.convert('LA')
    return image

def Find_Edges(image):
    image = image.filter(ImageFilter.FIND_EDGES)
    return image

def Invert(image):
    image = image.convert('RGB')
    width,height = image.size
    pixels = image.load()
    for x in range(width):
        for y in range(height):
            RGB = pixels[x,y]
            pixels[x,y]=(255-RGB[0], 255-RGB[1], 255-RGB[2])
    return image

def CleanImage(image):
    width,height = image.size
    pixels = image.load()
    for x in range(width):
        for y in range(height):
            RGB = pixels[x,y]
            if(RGB[0]>200) and (RGB[1]>200) and (RGB[2]>200):
                pixels[x,y]=(255, 255, 255)
            else:
                pixels[x,y]=(0, 0, 0)

    return image

def checkPixels(image, coordinates):
    x_ref, y_ref = coordinates
    pixels = image.load()
    width, height = image.size
    counter = 0
    for x in range(x_ref-5, x_ref+5):
        for y in range(y_ref-5,y_ref+5):
            if (x>=0) and (x<width) and (y>=0) and (y<height):
                RGB = pixels[x,y]
                if(RGB[0]==0) and (RGB[1]==0) and (RGB[2]==0):
                    counter+=1
    return counter

def highlightDifferences(image):
    width, height = image.size
    pixels = image.load()
    x_leftmost = False
    for x in range(width):
        for y in range(height):
            RGB = pixels[x,y]
            if (RGB[0]==255) and (RGB[1]==255) and (RGB[2]==255) and (checkPixels(image, (x,y))>5) and (x_leftmost!=False):
                x_leftmost = True
            if x_leftmost==True:
                pixels[x,y]=(255,0,0)




def main():
    ref_image = Image.open("ref5.jpg")
    body_image = Image.open("body5.jpg")

    ref_image = BW(ref_image)
    ref_image = Find_Edges(ref_image)
    ref_image = Invert(ref_image)
   # ref_image.save('r2_edge.bmp')


    body_image = BW(body_image)
    body_image = Find_Edges(body_image)
    body_image = Invert(body_image)
   # body_image.save('b2_edge.bmp')


    diff = ImageChops.difference(ref_image, body_image)
    diff = CleanImage(diff)

    diff.show()

if __name__=="__main__":
    main()
