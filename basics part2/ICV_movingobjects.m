function ICV_movingobjects(vidobj)
total_frames = read(vidobj);
frame_height = size(total_frames,1);
frame_width = size(total_frames,2);
frame_no = size(total_frames,4);
plotcar = uint16(zeros(frame_no,1));   

for x=1:frame_no-1
     img =ICV_var_framedifference(vidobj,x,x+1,30);
 fimg = uint8(zeros(frame_height+2,frame_width+2));
 fimg(2:frame_height+1,2:frame_width+1) = img;
 obj = uint16(zeros(150,1));
counter=1;
%   imshow(fimg);
   for i=2:frame_height+1
      for j=2:frame_width+1
        if fimg(i,j)==255
           if fimg(i-1,j)~=0
               fimg(i,j) = fimg(i-1,j);
               obj(fimg(i,j),1) = obj(fimg(i,j),1) +1;
               if fimg(i,j-1)>fimg(i,j)
               obj(fimg(i,j),1) = obj(fimg(i,j),1) + obj(fimg(i,j-1),1);
               fimg = ICV_convertval(fimg,fimg(i,j-1),fimg(i,j));
               end
                if fimg(i,j-1)<fimg(i,j) && fimg(i,j-1)~=0
               obj(fimg(i,j-1),1) = obj(fimg(i,j-1),1) + obj(fimg(i,j),1);
               fimg = ICV_convertval(fimg,fimg(i,j),fimg(i,j-1));
               end
           elseif fimg(i,j-1)~=0
           fimg(i,j) = fimg(i,j-1);
               obj(fimg(i,j),1) = obj(fimg(i,j),1) +1;
           else
               fimg(i,j) = counter;
               obj(fimg(i,j),1) = obj(fimg(i,j),1) +1;
               counter = counter+1;
           end
        end
      end
   end
objects=0;
for i=1:size(obj,1)
    if obj(i,1)>100
        objects=objects+1;
    end
end
plotcar(x,1) = objects;
end
bar(plotcar);
ylabel('number of objects');
xlabel('frames');
end