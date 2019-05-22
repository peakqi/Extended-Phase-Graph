function epg_scatterplot_indivsT2
cd('/Users/fengqi/Documents/MND_REGISTRATION/EPG')
%load statics.mat

figure;hold on;
aa=1:7
scatter(aa,Stati.M1V1,'r')
set(gca,'xtick',[1:17],'xticklabel',Stati.subject)
xtickangle(90)
title('M1/V1')
ylim([0.7 1.3])



figure;hold on;
scatter(aa,Stati.M1V2,'b')
names = {'CRHS'; 'ELLY'; 'LGWD'; 'ECFS'; 'THMS'};
set(gca,'xtick',[1:17],'xticklabel',Stati.subject)
xtickangle(90)
title('M1/V2')
ylim([0.7 1.3])
