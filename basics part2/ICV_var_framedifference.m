function fimg = ICV_var_framedifference(VidObj,frame1,frame2,threshold)
total_frames = read(VidObj);
Gtotal_frames = 0.2989 *total_frames(:,:,1,:) + 0.5870 *total_frames(:,:,2,:) + 0.1140 *total_frames(:,:,3,:);
ref_frame = Gtotal_frames(:,:,:,frame1);
ref_frame = ICV_generateback(VidObj);
ref_frame = 0.2989 *ref_frame(:,:,1) + 0.5870 *ref_frame(:,:,2) + 0.1140 *ref_frame(:,:,3);

frame_height = size(ref_frame,1);
frame_width = size(ref_frame,2);
target_frame = Gtotal_frames(:,:,:,frame2);
fimg = uint8(zeros(frame_height,frame_width));
for i=1:frame_height
    for j=1:frame_width
        val = abs(double(ref_frame(i,j)) - double(target_frame(i,j)));
        if val>threshold
            fimg(i,j) = 255;
        else
            fimg(i,j) =0;
        end
    end
end

for row=2:frame_height-1
    for col=2:frame_width-1
   matrix = [fimg(row-1,col),fimg(row,col+1),fimg(row+1,col),fimg(row,col-1)];
    
   if sum(matrix)>=(255*2)
       fimg(row,col) =255;
    else
        fimg(row,col) =0;
    end

    end
end