from __future__ import print_function
from PIL import Image, ImageChops, ImageFilter, ImageOps, ImageDraw

def mainBlock(image):
    pixels = image.load()
    width, height = image.size
    x_right_arm, y_right_arm = (0,0)
    x_left_arm, y_left_arm = (0,0)
    red_found = False
    blue_found = False
    for y in range(height):
        for x in range(width):
            RGB = pixels[x,y]
            if (((0<=RGB[0]) and (RGB[0]<=100)) and ((0<=RGB[1]) and (RGB[1]<=100)) and ((100<=RGB[2]) and (RGB[2]<=255)) and not blue_found):
                blue_found = True
                x_right_arm = x
                y_right_arm = y
            if (((200<=RGB[0]) and (RGB[0]<=255)) and ((0<=RGB[1]) and (RGB[1]<=80)) and ((0<=RGB[2]) and (RGB[2]<=80)) and not red_found):
                red_found = True
                x_left_arm = x
                y_left_arm = y
            pixels[x,y] = (0,0,0)

    for x in range(x_right_arm, x_right_arm + 40):
        for y in range(y_right_arm, y_right_arm + 40):
            if (x<width and y<height):
                pixels[x,y] = (0,0,255)

    for x in range(x_left_arm, x_left_arm + 40):
        for y in range(y_left_arm, y_left_arm + 40):
            if (x<width and y<height):
                pixels[x,y] = (255,0,0)

    return image



def main():
    image = Image.open("ex2.jpg")
    image.show()
    image = mainBlock(image)
    image.show()
    image.save("detected2.jpg")



if __name__=="__main__":
    main()
