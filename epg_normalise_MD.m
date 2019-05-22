function epg_normalise_MD
epg_addpath;
im=qf_load('MD.nii.gz');
im(im>6*1e-6)=0;
im(im<0)=0;
qf_save(im,'MD.nii.gz');