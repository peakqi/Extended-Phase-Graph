function epg_construct_4CalcErr

addpath('/vols/Data/km/fengqi/NIfTI');


T20=zeros(210,240,176);

sz=size(T20);
ind=[];
EXP=[];
STP2=[];
zer=zeros(210,240);
for ii=1:sz(3)
ii
    try
       	%load (strcat('fb-net100-',num2str(ii),'.mat'));
        load(strcat('err-',num2str(ii),'.mat'));        
        EXP=cat(3,EXP,exp_err);
        STP2=cat(3,STP2,step2_err);

    catch exception
      
        EXP=cat(3,EXP,zer);
        STP2=cat(3,STP2,zer);  
        ind=cat(1,ind,ii);
    end


end
ind'
qf_save(EXP,'exp_ERR.nii.gz');
qf_save(STP2,'step2_ERR.nii.gz');

