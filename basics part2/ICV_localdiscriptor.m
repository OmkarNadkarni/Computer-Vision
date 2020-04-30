function ICV_localdiscriptor(RGBimg,window_size)

%convert image to greyscale
Gimg = 0.2989 * RGBimg(:,:,1) + 0.5870 * RGBimg(:,:,2) + 0.1140 * RGBimg(:,:,3);
Gimg_height = size(Gimg,1);
Gimg_width = size(Gimg,2);

%zero padding for image
img = uint8(zeros(Gimg_height+2,Gimg_width+2));
img(2:Gimg_height+1,2:Gimg_width+1) = Gimg;
img_height = size(img,1);
img_width = size(img,2);

%create empty matrix to store final image
fimg = uint8(zeros(Gimg_height,Gimg_width));

% converting whole image into LBP
for i=2:img_height-1
    for j=2:img_width-1
        fimg(i-1,j-1) = ICV_getpixel(i,j,img); 
    end
end

%dividing image into windows
no_of_window_ht=size(fimg,1)/window_size;
no_of_window_wt=size(fimg,2)/window_size;

total_windows = no_of_window_ht*no_of_window_wt  ;
hist = zeros(256,1,total_windows);
x=0;
for i=1:window_size:size(fimg,1)-window_size+1
    for j=1:window_size:size(fimg,2)-window_size+1
        x=x+1;
        matrix = fimg(i:window_size+i-1,j:window_size+j-1);
        
        hist(:,:,x) = ICV_calculate_histogram(matrix);
%         figure
        subplot(3,1,1),imshow(Gimg(i:window_size+i-1,j:window_size+j-1,:)),title(sprintf('image window %d',x));
        subplot(3,1,2),imshow(matrix),title(sprintf('window %d',x));
        subplot(3,1,3),plot(hist(:,:,x)),title(sprintf('histogram %d',x));
        drawnow;

    end
    

end