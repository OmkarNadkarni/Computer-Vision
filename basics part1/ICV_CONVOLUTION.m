function new_img = ICV_CONVOLUTION(img,kernel)

img_height = size(img,1);
img_width = size(img,2);
grey_img =zeros(img_height,img_width);

%CONVERTING TO GREY IMAGE
    if size(img,3) == 3
        for i=1:img_height
            for j=1:img_width
            grey_img(i,j) = 0.2989 * img(i,j,1) + 0.5870 * img(i,j,2) + 0.1140 * img(i,j,3);
            grey_img(i,j) = grey_img(i,j)/255;
            end
        end
    else
        grey_img = img;
    end

ker_len = size(kernel,1);
if ker_len == 3
    padding = 1;
elseif ker_len == 5
    padding =2;
elseif ker_len ==7
    padding = 3;
end

fimg =  double(zeros( img_height + ker_len-1, img_width + ker_len -1));


fimg(padding+1 : img_height+ padding , padding+1 : img_width+padding ) = grey_img;
new_img = zeros(img_height,img_width);

for height = padding+1: img_height+padding
    for width = padding +1: img_width+padding
        matrix = ICV_GetMatrix(height,width,padding,fimg,ker_len); %TO GET THE MATRIX OF NEIGHBOURING PIXELS
        fmat = sum(dot(kernel,matrix));
        
         new_img(height-padding,width-padding) = fmat;
    end
end



end









