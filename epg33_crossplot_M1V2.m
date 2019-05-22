function epg33_crossplot_M1V2

if isempty(strfind(pwd,'Documents'))
    addpath('/vols/Data/km/fengqi/NIfTI');
 
else
   addpath('/Users/fengqi/Documents/MND_REGISTRATION/EPG/EPG_code');
end
cd /vols/Data/km/fengqi/EPG

aa{1}='MND12';
aa{2}='MND13';
aa{3}='MND14';
aa{4}='MND15';
aa{5}='MND16';
aa{6}='MND17';
aa{7}='MND18';
aa{8}='MND19';
aa{9}='MND20';
aa{10}='MND21';
aa{11}='MND22';
aa{12}='MND23';
aa{13}='MND24';
aa{14}='CTL10';
aa{15}='CTL11';
aa{16}='CTL12';


bb{1}='10';
bb{2}='10';
bb{3}='20N';
bb{4}='10';
bb{5}='10';
bb{6}='10';
bb{7}='N';
bb{8}='10';
bb{9}='10';
bb{10}='N';
bb{11}='10';
bb{12}='N';
bb{13}='N';
bb{14}='N';
bb{15}='N';
bb{16}='N';


figure
hold on
for ii=1:16

     load (strcat(aa{ii},'.mat'))
     V2(ii)=T2V2_mean;
     M1(ii)=T2M1_mean;
     Ratio(ii)=T2M1_mean/T2V2_mean;

     if strcmp(bb{ii},'N')
         
         if ii<14
            scatter(V2(ii),Ratio(ii),'r')
         else
             scatter(V2(ii),Ratio(ii),'r*')
         end
     elseif strcmp(bb{ii},'10')
         scatter(V2(ii),Ratio(ii),'b')
     else
         scatter(V2(ii),Ratio(ii),'')
     end
     text(double(V2(ii))+.31,double(Ratio(ii)),aa{ii})
end
xlabel('V2')
ylabel('M1/V2')

saveas(gcf,'FinalTotal-v2-M1v2.png')