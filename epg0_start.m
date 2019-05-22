function epg0_start

ind=[];
for ii=1:176

ii
    try
       	%load (strcat('fb-net100-',num2str(ii),'.mat'));
        load(strcat('fminsearch-',num2str(ii),'.mat'));
        

    catch exception
      

        ind=cat(1,ind,ii);
    end


end


save ind.mat;

