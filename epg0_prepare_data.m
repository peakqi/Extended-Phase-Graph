function epg0_prepare_data


f_tse='/vols/Data/postmort/CTL07/ssfp7T/x_nifti/x_relax/'
copyfile(strcat(f_tse,'*tse*.nii.gz'),'.')

f_dti='/vols/Data/postmort/dSSFP_analysis_upd_2/CTL07/500um/resampled_850um/output/for_model.DiffusionTensor_2_Flips_SSFP/corr/'
copyfile(strcat(f_dti,'*MD*.nii.gz'),'dti_MD.nii.gz')

f_str='/vols/Data/postmort/dSSFP_analysis_upd_2/CTL07/500um/resampled_850um/output/trufi/'
copyfile(strcat(f_str,'trufi_comb.nii.gz'),'trufi_comb.nii.gz')

f_T2='/vols/Data/postmort/dSSFP_analysis_upd_2/CTL07/500um/resampled_850um/output/T2/'
copyfile(strcat(f_str,'*.nii.gz'),'.')

copyfile('images_025_tseTE141001.nii.gz','vol0000.nii.gz')
copyfile('images_026_tseTE281001.nii.gz','vol0001.nii.gz')
copyfile('images_027_tseTE421001.nii.gz','vol0002.nii.gz')
copyfile('images_028_tseTE561001.nii.gz','vol0003.nii.gz')
copyfile('images_029_tseTE701001.nii.gz','vol0004.nii.gz')
copyfile('images_030_tseTE841001.nii.gz','vol0005.nii.gz')


% addpath('/vols/Data/km/fengqi/NIfTI');
% copyfile(strcat(folder_EPG{index},'/struct*'),'.')
% copyfile(strcat(folder,'dti_V*.nii.gz'),'.')
% try
% copyfile(strcat(folder,'/corr/dti_corr_L1.nii.gz'),'dti_L1.nii.gz')
% copyfile(strcat(folder,'/corr/dti_corr_L2.nii.gz'),'dti_L2.nii.gz')
% copyfile(strcat(folder,'/corr/dti_corr_L3.nii.gz'),'dti_L3.nii.gz')
% copyfile(strcat(folder,'/corr/dti_corr_MD.nii.gz'),'dti_MD.nii.gz')
% copyfile(strcat(folder,'/corr/dti_corr_FA.nii.gz'),'dti_FA.nii.gz')
% catch eee
% copyfile(strcat(folder,'/dti_L1.nii.gz'),'dti_L1.nii.gz')
% copyfile(strcat(folder,'/dti_L2.nii.gz'),'dti_L2.nii.gz')
% copyfile(strcat(folder,'/dti_L3.nii.gz'),'dti_L3.nii.gz')
% copyfile(strcat(folder,'/dti_MD.nii.gz'),'dti_MD.nii.gz')
% copyfile(strcat(folder,'/dti_FA.nii.gz'),'dti_FA.nii.gz') 
% end
% copyfile(strcat(folder_EPG{index},'/struct_to_diff.nii.gz'),'struct.nii.gz')
% copyfile(strcat(folder_EPG{index},'/struct_to_diff.nii.gz'),'.')
% copyfile(strcat(folder_EPG{index},'/masked_step2_T2Z.nii.gz'),'T2_hasSpike.nii.gz')
% copyfile(strcat(folder_EPG{index},'/masked_step2_ALP.nii.gz'),'B1.nii.gz')
% try
% copyfile(strcat(folder_EPG{index},'/FAST/dti_MD_seg.nii.gz'),'seg.nii.gz')
% catch eee
% copyfile(strcat(folder_EPG{index},'/FAST/EPG_T2_seg.nii.gz'),'seg.nii.gz')   
% end
% copyfile('../../Ants.nii.gz','Ants.nii.gz')
% im=qf_load('T2_hasSpike.nii.gz');
% fa=qf_load('dti_MD.nii.gz');
% qf_save(single(fa>0),'mask_dti.nii.gz');
% qf_save(single(im>0),'mask_epg.nii.gz');
% qf_save(single(im>0&fa>0),'mask_tot.nii.gz');
% a_FillHole
% cd ..
