function epg_voxelfit
tse=qf_load('_tse.nii.gz');
s00=qf_load('_T2_map_s0.nii.gz');
T20=qf_load('_T2_map_t2.nii.gz');
T2z=qf_load('T2Z.nii.gz');


alp=qf_load('ALP.nii.gz');
s0=qf_load('S0Z.nii.gz');
T2=qf_load('T2Z.nii.gz');


ii=42
jj=120
kk=116

% ii=81
% jj=120
% kk=140

fid=squeeze(tse(ii,jj,kk,:));
exps=squeeze(s00(ii,jj,kk,:));
expt=squeeze(T20(ii,jj,kk,:));
ESP_in=epg_ESP;

%
f=@(x)epg_cpmg_alp_T2_s0_inp(x,fid,ESP_in);
% [xx,fval]=fminsearch(f,double([170,squeeze(T20(ii,jj,kk)),squeeze(s00(ii,jj,kk))]));
%                 alp=xx(1);
%                 T2=xx(2);
%                 s0=xx(3);
%                 alp
%                 T2
%                 s0
%                 F0_vector_out = epg_cpmg(xx) ;
      
        step2_s0=squeeze(s0(ii,jj,kk));
        step2_t2=squeeze(T2(ii,jj,kk));
        step2_alp=squeeze(alp(ii,jj,kk));
                F0_vector_out = epg_cpmg([step2_alp,step2_t2,step2_s0]) ;
                
ESP=ESP_in*[1:1:6];
exp_fid=exps*exp(-ESP/expt);


                
  figure;hold on;
  plot(fid,'r')
  plot(F0_vector_out,'bo')
   plot(F0_vector_out,'b')
  plot(exp_fid,'g-')
   plot(exp_fid,'g*')
%   text(5,double(fid(1)),'original','Color','red')
%   text(5,double(fid(1))-100,'recon','Color','blue')
  xlabel('Echo#')
  ylabel('TSE intensity')
%  ylim([0,1500])
%title(strcat('NMS:T2=',num2str(T2),';S0=',num2str(s0),';\alpha=',num2str(alp),';err=',num2str(fval)))
%title(strcat('NMS:T2=',num2str(step2_T2),';S0=',num2str(step2_s0),';\alpha=',num2str(step2_alp)))
title(strcat('NMS:T2=',num2str(step2_t2),';S0=',num2str(step2_s0),';\alpha=',num2str(step2_alp)))
%T2(T2>200)=0;
af=reshape(alp,210*240*176,1);
at=reshape(T2,210*240*176,1);

figure
scatter(af(1:50:end),at(1:50:end),'.')
xlabel('flipAngle')
ylabel('T2')
ylim([0,200])


