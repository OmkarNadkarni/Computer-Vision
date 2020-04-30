                                   %% Q4 MOTION ESTIMATION
 
%% A. DISPLAY MOTION VECTOR BLOCK=16*16 SEARCH= 20*20
clc;
VidObj = VideoReader('DatasetC.mpg');
block_size = 16;
search_window =20;
frame_no = 6;   % this is reference frame (motion vector will be displayed on frame_no+1)
ICV_motionestimation(VidObj,block_size,search_window,frame_no);

%% B. PREDICTED IMAGE C. VARIABLE BLOCK SIZE  D. VARIABLE SEARCH WINDOW
clc;
VidObj = VideoReader('DatasetC.mpg');
block_size = 16;
search_window =20;
ref_frame = 6; % this is reference frame (predicted frame will be (frame_no+1)
ICV_prediction(VidObj,block_size,search_window,ref_frame);
 

%% E. PLOT TIME TAKEN 
VidObj = VideoReader('DatasetC.mpg');
mat1 = zeros(1,3);
mat2 = zeros(1,3);
mat1(1,:) = [8,16,32];
mat2(1,1)=ICV_prediction(VidObj,8,8,10);
mat2(1,2)=ICV_prediction(VidObj,8,16,10);
mat2(1,3)=ICV_prediction(VidObj,8,32,10);
figure, bar(mat1,mat2);
                                    %% Q5 OBJECTS

%% A. FRAME DIFFERENCING USING THRESHOLD
VidObj = VideoReader('DatasetC.mpg');
threshold = 30;
ICV_framediff(VidObj,threshold);

%% B. USING PREVIOUS FRAMES AS REFERENCE FRAMES
VidObj = VideoReader('DatasetC.mpg');
threshold =20;
ICV_variable_ref_frame(VidObj,threshold);
%% C. GENERATE REFERENCE FRAME
clc;
vidobj = VideoReader('DatasetC.mpg');
img =ICV_generateback(vidobj);
imshow(img);
%% D. COUNTING NUMBER OF MOVING OBJECTS
clc;
vidobj = VideoReader('DatasetC.mpg');
ICV_movingobjects(vidobj);

                                    %% Q6 TEXTURE
                                    
%% A. LBP OF WINDOWS AND DISPLAY LOCAL DISCRIPTORS
img = imread('face-2.jpg');
window_size = 64;
ICV_localdiscriptor(img,window_size);

%% B. GLOBAL DESCRIPTOR
img = imread('car-3.jpg');
window_size = 64;
final_hist = ICV_LBPH(img,window_size);
plot(final_hist);

%% C. CLASSIFICATION OF IMAGES  D. DECREASING WINDOW SIZE  E. INCREASING WINDOW SIZE
clc;
face_img = imread('face-1.jpg'); %reference face img
car_img  = imread('car-1.jpg'); %reference car img
target_img = imread('face-3.jpg'); %image to be classified
window_size = 64;
ICV_classify(target_img,window_size,face_img,car_img);


















