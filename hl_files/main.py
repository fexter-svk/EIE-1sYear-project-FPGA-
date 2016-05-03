from __future__ import print_function
from PIL import Image, ImageChops, ImageFilter, ImageOps, ImageDraw

#LEFT (YELLOW)
# R = 207 G = 220 B = 64
#
#RIGHT (GREEN)
# R = 140 G = 225 B = 103
#
#
def mainBlock(image,):
    pixels = image.load()
    width, height = image.size
    x_right_arm, y_right_arm = (0,0)
    x_left_arm, y_left_arm = (0,0)
    for y in range(height):
        for x in range(width):
            RGB = pixels[x,y]
            if not (((80<=RGB[0]) and (RGB[0]<=145)) and ((150<=RGB[1]) and (RGB[1]<=230)) and ((30<=RGB[2]) and (RGB[2]<=108))):
                if not (((170<=RGB[0]) and (RGB[0]<=222)) and ((185<=RGB[1]) and (RGB[1]<=235)) and ((49<=RGB[2]) and (RGB[2]<=149))):
                    pixels[x,y] = (0,0,0)
                else:
                    if (x_right_arm==0) and (y_right_arm==0):
                        x_right_arm = x
                        y_right_arm = y
                    #GREEN
            else:
                if (x_left_arm==0) and (y_left_arm==0):
                    x_left_arm = x
                    y_left_arm = y
                pass
                #YELLOW
    if (x_right_arm != 0) and (y_right_arm != 0) and (x_left_arm != 0) and (y_left_arm!=0):
        volume = abs(round((y_right_arm+y_left_arm/2)-240))
        volume = volume // 80
    return (image, volume)



def main():
    image = Image.open("ex1.jpg")
    result = tuple()
    result = mainBlock(image)
    result[0].show()
    print(result[1])
    x_left_arm, y_left_arm = (0,0)
    x_right_arm, y_right_arm = (0,0)



if __name__=="__main__":
    main()
