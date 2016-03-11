from __future__ import print_function
from PIL import Image, ImageChops, ImageFilter, ImageOps

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
            if(RGB[0]<100) and (RGB[1]<100) and (RGB[2]<100):
                pixels[x,y]=(0, 0, 0)
            else:
                pixels[x,y]=(255, 255, 255)

    return image

def main():
    ref_image = Image.open("ref2.jpg")
    body_image = Image.open("body2.jpg")

    ref_image = BW(ref_image)
    ref_image = Find_Edges(ref_image)
    ref_image = Invert(ref_image)

    body_image = BW(body_image)
    body_image = Find_Edges(body_image)
    body_image = Invert(body_image)
    new_image = Image.new('RGB', ref_image.size, (255,255,255))
    # body_image = BW(body_image)


    #body_image = body_image.filter(ImageFilter.FIND_EDGES)
    diff = ImageChops.difference(ref_image, body_image)
    diff = Invert(diff)
    diff = CleanImage(diff)
    #diff = diff.convert('LA')
    diff.show()

    #compare(ref_image, body_image)

    #print(ref_image.size())
    #ref_image.pixels

    #size = ref_image.size




if __name__=="__main__":
    main()
