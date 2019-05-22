function az1_final_mask
addpath('/vols/Data/km/fengqi/NIfTI');
mask=qf_load('nodif_brain_mask.nii.gz');
EPG_T2=qf_load('masked_step2_T2Z.nii.gz');
mask=single(mask.*single(EPG_T2>0));

im=qf_load('struct_to_diff.nii.gz');
qf_save(im.*mask,'final_struct.nii.gz');

im=qf_load('masked_exp_ERZ.nii.gz');
qf_save(im.*mask,'final_exp_ERZ.nii.gz');

im=qf_load('masked_step2_ERZ.nii.gz');
qf_save(im.*mask,'final_step2_ERZ.nii.gz');

im=qf_load('masked_step1_ALP.nii.gz');
qf_save(im.*mask,'final_step1_ALP.nii.gz');

im=qf_load('masked_step2_ALP.nii.gz');
qf_save(im.*mask,'final_step2_ALP.nii.gz');

im=qf_load('masked_step2_ERZ.nii.gz');
qf_save(im.*mask,'final_step2_ERZ.nii.gz');

im=qf_load('masked_step2_S0Z.nii.gz');
qf_save(im.*mask,'final_step2_S0Z.nii.gz');

im=qf_load('masked_step2_T2Z.nii.gz');
qf_save(im.*mask,'final_step2_T2Z.nii.gz');

im=qf_load('_T2_map_t2.nii.gz');
qf_save(im.*mask,'final_exp_T2.nii.gz');

im=qf_load('_T2_map_s0.nii.gz');
qf_save(im.*mask,'final_exp_S0.nii.gz');

