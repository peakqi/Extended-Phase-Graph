function epg30_smoothB1
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

alp=qf_load('ALP.nii.gz');
figure;imagesc(squeeze(alp(:,:,90)))
caxis([0,180])
colormap gray
saveas(gcf,'B1_EPG.jpeg')

    alps=smooth3(alp,'gaussian');
     alps=smooth3(alps,'gaussian');
      alps=smooth3(alps,'gaussian');
figure;imagesc(squeeze(alps(:,:,90)))
caxis([0,180])
colormap gray
saveas(gcf,'B1_EPG_smoothed.jpeg')
qf_save(alps,'ALP_smoothed.nii.gz')

B1=qf_load('B1_ben_2_diff_masked.nii.gz'); 
figure;imagesc(squeeze(B1(:,:,90)*180))
caxis([0,180])
colormap gray
saveas(gcf,'B1_Ben.jpeg')


