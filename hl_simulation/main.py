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
            if(RGB[0]<100) and (RGB[1]<100) and (RGB[2]<100):
                pixels[x,y]=(0, 0, 0)
            else:
                pixels[x,y]=(255, 255, 255)

    return image

def TopPoint(image):
    width, height = image.size
    pixels = image.load()
    y_min = height
    x_min = width
    for x in range(width):
        for y in range(height):
            RGB = pixels[x,y]
            if(RGB[0]==0) and (RGB[1]==0) and (RGB[2]==0):
                if(y<y_min):
                    y_min = y
                    x_min = x
    return (x_min, y_min)

def RightPoint(image, top):
    width, height = image.size
    pixels = image.load()
    y_max = 0
    x_max = 0
    x_top,y_top = top
    for x in range(width):
        for y in range(height):
            RGB = pixels[x,y]
            if(RGB[0]==0) and (RGB[1]==0) and (RGB[2]==0):
                if(x<x_top*6) and (y<y_top*6):
                     if(x>x_max):
                        y_max = y
                        x_max = x
    return (x_max, y_max)

def MiddlePoint(image, top):
    x_top,y_top = top
    x_middle = x_top
    y_middle = y_top*3
    return (x_middle, y_middle)

def WaistPoint(image, top):
    x_top,y_top = top
    x_waist = x_top
    y_waist = y_top*6
    return (x_waist, y_waist)


def LeftPoint(image, top):
    width, height = image.size
    pixels = image.load()
    y_max = 0
    x_min = width
    x_top,y_top = top
    for x in range(width):
        for y in range(height):
            RGB = pixels[x,y]
            if(RGB[0]==0) and (RGB[1]==0) and (RGB[2]==0):
                if(x<x_top*6) and (y<y_top*6):
                     if(x<x_min):
                        y_max = y
                        x_min = x
    return (x_min, y_max)

def drawCircle(image, coordinates):
    x,y = coordinates
    draw = ImageDraw.Draw(image)
    draw.ellipse((x-15, y-15, x+15, y+15), fill=(255,0,0))


def drawLine(image,coordinates1, coordinates2):
    x1, y1 = coordinates1
    x2, y2 = coordinates2
    draw = ImageDraw.Draw(image)
    draw.line((x1,y1,x2,y2), fill=(0,0,255), width=10)


def main():
    ref_image = Image.open("ref_image2.jpg")
    body_image = Image.open("body_image2.jpg")

    ref_image = BW(ref_image)
    ref_image = Find_Edges(ref_image)
    ref_image = Invert(ref_image)

    body_image = BW(body_image)
    body_image = Find_Edges(body_image)
    body_image = Invert(body_image)
    new_image = Image.new('RGB', ref_image.size, (255,255,255))
    # body_image = BW(body_image)

    diff = ImageChops.difference(ref_image, body_image)
    diff = Invert(diff)
    diff = CleanImage(diff)
    #diff = diff.convert('LA')
    #diff.show()
    x_top, y_top = TopPoint(diff)
    x_right, y_right = RightPoint(diff, (x_top, y_top))
    x_left, y_left = LeftPoint(diff, (x_top, y_top))
    x_middle, y_middle = MiddlePoint(diff, (x_top, y_top))
    x_waist, y_waist = WaistPoint(diff, (x_top, y_top))

    drawLine(diff, (x_top, y_top), (x_middle,y_middle))
    drawLine(diff, (x_middle,y_middle), (x_left, y_left))
    drawLine(diff, (x_middle,y_middle), (x_right, y_right))
    drawLine(diff, (x_middle,y_middle), (x_waist, y_waist))
    drawCircle(diff, (x_top, y_top))
    drawCircle(diff, (x_right, y_right))
    drawCircle(diff, (x_left, y_left))
    drawCircle(diff, (x_middle, y_middle))
    drawCircle(diff, (x_waist, y_waist))
    diff.show()



if __name__=="__main__":
    main()
