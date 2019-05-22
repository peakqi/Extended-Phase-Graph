function FAST_make_GM_WM

if isempty(strfind(pwd,'Documents'))
    addpath('/vols/Data/km/fengqi/NIfTI');
else
   addpath('/Users/fengqi/Documents/MND_REGISTRATION/EPG/EPG_code');
end
seg=qf_load('dti_MD_seg.nii.gz');

qf_save(single(seg>2),'mask_gm.nii.gz')
qf_save(single(seg==2|seg==1),'mask_wm.nii.gz')
qf_save(seg,'seg_seg.nii.gz')
