function epg33_construct_final

if isempty(strfind(pwd,'Documents'))
    addpath('/vols/Data/km/fengqi/NIfTI');
    
else
    addpath('/Users/fengqi/Documents/MND_REGISTRATION/EPG/EPG_code');
 
end

sz=[210,240,176];
T20=zeros(210,240,176);
Recon=zeros(210,240,176,6);
ind=[];
ALP=[];
T2Z=[];
S0Z=[];
T1Z=[];
ERZ=[];
ERZ_Ben=[];

zer=squeeze(T20(:,:,1))*0;
for ii=1:sz(3)

ii
    try
       	%load (strcat('fb-net100-',num2str(ii),'.mat'));
        load(strcat('fminsearch-',num2str(ii),'.mat'));
        ALP=cat(3,ALP,alpz);
        T2Z=cat(3,T2Z,t2z);
        S0Z=cat(3,S0Z,s0z);
        ERZ=cat(3,ERZ,errz);
       % ERZ_Ben=cat(3,ERZ_Ben,errz_Ben);
        %T1Z=cat(3,T1Z,1z);
        Recon(:,:,ii,1)=reconz(:,:,1);
        Recon(:,:,ii,2)=reconz(:,:,2);
        Recon(:,:,ii,3)=reconz(:,:,3);
        Recon(:,:,ii,4)=reconz(:,:,4);
        Recon(:,:,ii,5)=reconz(:,:,5);
        Recon(:,:,ii,6)=reconz(:,:,6);

    catch exception
      
        ALP=cat(3,ALP,zer);
        T2Z=cat(3,T2Z,zer);
        S0Z=cat(3,S0Z,zer);
        ERZ=cat(3,ERZ,zer);
        ERZ_Ben=cat(3,ERZ_Ben,zer);
        %T1Z=cat(3,T1Z,zer);
        ind=cat(1,ind,ii);
    end


end
ind'


im=qf_load('_tse.nii.gz');
intensity=mean(nonzeros(im));
qf_save(ALP,'ALP.nii.gz');
qf_save(T2Z,'T2Z.nii.gz');
qf_save(S0Z,'S0Z.nii.gz');
qf_save(ERZ,'ERZ.nii.gz');
qf_save(Recon,'Recon.nii.gz');
norm_factor=sum(im,4);

qf_save(ERZ_Ben./norm_factor,'ERZ_Ben.nii.gz');


epg33_makemask
