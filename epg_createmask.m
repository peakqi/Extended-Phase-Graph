function epg_createmask
addpath('/vols/Data/km/fengqi/NIfTI');
dti=qf_load('dti_FA.nii.gz');
t2=qf_load('masked_step2_T2Z.nii.gz');
qf_save(single((t2>0)&(dti>0)),'mask.nii.gz')