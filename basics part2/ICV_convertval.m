function img =  ICV_convertval (img,Cval,Nval)

for i=1:size(img,1)
    for j=1:size(img,2)
        if img(i,j)==Cval
            img(i,j)=Nval;
        end
    end
end

end