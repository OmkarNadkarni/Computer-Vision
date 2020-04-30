function timee= ICV_prediction(vidobj,block_size,search_size,ref_frame_no)
tic;
frames = read(vidobj);
frame_height = size(frames,1);
frame_width = size(frames,2);
total_frames = size(frames,4);

%zero padding for all frames
padding_each = ceil((search_size-block_size)/2); %padding for each side of the frame
f_frames = uint8(zeros(frame_height+(padding_each*2),frame_width+(padding_each*2),size(frames,3),total_frames));
f_frames(padding_each+1:frame_height+padding_each,padding_each+1:frame_width+padding_each,:,:) = frames;
ref_frame = f_frames(:,:,:,ref_frame_no);
target_frame = f_frames(:,:,:,ref_frame_no+1);
fimg = ref_frame;
for i=padding_each+1:block_size:size(f_frames,1)-search_size+padding_each+1
    for j=padding_each+1:block_size:size(f_frames,2)-search_size+padding_each+1
        ref_block = double(ref_frame(i:i+block_size-1,j:j+block_size-1));
        MAE =10000;
        
            limit_k = i+search_size-padding_each-block_size;
            limit_l = j+search_size-padding_each-block_size;
         for k=i-padding_each:limit_k
             for l=j-padding_each:limit_l
                 
                target_block = double(target_frame(k:k+block_size-1,l:l+block_size-1));
                temp =((1/block_size)^2)*sum(sum(abs(target_block-ref_block)));
       
                if MAE>=temp 
                    MAE=temp;
                    target_x = k;
                    target_y = l;
                end
             end
         end
         fimg(target_x:target_x+block_size-1,target_y:target_y+block_size-1,:) =ref_frame(i:i+block_size-1,j:j+block_size-1,:);
         
    end
end
fref_frame =  ref_frame(padding_each+1:frame_height+padding_each,padding_each+1:frame_width+padding_each,:);
ftarget_frame =  target_frame(padding_each+1:frame_height+padding_each,padding_each+1:frame_width+padding_each,:);
ffimg =  fimg(padding_each+1:frame_height+padding_each,padding_each+1:frame_width+padding_each,:);
subplot(1,3,1),imshow(fref_frame),title(sprintf(' frame - %d',ref_frame_no));
subplot(1,3,2),imshow(ftarget_frame),title(sprintf(' frame - %d',ref_frame_no+1));
subplot(1,3,3),imshow(ffimg),title(sprintf('predicted frame %d',ref_frame_no+1));
%figure,imshow(fref_frame),title(sprintf(' frame - %d',ref_frame_no));
%figure,imshow(ftarget_frame),title(sprintf(' frame - %d',ref_frame_no+1));
% figure,imshow(ffimg),title(sprintf('predicted frame %d',ref_frame_no+1));
timee = toc;
end