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

def TopPoint(image):
    width, height = image.size
    pixels = image.load()
    y_min = height
    x_min = width
    for x in range(width):
        for y in range(height):
            RGB = pixels[x,y]
            if(RGB[0]==0) and (RGB[1]==0) and (RGB[2]==0):
                if(y<y_min) and (10<(checkPixels(image, (x,y)))):
                    y_min = y
                    x_min = x
    return (x_min, y_min)

def RightArmPoint(image, top, distance):
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

def MiddlePoint(image, top, height):
    x_top,y_top = top
    x_middle = x_top
    y_middle = y_top + round(height*0.236)
    return (x_middle, y_middle)

def WaistPoint(image, top, height):
    x_top,y_top = top
    x_waist = x_top
    y_waist = y_top + round(height*0.518)
    return (x_waist, y_waist)

def LeftArmPoint(image, top, height):
    width, height = image.size
    pixels = image.load()
    x_top,y_top = top
    y_result = 0
    x_result = x_top
    for y in range(0, y_top + round(height*0.618)):
        for x in range(0, x_top):
            RGB = pixels[x,y]
            if(RGB[0]==0) and (RGB[1]==0) and (RGB[2]==0):
                if (x_result>x) and (y_result<y) and (20<(checkPixels(image, (x,y)))):
                    y_result = y
                    x_result = x
    return (x_result, y_result)

def RightArmPoint(image, top, height):
    width, height = image.size
    pixels = image.load()
    x_top,y_top = top
    y_result = 0
    x_result = x_top
    for y in range(0, y_top + round(height*0.618)):
        for x in range(x_top, width):
            RGB = pixels[x,y]
            if(RGB[0]==0) and (RGB[1]==0) and (RGB[2]==0):
                if (x_result<x) and (y_result<y) and (20<(checkPixels(image, (x,y)))):
                    y_result = y
                    x_result = x
    return (x_result, y_result)

def LeftLegPoint(image, top):
    width, height = image.size
    pixels = image.load()
    y_result = 0
    x_result = 0
    x_top,y_top = top
    for x in range(0,x_top):
        for y in range(height-1,y_top,-1):
            RGB = pixels[x,y]
            if(RGB[0]==0) and (RGB[1]==0) and (RGB[2]==0):
                if (y_result<y) and (x_result<x) and (20<(checkPixels(image, (x,y)))):
                    y_result = y
                    x_result = x
    return (x_result, y_result)


def RightLegPoint(image, top):
    width, height = image.size
    pixels = image.load()
    y_result = 0
    x_result = width
    x_top,y_top = top
    for x in range(width-1,x_top,-1):
        for y in range(height-1,y_top,-1):
            RGB = pixels[x,y]
            if(RGB[0]==0) and (RGB[1]==0) and (RGB[2]==0):
                if (y_result<y) and (x_result>x) and (20<(checkPixels(image, (x,y)))):
                        y_result = y
                        x_result = x
    return (x_result, y_result)

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
    ref_image = Image.open("ref5.jpg")
    #ref_image.save('r1.bmp')
    body_image = Image.open("body5.jpg")
    #body_image.save('b1.bmp')

    ref_image = BW(ref_image)
    ref_image = Find_Edges(ref_image)
    ref_image = Invert(ref_image)
   # ref_image.save('r2_edge.bmp')


    body_image = BW(body_image)
    body_image = Find_Edges(body_image)
    body_image = Invert(body_image)
   # body_image.save('b2_edge.bmp')


    diff = ImageChops.difference(ref_image, body_image)
    diff = Invert(diff)
    diff = CleanImage(diff)
    #diff.save('d1.bmp')

    x_top, y_top = TopPoint(diff)
    x_leftLeg, y_leftLeg = LeftLegPoint(diff, (x_top, y_top))
    x_rightLeg, y_rightLeg = RightLegPoint(diff, (x_top, y_top))
    height = round((y_rightLeg + y_leftLeg)/2) - y_top

    x_middle, y_middle = MiddlePoint(diff, (x_top, y_top), height)
    x_waist, y_waist = WaistPoint(diff, (x_top, y_top), height)


    x_rightArm, y_rightArm = RightArmPoint(diff, (x_top, y_top), height)
    x_leftArm, y_leftArm = LeftArmPoint(diff, (x_top, y_top), height)



    drawLine(diff, (x_top, y_top), (x_middle,y_middle))
    drawLine(diff, (x_middle,y_middle), (x_leftArm, y_leftArm))
    drawLine(diff, (x_middle,y_middle), (x_rightArm, y_rightArm))
    drawLine(diff, (x_middle,y_middle), (x_waist, y_waist))
    drawLine(diff, (x_waist, y_waist), (x_rightLeg, y_rightLeg))
    drawLine(diff, (x_waist, y_waist), (x_leftLeg, y_leftLeg))

    drawCircle(diff, (x_rightLeg, y_rightLeg))
    drawCircle(diff, (x_leftLeg, y_leftLeg))
    drawCircle(diff, (x_top, y_top))
    drawCircle(diff, (x_rightArm, y_rightArm))
    drawCircle(diff, (x_leftArm, y_leftArm))
    drawCircle(diff, (x_middle, y_middle))
    drawCircle(diff, (x_waist, y_waist))
   # diff.save('d2.bmp')
    diff.show()

if __name__=="__main__":
    main()
