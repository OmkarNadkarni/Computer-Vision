function pixel_val = ICV_getpixel(row,col,img)
   matrix = [img(row-1,col-1),img(row-1,col),img(row-1,col+1),img(row,col+1),img(row+1,col+1),img(row+1,col),img(row+1,col-1),img(row,col-1)];
   for j=1:size(matrix,2)
        if matrix(1,j) < img(row,col)
            matrix(1,j) =0;
        else
            matrix(1,j) =1;
        end
   end
   pixel_val = 0;
   %CONVERT BINARY TO HEXADECIMAL
   for i=1:size(matrix,2)
       exp = i-1;
        pixel_val = pixel_val + ( matrix(1,i)*(2^exp));
   end
  
    
end