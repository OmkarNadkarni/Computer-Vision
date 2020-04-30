* ALL THE FUNCTIONS ARE RUN THOUGH 'ICV-MainScript.m' FILE *

EACH TASK IS SEPERATED BY COMMENTED LINE TO DISTINGUISH BETWEEN TASKS

Q1 - The goal is to rotate and skew given image manually using basic matrix multiplication 
HAS FOUR FUNCTIONS
1)  ICV_Rotation -: For rotation
2) ICV_Skew -: For shearing an image along x-axis
3) ICV_Rotate_Shear -: for rotation and skewing
4) ICV_Shear_Rotate -: for shearing and then rotate

Q2 Perform 3*3,5*5,7*7 convolution on given images.
HAS 2 FUNCTIONS
1)  ICV_CONVOLUTION -: this function takes image and kernel as input and gives image output. 
2)  ICV_GetMatrix  -: This function gives matrix for a particular pixel from the image to 
		      perform convolution. It is called internally by CONVOLUTION function and 
		      does not need to be called seperately.

Q3 Histrogram intersection between different frames of a given video, find similarity between 2 frames. 
HAS 3 FUNCTIONS
1)  ICV_VISUALISE -: 		this function is used to visualise histogram frame by frame
2) ICV_Histogram_two_frames -:  this function gives histogram of 2 specified frames
3) ICV_Histogram_intersection -: THis function gives histogram intersection of the two 
				 frames.
