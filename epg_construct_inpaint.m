function epg_construct_inpaint


if ~strfind(pwd,'Documents')
    addpath('/vols/Data/km/fengqi/NIfTI');
else
   addpath('/Users/fengqi/Documents/MND_REGISTRATION/EPG/EPG_code');
end

try
    T20=qf_load('_T2_map_t2.nii.gz');
catch exp
    T20=qf_load('../_T2_map_t2.nii.gz');
end

%epg_fix_linegap

sz=size(T20);
ind=[];
ALP=[];
T2Z=[];
S0Z=[];
T1Z=[];
ERZ=[];
zer=zeros(875,1167);
for ii=1:sz(2)
if ii==30
   aaa=1 
end
ii
    try
       	%load (strcat('fb-net100-',num2str(ii),'.mat'));
        im=imread(strcat('inpaint-',num2str(ii),'.png'));
        alpz=squeeze(im(:,:,1));
        ALP=cat(3,ALP,alpz);
       

    catch exception
      
        ALP=cat(3,ALP,zer);  
        ind=cat(1,ind,ii);
    end


end
ind'
ALP=permute(ALP,[1 3 2]);
qf_save(ALP(65:780,10:233,200:1057),'ALP_inpaint.nii.gz');


try
    stru=qf_load('struct_to_diff.nii.gz');
    str1=single(stru>200);
    qf_save(ALP.*str1,'masked_ALP_inpaint.nii.gz');
    
catch exception
    
end
%qf_save(T1Z,'T1Z.nii.gz');