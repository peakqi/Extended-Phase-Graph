function epg0_start_medfilt

ind=[];
for ii=1:240

ii
ind=cat(1,ind,ii);
    try
       	%load (strcat('fb-net100-',num2str(ii),'.mat'));
        %load(strcat('medalp-',num2str(ii),'.mat'));
        

    catch exception
      

        %ind=cat(1,ind,ii);
    end


end


save ind240.mat;

