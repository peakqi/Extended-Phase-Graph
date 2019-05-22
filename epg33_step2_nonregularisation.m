function epg33_step2_nonregularisation(zz)

addpath('/vols/Data/km/fengqi/NIfTI');    
% zz = str2num(getenv('SGE_TASK_ID'));
zz

if exist (strcat('fminsearch-',num2str(zz),'.mat'))==0

    warning off;

    im=qf_load('_tse.nii.gz');
    s00=qf_load('_T2_map_s0.nii.gz');
    T20=qf_load('_T2_map_t2.nii.gz');
    alpsm=qf_load('ALP_medfilt.nii.gz');

    sz=size(im);
    lambda=0
    T2=squeeze(im(:,:,:,1)*0);
    recon=im(:,:,:,:)*0;
    alp=T2;
    s0=T2;
    err=T2;
    step=1;
    ESP_in=epg_ESP
    for ii=1:step:sz(1)
    ii    
        for jj=1:step:sz(2)
            for kk=zz
                clc

                if T20(ii,jj,kk)>0

                    tse=squeeze(im(ii,jj,kk,:));

                    f=@(x)epg33_cpmg_step2_L2regularisation(x,tse',ESP_in,lambda,alpsm(ii,jj,kk))
                    try
                        % alpha_in=x(1); T2_in=x(2);s0=x(3);

                    [xx,fval]=fminsearch(f,double([squeeze(T20(ii,jj,kk)),squeeze(s00(ii,jj,kk))])); 
                    vec=epg33_vec_step2_L2regularisation(xx,ESP_in,alpsm(ii,jj,kk));
                    T2(ii,jj,kk)=xx(1);
                    s0(ii,jj,kk)=xx(2);
                    alp(ii,jj,kk)=alpsm(ii,jj,kk);

                    recon(ii,jj,kk,:)=vec;
                    err(ii,jj,kk)=double(abs(sum((vec-tse').^2)))/6;

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
    reconz=squeeze(recon(:,:,kk,:));
    errz=sqrt(squeeze(err(:,:,kk)))./squeeze(s0(:,:,kk));
    errz_Ben=sqrt(squeeze(err(:,:,kk)));
    save (strcat('fminsearch-nonreg-',num2str(zz),'.mat'),'alpz','t2z','s0z','errz','errz_Ben','reconz');

end


