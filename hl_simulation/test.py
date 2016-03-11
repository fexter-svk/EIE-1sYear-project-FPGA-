from PIL import Image
im = Image.open("lena.ppm") #Can be many different formats.
pix = im.load()
print(im.size) #Get the width and hight of the image for iterating over
print(pix[100,100]) #Get the RGBA Value of the a pixel of an image
pix[100,100] = (0, 0, 0) # Set the RGBA Value of the image (tuple)
for x in range(100):
    for y in range(100):
        pix[x,y] = (0, 0, 0)
im.show()