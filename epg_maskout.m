function epg_maskout
if isempty(strfind(pwd,'Documents'))
    addpath('/vols/Data/km/fengqi/NIfTI');
else
   addpath('/Users/fengqi/Documents/MND_REGISTRATION/EPG/EPG_code');
end



mk=qf_load('struct_to_diff.nii.gz');
mask=single(mk>200);
qf_save(mask,'mask.nii.gz');
im=qf_load('ALP.nii.gz');
qf_save(im.*mask,'masked_ALP_step1.nii.gz');
