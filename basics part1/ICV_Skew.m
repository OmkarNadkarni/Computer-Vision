function fimg = ICV_Skew(img,angle) 

%IMAGE PROPERTIES
img_height = size(img,1);
img_width = size(img,2);
img_midx = ceil(img_height/2);
img_midy = ceil(img_width/2);
 
extra_width = abs(ceil(img_height/(1/tand(90-angle))));  %extra width to fit the image after shearing 

%final image properties
fimg_height = img_height;
fimg_width = img_width + extra_width; %add extra_width to fit the image
fimg = uint8(zeros(fimg_height,fimg_width,3));
fimg_midx = ceil(fimg_height/2);
fimg_midy = ceil(fimg_width/2);


%LOOPING THROUGH THE PIXELS
for i=1: img_height
    for j=1: img_width
        
           % FIRST TRANSLATION 
            x1 = i - img_midx;
            y1 = j- img_midy;
            
                %MATRIX Shear
                x_rot = x1*1 + y1*0;
                y_rot = x1*1/tand(angle) + y1*1 ;
                
                %SECOND TRANSLATION
            x2 = round(x_rot) + fimg_midx;
            y2 = round(y_rot) + fimg_midy;
            
            if x2>=1 && y2>=1 && x2<=fimg_height && y2<= fimg_width
                fimg(x2,y2,:) = img(i,j,:);
            end       
        
    end
end

end