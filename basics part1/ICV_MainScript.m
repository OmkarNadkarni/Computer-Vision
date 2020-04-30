% % % Q1 A) IMAGE ROTATION AND SKEW
% %                     %ROTATION
img = imread('face-1.jpg');
rot_angle = 50;
rot_angle = rot_angle *-1;  %CLOCKWISE ROTATION (-1)
fimg_ROT = ICV_Rotation(img,rot_angle);
imshow(fimg_ROT);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % %                 %SKEW
img = imread('face-1.jpg');
skew_angle = 50;
fimg_SKEW = ICV_Skew(img,skew_angle);
imshow(fimg_SKEW);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %         % Q1 B) ROTATION_SKEW AND SKEW_ROTATION
% %             % ROTATION AND SKEW

img = imread('face-1.jpg');
rot_angle = 20;
skew_angle = 50;
fimg = ICV_Rotate_Shear(img,rot_angle,skew_angle);
imshow(fimg);

% %             %SKEW AND ROTATION

img = imread('face-1.jpg');
rot_angle = 20;
skew_angle = 50;
fimg = ICV_Shear_Rotate(img,rot_angle,skew_angle);
imshow(fimg);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %         % Q2  CONVOLUTION AND FILTERING

% %             % A) AVERAGE INTENSITY FILTER

img = imread('car-2.jpg');
kernel = 1/9*[1 1 1; 1 1 1; 1 1 1];
fimg = ICV_CONVOLUTION(img,kernel);
imshow(fimg);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %             % B) KERNEL A AND B

img = imread('car-1.jpg');
kernel_A = 1/16 * [1 2 1; 2 4 2; 1 2 1];
kernel_B = [0 1 0; 1 -4 1; 0 1 0];
img_A = ICV_CONVOLUTION(img,kernel_A);
imshow(img_A);
figure
img_B = ICV_CONVOLUTION(img,kernel_B);
imshow(img_B);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% C) i) A FOLLOWED BY A

img = imread('car-1.jpg');
kernel_A = 1/16 *[1 2 1; 2 4 2; 1 2 1];
img_A = ICV_CONVOLUTION(img,kernel_A);  %FIRST A
img_B = ICV_CONVOLUTION(img_A,kernel_A); %SECOND A
imshow(img_B);

% c) ii) KERNEL A FOLLOWED BY B

img = imread('car-1.jpg');
kernel_A = 1/16*[1 2 1; 2 4 2; 1 2 1];
kernel_B = [0 1 0; 1 -4 1; 0 1 0];
img_A = ICV_CONVOLUTION(img,kernel_A);
img_B = ICV_CONVOLUTION(img_A,kernel_B);
imshow(img_B);

% c) iii) KERNEL B FOLLOWED BY A

img = imread('car-1.jpg');
kernel_A = 1/16*[1 2 1; 2 4 2; 1 2 1];
kernel_B = [0 1 0; 1 -4 1; 0 1 0];
img_A = ICV_CONVOLUTION(img,kernel_B);
img_B = ICV_CONVOLUTION(img_A,kernel_A);
imshow(img_B);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %    % D) 5*5 KERNEL

img = imread('car-1.jpg');
kernel_A = 1/256*[1 4 6 4 1;
    4 16 24 16 4;
    6 24 36 24 6;
    4 16 24 16 4;
    1 4 6 4 1];
kernel_B = [1 1 1 1 1;1 1 1 1 1;1 1 -24 1 1;1 1 1 1 1;1 1 1 1 1];

% %     % i) A FOLLOWED BY A

img_A = ICV_CONVOLUTION(img,kernel_A);
img_B = ICV_CONVOLUTION(img_A,kernel_A);
imshow(img_B);

% % %     % ii) A FOLLOWED BY B

img_A = ICV_CONVOLUTION(img,kernel_A);
img_B = ICV_CONVOLUTION(img_A,kernel_B);
imshow(img_B);

% % %     % iii) B FOLLOWED BY A

img_A = ICV_CONVOLUTION(img,kernel_B);
img_B = ICV_CONVOLUTION(img_A,kernel_A);
imshow(img_B);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %       % D) 7*7 KERNEL

img = imread('car-1.jpg');

kernel_A = 1/900*  [1 4 6   8  6 4  1;
    4 16 24 32 24 16 4;
    6 24 36 48 36 24 6;
    8 32 48 64 48 32 8;
    6 24 36 48 36 24 6;
    4 16 24 32 24 16 4;
    1 4  6   8  6 4  1];

kernel_B = [1 1 1 1 1 1 1;
    1 1 1 1 1 1 1;
    1 1 1 1 1 1 1;
    1 1 1 -48 1 1 1;
    1 1 1 1 1 1 1;
    1 1 1 1 1 1 1;
    1 1 1 1 1 1 1];



% %     % i) A FOLLOWED BY A

img_A = ICV_CONVOLUTION(img,kernel_A);
img_B = ICV_CONVOLUTION(img_A,kernel_A);
imshow(img_B);

% % %     % ii) A FOLLOWED BY B

img_A = ICV_CONVOLUTION(img,kernel_A);
img_B = ICV_CONVOLUTION(img_A,kernel_B);
imshow(img_B);

% % %     % iii) B FOLLOWED BY A

img_A = ICV_CONVOLUTION(img,kernel_B);
img_B = ICV_CONVOLUTION(img_A,kernel_A);
imshow(img_B);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %         % 4) HISTOGRAM

% %     % A) VISUALISE HISTOGRAM FOR EACH FRAME

vidObj = VideoReader('DatasetB.avi');
ICV_VISUALISE(vidObj);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %     % HISTOGRAM OF TWO FRAMES

vidObj = VideoReader('DatasetB.avi');
frame_A = 200;
frame_B = 315;
ICV_Histogram_two_frames(vidObj,frame_A, frame_B);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % %     % C) HISTOGRAM AND INTERSECTION OF 2 FRAMES

vidObj = VideoReader('DatasetB.avi');
frame_A = 101;
frame_B = 102;
ICV_Histogram_intersection(vidObj,frame_A, frame_B);





