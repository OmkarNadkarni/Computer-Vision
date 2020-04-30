function ICV_VISUALISE(vidObj)

vid_frames = read(vidObj);
total_frames = size(vid_frames,4);
frame_height = size(vid_frames,1);
frame_width = size(vid_frames,2);

for frame =1: total_frames
    RGB_hist_A =zeros(256,3);
    for j=1:frame_height
        for k=1: frame_width
            val = [vid_frames(j,k,1,frame)+1,vid_frames(j,k,2,frame)+1,vid_frames(j,k,3,frame)+1];
            RGB_hist_A(val(1),1) = RGB_hist_A(val(1),1)+1;
            RGB_hist_A(val(2),2) = RGB_hist_A(val(2),2)+1;
            RGB_hist_A(val(3),3) = RGB_hist_A(val(3),3)+1;
            
        end    
    end
    
    plot(RGB_hist_A);
    title(sprintf('Histogram of frame %d',frame));
    xlabel('Colour Values');
    ylabel('Frequency');
    drawnow
end

end
    



