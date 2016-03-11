from __future__ import print_function
from PIL import Image, ImageChops
import string

def BW(image):
    image = image.convert('LA')
    return image


def main():
    ref_image = Image.open("ref2.jpg")
    body_image = Image.open("body2.jpg")
    ref_image = BW(ref_image)
    body_image = BW(body_image)
    body_image.show()
    diff = ImageChops.difference(ref_image, body_image)
    diff = diff.convert('LA')
    diff.show()

    #compare(ref_image, body_image)

    #print(ref_image.size())
    #ref_image.pixels

    #size = ref_image.size




if __name__=="__main__":
    main()
