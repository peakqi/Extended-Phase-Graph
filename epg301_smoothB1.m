function epg301_smoothB1
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
figure;imagesc(alp(:,:,100));colormap gray;caxis([0,180]);title('ALP')
% 
%alpnan=alp;
% alpnan(alp==0)=NaN;
% alp=alpnan;
% alp_1d=reshape(alpnan,210*240*176,1);
% Yb = prctile(alp_1d,80)
% Ys = prctile(alp_1d,5)
% % alpnan(alpnan>Yb|alpnan<Ys)=NaN;
% figure;imagesc(alpnan(:,:,100));colormap gray;caxis([0,180]);title('ALPnan')
for ii=7
n=ii
malp = medfilt3(alp,[n,n,n]);
malp=malp.*(1-double(alp==0));
figure;imagesc(malp(:,:,100));colormap gray;caxis([0,180]);title(strcat(num2str(n),'-ALP'));colorbar;
saveas(gca,strcat(num2str(n),'-ALP.jpg'))
figure;imagesc(malp(:,:,100)-alp(:,:,100));colormap gray;caxis([0,180]);title(strcat(num2str(n),'-ALP'))
qf_colormap_redblue([-180,180]);colorbar;
saveas(gca,strcat(num2str(n),'-diff-ALP.jpg'))
%qf_save(malp.*(1-double(alp==0)),'ALP_smoothed.nii.gz')
end

% malp1=malp.*(1-double(alp==0));
% smalp=smooth3(malp).*(1-double(alp==0));
% 
% 
% figure;imagesc(smalp(:,:,100));colormap gray;caxis([0,180]);title('s-m7-ALP')



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

