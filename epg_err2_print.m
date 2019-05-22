function epg_err2_print

folder_EPG{1}=strcat('/vols/Data/km/fengqi/EPG/','MND12');
folder_EPG{2}=strcat('/vols/Data/km/fengqi/EPG/','MND13');
folder_EPG{3}=strcat('/vols/Data/km/fengqi/EPG/','MND14');
folder_EPG{4}=strcat('/vols/Data/km/fengqi/EPG/','MND15');
folder_EPG{5}=strcat('/vols/Data/km/fengqi/EPG/','MND16');
folder_EPG{6}=strcat('/vols/Data/km/fengqi/EPG/','MND17');
folder_EPG{7}=strcat('/vols/Data/km/fengqi/EPG/','MND18');
folder_EPG{8}=strcat('/vols/Data/km/fengqi/EPG/','MND19');
folder_EPG{9}=strcat('/vols/Data/km/fengqi/EPG/','MND20');
folder_EPG{10}=strcat('/vols/Data/km/fengqi/EPG/','MND21');
folder_EPG{11}=strcat('/vols/Data/km/fengqi/EPG/','MND22');
folder_EPG{12}=strcat('/vols/Data/km/fengqi/EPG/','MND23');
folder_EPG{13}=strcat('/vols/Data/km/fengqi/EPG/','MND24');
folder_EPG{14}=strcat('/vols/Data/km/fengqi/EPG/','CTL10');
folder_EPG{15}=strcat('/vols/Data/km/fengqi/EPG/','CTL11');
folder_EPG{16}=strcat('/vols/Data/km/fengqi/EPG/','CTL12');

name{1}=strcat('','MND12');
name{2}=strcat('','MND13');
name{3}=strcat('','MND14');
name{4}=strcat('','MND15');
name{5}=strcat('','MND16');
name{6}=strcat('','MND17');
name{7}=strcat('','MND18');
name{8}=strcat('','MND19');
name{9}=strcat('','MND20');
name{10}=strcat('','MND21');
name{11}=strcat('','MND22');
name{12}=strcat('','MND23');
name{13}=strcat('','MND24');
name{14}=strcat('','CTL10');
name{15}=strcat('','CTL11');
name{16}=strcat('','CTL12');

addpath('/vols/Data/km/fengqi/NIfTI');  


for ii=1:16
    cd (folder_EPG{ii})
    err=qf_load('final_step2_ERZ.nii.gz');
    err0=qf_load('final_exp_ERZ.nii.gz');
    sz=size(err);
    er=reshape(err,sz(1)*sz(2)*sz(3),1);
    a=find(er>0&er<1);
    step2_err(ii)=mean(er(a));
    
    sz=size(err0);
    er=reshape(err0,sz(1)*sz(2)*sz(3),1);
    a=find(er>0);
    exp_err(ii)=mean(er(a));
end
cd '/vols/Data/km/fengqi/EPG/'


A=cat(1,exp_err,step2_err)
A=A';
T = array2table(A,...
    'VariableNames',{'exp_model','EPG_model'},...
    'RowNames',{'MND12','MND13','MND14','MND15','MND16','MND17','MND18'...
    ,'MND19','MND20','MND21','MND22','MND23','MND24','CTL10','CTL11','CTL12'})
figure
scatter(exp_err,step2_err)
xlabel('exp_model')
ylabel('EPG_model')
saveas(gcf,'expVSEPG.jpg')
