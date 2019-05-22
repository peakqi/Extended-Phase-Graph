function epg302_smoothB1_AFI
if isempty(strfind(pwd,'Documents'))
    addpath('/vols/Data/km/fengqi/NIfTI');
    load ind.mat
    zz=ind(1);
    ind(1)=[];
    if isempty(ind)
        delete('ind.mat')
    else
        ind(1)
        save ('ind.mat','ind')
    end  
else
    addpath('/Users/fengqi/Documents/MND_REGISTRATION/EPG/EPG_code');
    set(0,'DefaultFigureWindowStyle','docked')
    zz=100;
end





alp=qf_load('ALP_AFI.nii.gz');

alp=alp*180;


malp = medfilt3(alp,[7,7,7]);
smalp=smooth3(malp).*(1-double(alp==0));
figure;imagesc(alp(:,:,100));colormap gray;caxis([0,180])
figure;imagesc(malp(:,:,100));colormap gray;caxis([0,180])
figure;imagesc(smalp(:,:,100));colormap gray;caxis([0,180])


qf_save(smalp,'AFI_smoothed.nii.gz')

% figure;imagesc(squeeze(alp(:,:,90)))
% caxis([0,180])
% colormap gray
% saveas(gcf,'B1_EPG.jpeg')
% figure;imagesc(squeeze(alps(:,:,90)))
% caxis([0,180])
% colormap gray
% saveas(gcf,'B1_EPG_smoothed.jpeg')
% qf_save(alps,'ALP_smoothed.nii.gz')
% 
% B1=qf_load('B1_ben_2_diff_masked.nii.gz'); 
% figure;imagesc(squeeze(B1(:,:,90)*180))
% caxis([0,180])
% colormap gray
% saveas(gcf,'B1_Ben.jpeg')
% 

