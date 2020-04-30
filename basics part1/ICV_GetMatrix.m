%TO GET THE MATRIX OF NEIGHBOURING PIXELS
function mat = ICV_GetMatrix(i,j,padding,fimg,ker_len)
mat = zeros(ker_len);
ROW=1;
COL=1;
        for x = -padding:padding  
            for y= -padding:padding
                mat(ROW,COL) = fimg(i+x,j+y);
                COL = COL+1;
            end
            ROW =ROW+1;
            COL = 1;
        end
end
