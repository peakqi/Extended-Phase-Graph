function epg300_inpaint

if isempty(strfind(pwd,'Documents'))
    addpath(genpath('/vols/Data/km/fengqi/NIfTI'));
    load ind.mat
    yy=ind(1);
    ind(1)=[];
    if isempty(ind)
        delete('ind.mat')
    else
        ind(1)
        save ('ind.mat','ind')
    end  
else
    addpath('/Users/fengqi/Documents/MND_REGISTRATION/EPG/EPG_code');
    addpath(genpath('/Users/fengqi/Documents/MATLAB/inpaint'))
    set(0,'DefaultFigureWindowStyle','docked')
    yy=125;
end


thr=60;
%im=qf_load('_tse.nii.gz');
alp=qf_load('ALP.nii.gz');
alp(alp<0)=0;
alp(alp>360)=0;
alp1=(360-alp).*single(alp>180)+alp.*single(alp<=180);

mkdir(strcat('inpaint',num2str(yy)))
cd (strcat('inpaint',num2str(yy)))

im=squeeze(alp1(:,yy,:));
%figure;imagesc(im);caxis([0,180]);colormap gray;
imwrite(cat(3,im,im,im),'input_mumford_shah.png');

ms=im*0;
ms(im<thr)=1;ms=ms.*single(im>0);
%figure;imagesc(ms);colormap gray
imwrite(cat(3,ms,ms,ms),'mask_mumford_shah.png');

% PARAMETERS
maxiter       = 20;
tol           = 1e-14;
param.lambda  = 10^9;   % weight on data fidelity (should usually be large).
param.alpha   = 1;  % regularisation parameters \alpha.
param.gamma   = 0.5;    % regularisation parameters \gamma.
param.epsilon = 0.05;    % accuracy of Ambrosio-Tortorelli approximation of the edge set.
if sum(sum(ms))>0
    inpainting_mumford_shah('input_mumford_shah.png','mask_mumford_shah.png',maxiter,tol,param)
else 
    copyfile('input_mumford_shah.png','output_mumford_shah.png')
end
movefile('output_mumford_shah.png',strcat('../inpaint-',num2str(yy),'.png')) 

