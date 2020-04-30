function ICV_motionestimation(vidobj,block_size,search_size,frame_no)

frames = read(vidobj);
frame_height = size(frames,1);
frame_width = size(frames,2);
total_frames = size(frames,4);
total_windows = (frame_height*frame_width)/(block_size*block_size);
qmat = double(zeros(total_windows,4)); %to store x,y,dx,dy for quiver function
%zero padding for all frames
padding_each = (search_size-block_size)/2; %padding for each side of the frame
f_frames = uint8(zeros(frame_height+(padding_each*2),frame_width+(padding_each*2),size(frames,3),total_frames));
f_frames(padding_each+1:frame_height+padding_each,padding_each+1:frame_width+padding_each,:,:) = frames;
ref_frame = f_frames(:,:,:,frame_no);
target_frame = f_frames(:,:,:,frame_no+1);
subplot(1,3,1),imshow(frames(:,:,:,frame_no)),title(sprintf('Frame(t)-%d',frame_no));
subplot(1,3,2),imshow(frames(:,:,:,frame_no)),title(sprintf('Frame(t+1)-%d',frame_no+1));
subplot(1,3,3),imshow(target_frame(padding_each+1:frame_height+padding_each,padding_each+1:frame_width+padding_each,:)),title('Motion field(t+1)');
hold on;
iwindow = 1;
for i=padding_each+1:block_size:size(f_frames,1)-search_size+padding_each+1
    for j=padding_each+1:block_size:size(f_frames,2)-search_size+padding_each+1
        
        ref_block = double(ref_frame(i:i+block_size-1,j:j+block_size-1));
        ref_x = i + block_size/2;
        ref_y = j +block_size/2;
         MAE =10000;
         if search_size==block_size
            limit_k = i+search_size-padding_each-block_size;
            limit_l = j+search_size-padding_each-block_size;
        else
            limit_k = i+search_size-padding_each-block_size-1;
            limit_l = j+search_size-padding_each-block_size-1;
        end
         for k=i-padding_each:limit_k 
             for l=j-padding_each:limit_l
                target_block = double(target_frame(k:k+block_size-1,l:l+block_size-1));
                temp =((1/block_size)^2)*sum(sum(abs(target_block-ref_block)));
       
                if MAE>=temp 
                    MAE=temp;
                    target_x = k+block_size/2;
                    target_y = l+block_size/2;
                end
             end
         end
         dx = target_x-ref_x;
         dy = target_y-ref_y;
         qmat(iwindow,:) = [ref_y,ref_x,dy,dx];
         iwindow =iwindow+1; 
    end
end
 q = quiver(qmat(:,1),qmat(:,2),qmat(:,3),qmat(:,4));
 q.Color = 'blue';
end