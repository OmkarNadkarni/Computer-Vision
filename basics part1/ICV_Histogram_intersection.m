function ICV_Histogram_intersection(vidObj,frame_A, frame_B)
vid_frames = read(vidObj);

total_frames = size(vid_frames,4);
frame_height = size(vid_frames,1);
frame_width = size(vid_frames,2);
resolution = frame_height * frame_width;
% HISTOGRAM OF FRAME A , B AND INTERSECTION WILL BE STORED IN THESE MATRICES
RGB_hist_A = zeros(256,3);
RGB_hist_B = zeros(256,3);
RGB_intersec = zeros(256,3);


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
   

    %FIND INTERSECTION
    
    sum_of_min_R =0;
    sum_of_min_G =0;
    sum_of_min_B =0;
    
    for x=1:256
        sum_of_min_R = sum_of_min_R + min(RGB_hist_A(x,1),RGB_hist_B(x,1));
        sum_of_min_G = sum_of_min_G + min(RGB_hist_A(x,2),RGB_hist_B(x,2));
        sum_of_min_B = sum_of_min_B + min(RGB_hist_A(x,3),RGB_hist_B(x,3));
    end
        sum_of_min_R_norm = sum_of_min_R/resolution ;
        sum_of_min_G_norm = sum_of_min_G/resolution ;
        sum_of_min_B_norm = sum_of_min_B/resolution ;
        
        RGB_inter = [sum_of_min_R,sum_of_min_G,sum_of_min_B] ;
        RGB_norm = [ sum_of_min_R_norm ,sum_of_min_G_norm, sum_of_min_B_norm];
        
        
  %DISPLAY FRAME,HISTOGRAM AND INTERSECTION
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

figure
%BAR GRAPH PLOT
subplot(2,1,1),bar(RGB_inter);
ylim([0,resolution]);
title({sprintf('Histogram Intersection of frame %d and frame %d',frame_A, frame_B),'  '});
set(gca, 'XTickLabel', {'R','G','B'});
text(1:length(RGB_inter),RGB_inter,num2str(RGB_inter'),'vert','bottom','horiz','center'); 
box off

%NORMALISED BAR GRAPH PLOT
subplot(2,1,2),bar(RGB_norm);
ylim([0,1]);
title({sprintf('Histogram Intersection of frame %d and frame %d (NORMALISED)',frame_A, frame_B),' '});
set(gca, 'XTickLabel', {'R','G','B'});
text(1:length(RGB_norm),RGB_norm,num2str(RGB_norm'),'vert','bottom','horiz','center'); 
box off

end