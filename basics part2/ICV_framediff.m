% Function displays frame differencing with 1st frame as reference
function  ICV_framediff(VidObj,THRESHOLD)
total_frames = read(VidObj);
Gtotal_frames = 0.2989 *total_frames(:,:,1,:) + 0.5870 *total_frames(:,:,2,:) + 0.1140 *total_frames(:,:,3,:);

ref_frame = Gtotal_frames(:,:,:,1); % reference frame

frame_height = size(ref_frame,1);
frame_width = size(ref_frame,2);
fimg = uint8(zeros(frame_height,frame_width));

 for x=2: size(total_frames,4)
     target_frame = Gtotal_frames(:,:,:,x); %target_frame
for i=1:frame_height
    for j=1:frame_width
        val = abs(double(ref_frame(i,j)) - double(target_frame(i,j)));
        if val>THRESHOLD
            fimg(i,j) = 255;
        else
            fimg(i,j) =0;
        end
    end
end
subplot(1,3,1), imshow(ref_frame),title('frame-1');
subplot(1,3,2), imshow(target_frame),title(sprintf('frame- %d',x));
subplot(1,3,3), imshow(fimg),title(sprintf('threshold- %d',THRESHOLD));
drawnow;
 end



end