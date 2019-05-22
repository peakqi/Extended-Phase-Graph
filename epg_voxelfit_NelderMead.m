function epg_voxelfit_NelderMead
tse=qf_load('_tse.nii.gz');
s00=qf_load('_T2_map_s0.nii.gz');
T20=qf_load('_T2_map_t2.nii.gz');
T2z=qf_load('T2Z.nii.gz');




ii=127
jj=121
kk=149

% ii=81
% jj=120
% kk=140

fid=squeeze(tse(ii,jj,kk,:))
exps=squeeze(s00(ii,jj,kk,:));
expt=squeeze(T20(ii,jj,kk,:));


%
f=@(x)epg_cpmg_alp_T2_s0_inp(x,fid);
[xx,fval]=fminsearch(f,double([170,squeeze(T20(ii,jj,kk)),squeeze(s00(ii,jj,kk))]));
                alp=xx(1);
                T2=xx(2);
                s0=xx(3);
                alp
                T2
                s0
                F0_vector_out = epg_cpmg(xx) ;
                
[xx,fval]=fminsearch(f,double([90,37,1244]));
                alp=xx(1);
                T2=xx(2);
                s0=xx(3);
                alp
                T2
                s0
                F0_vector_out = epg_cpmg(xx) ;
                
ESP=10:10:60 ;
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
  ylim([0,600])
title(strcat('NMS:T2=',num2str(T2),';S0=',num2str(s0),';\alpha=',num2str(alp),';err=',num2str(fval)))
    
  
  