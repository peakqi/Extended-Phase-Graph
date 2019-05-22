function epg32_cal_T2S0_fminsearch_withAFIB1


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




im=qf_load('_tse.nii.gz');
s00=qf_load('_T2_map_s0.nii.gz');
T20=qf_load('_T2_map_t2.nii.gz');
alpsm=qf_load('B1_AFI.nii.gz')*180;
sz=size(im);

T2=squeeze(im(:,:,:,1)*0);
alp=T2;
s0=T2;
step=1
for ii=1:step:sz(1)    
    for jj=1:step:sz(2)
        for kk=zz
            clc
    
            if im(ii,jj,kk,1)>0
                ii
                jj
                kk

                tse=squeeze(im(ii,jj,kk,:));
                f=@(x)epg_cpmg_T2_s0_inp(x,tse,alpsm(ii,jj,kk));
                try
                    % alpha_in=x(1);
                    % T2_in=x(2);
                    % s0=x(3);
                    % T1_in=450;
                    % x(4)=0;
                    % ESP_in=10;
                    % N_in=6;

                [xx,fval]=fminsearch(f,double([squeeze(T20(ii,jj,kk)),squeeze(s00(ii,jj,kk))]));               
                T2(ii,jj,kk)=xx(1);
                s0(ii,jj,kk)=xx(2);
                alp(ii,jj,kk)=alpsm(ii,jj,kk);
                catch exception
                end
                
            else
            end
            
        end

    end
  
end

t2z=squeeze(T2(:,:,kk));
s0z=squeeze(s0(:,:,kk));
alpz=squeeze(alp(:,:,kk));
save (strcat('fminsearch-',num2str(zz),'.mat'),'alpz','t2z','s0z');


end


