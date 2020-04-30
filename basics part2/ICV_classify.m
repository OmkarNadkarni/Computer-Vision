function ICV_classify(target_img,window_size,face_img,car_img)

%REFERENCE histograms
face_ref_hist = ICV_LBPH(face_img,window_size);
car_ref_hist = ICV_LBPH(car_img,window_size);

%TARGET IMAGE histogram
target_hist = ICV_LBPH(target_img,window_size);

face_similarity = ICV_Histogram_intersection(face_ref_hist,target_hist);
car_similarity = ICV_Histogram_intersection(car_ref_hist,target_hist);

mat = [face_similarity,car_similarity];
bar(mat);
ylim([0,1]);
title({sprintf('Histogram Intersection window size= %d',window_size),' '});
set(gca, 'XTickLabel', {'FACE','CAR'});
text(1:length(mat),mat,num2str(mat'),'vert','bottom','horiz','center'); 
box off

end