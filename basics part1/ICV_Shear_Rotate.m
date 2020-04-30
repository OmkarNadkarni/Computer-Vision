 function fimg = ICV_Shear_Rotate(img,rot_angle,skew_angle)
img_height = size(img,1);
img_width = size(img,2);
img_midx = ceil(img_height/2);
img_midy = ceil(img_width/2);
rot_angle = 20;
rot_angle =rot_angle *-1;



extra_width = abs(ceil(img_height/(1/tand(90-skew_angle))));
skew_width = img_width + extra_width;


%TO CALCULATE HEIGHT AND WIDTH AFTER IMAGE ROTATION using trigonometry
w2 = cosd(rot_angle)* skew_width;
h2 = sind(rot_angle) * skew_width ;
w1 = cosd(90 - rot_angle) * img_height ;
h1 = sind(90 - rot_angle) * img_height ;

% final image in which the image will be stored after rotation
fimg_height = ceil(abs(h1)+abs(h2));
fimg_width = ceil(abs(w1)+abs(w2));
fimg = uint8(zeros(fimg_height,fimg_width,3));
fimg_midx = ceil(fimg_height/2);
fimg_midy = ceil(fimg_width/2);


for i=1: img_height
    for j=1: img_width
        
           % FIRST TRANSLATION TOWARDS ORIGIN
            x1 = i - img_midx;
            y1 = j- img_midy;
            
            %MATRIX Shear
                x_shear = x1*1 + y1*0;
                y_shear = x1*1/tand(skew_angle) + y1*1 ;
                
                %MATRIX ROTATION
                x_rot = x_shear*cosd(rot_angle) - y_shear*sind(rot_angle);
                y_rot = x_shear*sind(rot_angle) + y_shear*cosd(rot_angle) ;
                
                
                %SECOND TRANSLATION
            x2 = round(x_rot) + fimg_midx;
            y2 = round(y_rot) + fimg_midy;
            if x2>=1 && y2>=1 
                fimg(x2,y2,:) = img(i,j,:);
            end       
        
    end
end

% INTERPOLATING BY USING NEIGHBOURING FOUR PIXELS AND AVERAGE THEM 
for i=2:fimg_height-1
    for j=2:fimg_width-1
        if fimg(i,j,:) == 0 %IF THE CURRENT PIXEL IS BLACK
            mat = [fimg(i-1,j,:) fimg(i+1,j,:) fimg(i,j+1,:) fimg(i,j-1,:)]; %NEIGHBOURING 4 PIXELS
            fimg(i,j,:) = sum(mat)/4;
        end         
    end
end
 end
