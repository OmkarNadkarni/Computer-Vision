function  ICV_variable_ref_frame(VidObj,threshold)
total_frames = read(VidObj);
Gtotal_frames = 0.2989 *total_frames(:,:,1,:) + 0.5870 *total_frames(:,:,2,:) + 0.1140 *total_frames(:,:,3,:);
frame_height = size(Gtotal_frames,1);
frame_width = size(Gtotal_frames,2);
fimg = uint8(zeros(frame_height,frame_width));
ffimg = uint8(zeros(frame_height,frame_width));
 for x=1:size(total_frames,4)-1
     ref_frame = Gtotal_frames(:,:,x);
     target_frame = Gtotal_frames(:,:,x+1);
for i=1:frame_height
    for j=1:frame_width
        val = abs(double(ref_frame(i,j))-double(target_frame(i,j)));
        ffimg(i,j) = val;
        if val>threshold
            fimg(i,j) = 255;
        else
            fimg(i,j) =0;
        end
    end
end
subplot(1,3,1), imshow(ref_frame),title(sprintf('Frame(t)-%d',x));
subplot(1,3,2), imshow(ffimg),title(sprintf('without threshold'));
subplot(1,3,3), imshow(fimg),title(sprintf('frame difference threshold=%d',threshold));

drawnow;
 end



end