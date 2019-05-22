function epg_construct_medfilt
addpath('/vols/Data/km/fengqi/NIfTI');

stru=qf_load('struct_to_diff.nii.gz');
sz=size(stru)
T20=zeros(sz);

sz=size(T20);
ind=[];
ALP=[];

zer=zeros(sz(1),sz(2));
for ii=1:sz(3)
ii
    try
        load(strcat('medalp-',num2str(ii),'.mat'));
        ALP=cat(3,ALP,medalp);
    catch exception
      
        ALP=cat(3,ALP,zer);  
        ind=cat(1,ind,ii);
    end
end
ind'
qf_save(ALP,'ALP_medfilt.nii.gz');

