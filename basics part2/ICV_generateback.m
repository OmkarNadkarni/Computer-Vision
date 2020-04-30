function fimg =ICV_generateback(vidobj)

frames = read(vidobj);
frame_height = size(frames,1);
frame_width = size(frames,2);
total_frames = size(frames,4);
mat  = uint16(zeros(frame_height,frame_width,3));
for i=1:frame_height
    for j=1:frame_width
mat(i,j,1) = sum(frames(i,j,1,:));
mat(i,j,2) = sum(frames(i,j,2,:));
mat(i,j,3) = sum(frames(i,j,3,:));
    end
end

mat = mat/total_frames;
     fimg =uint8(mat);
end