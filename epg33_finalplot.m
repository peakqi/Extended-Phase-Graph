function epg33_finalplot
if isempty(strfind(pwd,'Documents'))
    addpath('/vols/Data/km/fengqi/NIfTI');
  
else
    addpath('/Users/fengqi/Documents/MND_REGISTRATION/EPG/EPG_code');
    set(0,'DefaultFigureWindowStyle','docked')
   
end

try
    maskD=qf_load('masked_mask.nii.gz');
catch ee
    maskD=qf_load('masked.nii.gz');
end



figure
im=qf_load('masked_step1_ALP.nii.gz');
imm=maskD.*im;
subplot(3,4,1)
imshow(flipud(squeeze(imm(:,121,:))'))
title('ALP-step1-Rgl')
caxis([0,180])
im=qf_load('Final_noRegularisation/masked_step1_ALP.nii.gz');
imm=maskD.*im;
subplot(3,4,2)
imshow(flipud(squeeze(imm(:,121,:))'))
title('ALP-step1')
caxis([0,180])


im=qf_load('masked_step2_ALP.nii.gz');
imm=maskD.*im;
subplot(3,4,3)
imshow(flipud(squeeze(imm(:,121,:))'))
title('ALP-step2-Rgl')
caxis([0,180])


im=qf_load('Final_noRegularisation/masked_step2_ALP.nii.gz');
imm=maskD.*im;
subplot(3,4,4)
imshow(flipud(squeeze(imm(:,121,:))'))
title('ALP-step2')
caxis([0,180])

im=qf_load('masked_step2_T2Z.nii.gz');
imm=maskD.*im;
subplot(3,4,5)
imshow(flipud(squeeze(imm(:,121,:))'))
caxis([0,70])
title('T2-step2-Rgl')
im=qf_load('Final_noRegularisation/masked_step2_T2Z.nii.gz');
imm=maskD.*im;
subplot(3,4,6)
imshow(flipud(squeeze(imm(:,121,:))'))
caxis([0,70])
title('T2-step2')


im=qf_load('masked_step2_S0Z.nii.gz');
imm=maskD.*im;
subplot(3,4,7)
imshow(flipud(squeeze(imm(:,121,:))'))
caxis([0,8192])
title('S0-step2-Rgl')
im=qf_load('Final_noRegularisation/masked_step2_S0Z.nii.gz');
imm=maskD.*im;
subplot(3,4,8)
imshow(flipud(squeeze(imm(:,121,:))'))
caxis([0,8192])
title('S0-step2')

im=qf_load('masked_step2_ERZ_Ben.nii.gz');
imm=maskD.*im;
subplot(3,4,9)
imshow(flipud(squeeze(imm(:,121,:))'))
caxis([0,.1])
title('err/avgtse-step2-Rgl')
im=qf_load('masked_step2_ERZ.nii.gz');
imm=maskD.*im;
subplot(3,4,11)
imshow(flipud(squeeze(imm(:,121,:))'))
caxis([0,.1])
title('err/s0-step2-Rgl')

im=qf_load('Final_noRegularisation/masked_step2_ERZ.nii.gz');
imm=maskD.*im;
subplot(3,4,12)
imshow(flipud(squeeze(imm(:,121,:))'))
caxis([0,.1])
title('err/s0-step2-NoRegu')

im=qf_load('Final_noRegularisation/masked_step2_ERZ_Ben.nii.gz');
imm=maskD.*im;
subplot(3,4,10)
imshow(flipud(squeeze(imm(:,121,:))'))
caxis([0,.1])
title('err/avgtse-step2-NoRegu')


im1=qf_load('masked_step2_T2Z.nii.gz');
im=qf_load('Final_noRegularisation/masked_step2_T2Z.nii.gz');
imm=maskD.*(im1-im);
subplot(3,4,1)
imshow(flipud(squeeze(imm(:,121,:))'))
caxis([-40,40])
title('T2-T2noreg')

aa=pwd;
filename=strcat('../',aa(end-4:end),'.png')
saveas(gcf,filename)


