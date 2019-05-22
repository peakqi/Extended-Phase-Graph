function epg4_err_expVSepg

addpath('/vols/Data/km/fengqi/NIfTI');
  



ERRexp=qf_load('T2_map_t2_res.nii.gz');


TSEepg=qf_load('masked_step2_Recon.nii.gz');
TSE=qf_load('_tse.nii.gz');
ERRtse=TSEepg-TSE;

for ii=1:6
   
    exp=ERRexp(:,:,:,ii);
    tse=ERRtse(:,:,:,ii);
    M(1,ii)=mean(nonzeros(exp));
    M(2,ii)=mean(nonzeros(tse));
    M(3,ii)=std(nonzeros(exp));
    M(4,ii)=std(nonzeros(tse));
    
end

aa=pwd;
nm=strcat('../',aa(end-4:end),'.mat');
save(nm,'M')
