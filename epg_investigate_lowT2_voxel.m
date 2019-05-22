function epg_investigate_lowT2_voxel
tse=qf_load('_tse.nii.gz');
alp=qf_load('ALP.nii.gz');
s0=qf_load('S0Z.nii.gz');
T2=qf_load('T2Z.nii.gz');
T2(T2>100)=0;
ii=72
jj=33
kk=117

may=max(squeeze(tse(ii,jj,kk,:)));

figure;hold on;
plot(squeeze(tse(ii,jj,kk,:)),'k')

text(4,double(round(may*0.8)),strcat('(',num2str([ii,jj,kk]),')',...
    ';FA_k=',num2str(round(alp(ii,jj,kk))),...
    ';S0_k=',num2str(round(s0(ii,jj,kk))),...
    ';T2_k=',num2str(round(T2(ii,jj,kk))))) ;

jj=jj+1;
plot(squeeze(tse(ii,jj,kk,:)),'r')
text(4,double(round(may*0.75)),strcat('(',num2str([ii,jj,kk]),')',...
    ';FA_r=',num2str(round(alp(ii,jj,kk))),...
    ';S0_r=',num2str(round(s0(ii,jj,kk))),...
    ';T2_r=',num2str(round(T2(ii,jj,kk))))) ;


jj=jj+1;


plot(squeeze(tse(ii,jj,kk,:)),'g')
text(4,double(round(may*0.7)),strcat('(',num2str([ii,jj,kk]),')',...
    ';FA_g=',num2str(round(alp(ii,jj,kk))),...
    ';S0_g=',num2str(round(s0(ii,jj,kk))),...
    ';T2_g=',num2str(round(T2(ii,jj,kk))))) ;

jj=jj+1;

plot(squeeze(tse(ii,jj,kk,:)),'b')
text(4,double(round(may*0.65)),strcat('(',num2str([ii,jj,kk]),')',...
    ';FA_b=',num2str(round(alp(ii,jj,kk))),...
    ';S0_b=',num2str(round(s0(ii,jj,kk))),...
    ';T2_b=',num2str(round(T2(ii,jj,kk))))) ;

  