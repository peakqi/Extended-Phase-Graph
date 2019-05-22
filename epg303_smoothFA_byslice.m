        function epg303_smoothFA_byslice
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
zz

alp=qf_load('ALP_step1.nii.gz');
alp(alp>360)=0;
alp(alp<0)=0;
%alp(alp<60&alp>0)=60;
alp=(360-alp).*single(alp>180)+alp.*single(alp<=180);



nn=11;thr=0
sz=size(alp);
medalp=zeros(sz(1),sz(2));
for ii=1:210
    
    for jj=1:240
%        [ii,jj]
        for kk=zz
            if alp(ii,jj,kk)>0
                    VV=[];
                       for iii=-nn:nn        
                           for jjj=-nn:nn
                              for kkk=-nn:nn
                                  try
                                     VV=cat(1,VV,alp(ii+iii,jj+jjj,kk+kkk));
                                  catch
                                  end
                                end
                            end
                       end
			VV(VV==0)=NaN;
                       try
                           medalp(ii,jj)=nanmedian(VV);
                       catch
                           medalp(ii,jj)=0;
                       end
            else
                medalp(ii,jj)=0;
            end
               
        end
    end
end
 medalp(53,92)
save(strcat('medalp-',num2str(zz),'.mat'),'medalp');
medalp(53,92)
% alp1=qf_medfilt3(alp,nn,thr)
% figure;imagesc(alp(:,:,100));colormap gray;caxis([0,180]);title('ALP')
% figure;imagesc(alp1(:,:,100));colormap gray;caxis([0,180]);title('medALP')

