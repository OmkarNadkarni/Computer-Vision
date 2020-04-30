function hist = ICV_calculate_histogram(matrix)
    
hist = zeros(256,1);

for i=1:size(matrix,1)
    for j=1:size(matrix,2)
       x = hist(matrix(i,j)+1,1);
       x = x+1;
       hist(matrix(i,j)+1,1) = x;
    end
end
val  =sum(hist);
hist = hist/val; %normalisation
end