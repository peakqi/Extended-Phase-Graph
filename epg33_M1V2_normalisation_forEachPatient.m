function epg33_M1V2_normalisation_forEachPatient


if isempty(strfind(pwd,'Documents'))
    addpath('/vols/Data/km/fengqi/NIfTI');    
else
    addpath('/Users/fengqi/Documents/MND_REGISTRATION/EPG/EPG_code');
end
seg=qf_load('FAST/dti_MD_seg.nii.gz');
gm=single(seg>3);
T2=qf_load('masked_step2_T2Z.nii.gz');
M1=qf_load('deformed2indi_M1.nii.gz');
M1=single(M1>0.4).*gm.*single(T2>0);
V2=qf_load('deformed2indi_V2.nii.gz');
V2=single(V2>0.4).*gm.*single(T2>0);
mask=qf_load('masked_mask.nii.gz');
qf_save(M1,'M1_mask.nii.gz');
qf_save(V2,'V2_mask.nii.gz');

T2V2_mean=sum(sum(sum(T2.*V2.*mask)))/sum(sum(sum(V2.*mask)))
T2M1_mean=sum(sum(sum(T2.*M1.*mask)))/sum(sum(sum(M1.*mask)))

aa=pwd;
filename=strcat('../',aa(end-4:end),'.mat')
save(filename,'T2V2_mean','T2M1_mean')