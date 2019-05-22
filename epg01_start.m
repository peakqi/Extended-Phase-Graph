function epg01_start
addpath('/vols/Data/km/fengqi/NIfTI'); 
alp=qf_load('ALP.nii.gz');
n=21;
malp = medfilt3(alp,[n,n,n]);
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

