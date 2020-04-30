function intersection =  ICV_Histogram_intersection(ref_hist,target_hist)

intersection =0;
for i=1:size(ref_hist,1)
    intersection = intersection + min(ref_hist(i,1),target_hist(i,1));
end
intersection = intersection/ sum(ref_hist);

end