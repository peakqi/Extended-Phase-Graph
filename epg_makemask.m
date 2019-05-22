function epg_makemask

if isempty(strfind(pwd,'Documents'))
    addpath('/vols/Data/km/fengqi/NIfTI');
  
else
    addpath('/Users/fengqi/Documents/MND_REGISTRATION/EPG/EPG_code');
    set(0,'DefaultFigureWindowStyle','docked')
   
end


im=qf_load('struct_to_diff.nii.gz');
mask=single(im>200);
CC = bwconncomp(mask);

sz=max(size(CC.PixelIdxList))


for ii=1:sz
    count(ii)=max(size(CC.PixelIdxList{ii})); 
end

[val,ind]=max(count);

mask_de=mask*0;
rm=reshape(mask_de,210*240*176,1);
rm(CC.PixelIdxList{ind})=1;
maskD=reshape(rm,210,240,176);


qf_save(maskD,'masked_mask.nii.gz');


im=qf_load('ALP_step1.nii.gz');
qf_save(maskD.*im,'masked_step1_ALP.nii.gz');


im=qf_load('ALP.nii.gz');
qf_save(maskD.*im,'masked_step2_ALP.nii.gz');

im=qf_load('T2Z.nii.gz');
qf_save(maskD.*im,'masked_step2_T2Z.nii.gz');

im=qf_load('S0Z.nii.gz');
qf_save(maskD.*im,'masked_step2_S0Z.nii.gz');

im=qf_load('ERZ.nii.gz');
qf_save(maskD.*im,'masked_step2_ERZ.nii.gz');


