function ICV_Histogram_two_frames(vidObj,frame_A, frame_B)


vid_frames = read(vidObj);
total_frames = size(vid_frames,4);
frame_height = size(vid_frames,1);
frame_width = size(vid_frames,2);

% HISTOGRAM OF FRAME A , B AND INTERSECTION WILL BE STORED IN THESE MATRICES
RGB_hist_A = zeros(256,3);
RGB_hist_B = zeros(256,3);


    for j=1:frame_height
        for k=1: frame_width
            %FOR THE FIRST FRAME
            % ADDING +1 SINCE INDEX STARTS FROM ONE BUT COLOUR VALUE RANGES FROM 0-255
            val = [vid_frames(j,k,1,frame_A)+1,vid_frames(j,k,2,frame_A)+1,vid_frames(j,k,3,frame_A)+1];
            RGB_hist_A(val(1),1) = RGB_hist_A(val(1),1)+1;
            RGB_hist_A(val(2),2) = RGB_hist_A(val(2),2)+1;
            RGB_hist_A(val(3),3) = RGB_hist_A(val(3),3)+1;
            
            %FOR THE SECOND FRAME
            val = [vid_frames(j,k,1,frame_B)+1,vid_frames(j,k,2,frame_B)+1,vid_frames(j,k,3,frame_B)+1];
            RGB_hist_B(val(1),1) = RGB_hist_B(val(1),1)+1;
            RGB_hist_B(val(2),2) = RGB_hist_B(val(2),2)+1;
            RGB_hist_B(val(3),3) = RGB_hist_B(val(3),3)+1;
        end
        
    end  
    
    A = max(RGB_hist_A);
    B= max(RGB_hist_B);
    max_Y = max(max(A),max(B)); % max value of frequency in both histograms so the y axis remains same in both
   

subplot(2,2,1), imshow(vid_frames(:,:,:,frame_A));
title(sprintf('frame %d',frame_A));
subplot(2,2,2), plot(RGB_hist_A);
title(sprintf('Histogram of frame %d',frame_A));
xlabel('Colour Values');
ylabel('Frequency');
xlim([0,260]);  %colour is stored from 1-256 in the matrix
ylim([0,max_Y]);


subplot(2,2,3), imshow(vid_frames(:,:,:,frame_B));
title(sprintf('frame %d',frame_B));
subplot(2,2,4), plot(RGB_hist_B);
title(sprintf('Histogram of frame %d',frame_B));
xlabel('Colour Values');
ylabel('Frequency');
xlim([0,260]);
ylim([0,max_Y]);


end