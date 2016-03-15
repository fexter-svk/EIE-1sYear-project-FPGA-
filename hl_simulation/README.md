#HL Simulation of body detection

##Approach

- Our idea was to extract changes from the reference image that we have captured and then apply out simple algorithm to detect the body parts
- 1. Apply the BW filter on both __body__ and __reference__ images. The BlackandWhite filter is necessary for the edge detection (_Sobel filter_)
- 2. Detect edges on both images using the _Sobel filter_
- 3. Compare the differences on both images
- 4. Clean redundant pixels and filter out the noise

### ver 0.4
- Added an algorithm to detect right leg, left leg
- Added an algorithm to infer the position of waist and shoulders according to the statistical data
- Optimization of algorithms

### ver 0.3
- Added an algorithm to detect head, right hand, left hand, waist and torso

### ver 0.2
- Added a function to __Filter out the image__:  (CleanImage(image))
- Added a function to __Invert a picture__: (Invert(image))
- Added a function to __Find Edges__: (Find_Edges(image))
- Added a function to __Turn image into B-W__: (BW(image))
