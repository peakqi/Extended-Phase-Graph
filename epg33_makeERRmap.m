function epg33_makeERRmap

if isempty(strfind(pwd,'Documents'))
    addpath('/vols/Data/km/fengqi/NIfTI');    
else
    addpath('/Users/fengqi/Documents/MND_REGISTRATION/EPG/EPG_code');
end


tse=qf_load('_tse.nii.gz');tsemean=mean(tse,4);
s0=qf_load('Final_noRegularisation/masked_step2_S0Z.nii.gz');
pre_recon=qf_load('Final_noRegularisation/masked_step2_Recon.nii.gz');
ben=sqrt(sum((pre_recon-tse).^2,4)/6)./tsemean;
qf_save(ben,'Final_noRegularisation/masked_step2_ERZ_Ben.nii.gz')
feng=sqrt(sum((pre_recon-tse).^2,4)/6)./s0;
qf_save(feng,'Final_noRegularisation/masked_step2_ERZ.nii.gz')



s0=qf_load('masked_step2_S0Z.nii.gz');
pre_recon=qf_load('masked_step2_Recon.nii.gz');
ben=sqrt(sum((pre_recon-tse).^2,4)/6)./tsemean;
qf_save(ben,'masked_step2_ERZ_Ben.nii.gz')
feng=sqrt(sum((pre_recon-tse).^2,4)/6)./s0;
qf_save(feng,'masked_step2_ERZ.nii.gz')


