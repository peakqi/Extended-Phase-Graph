function epg_construct_final

if isempty(strfind(pwd,'Documents'))
    addpath('/vols/Data/km/fengqi/NIfTI');
    
else
    addpath('/Users/fengqi/Documents/MND_REGISTRATION/EPG/EPG_code');
 
end

%if ~strfind(pwd,'Documents')
 %   addpath('/vols/Data/km/fengqi/NIfTI');
%else
%   addpath('/Users/fengqi/Documents/MND_REGISTRATION/EPG/EPG_code');
%end

%try
%    T20=qf_load('_T2_map_t2.nii.gz');
%catch exp_T2_map_t2.nii.gz
%    T20=qf_load('../_T2_map_t2.nii.gz');
%end

%epg_fix_linegap

sz=[210,240,176];
T20=zeros(210,240,176);
ind=[];
ALP=[];
T2Z=[];
S0Z=[];
T1Z=[];
ERZ=[];
zer=squeeze(T20(:,:,1))*0;
for ii=1:sz(3)
if ii==30
   aaa=1 
end
ii
    try
       	%load (strcat('fb-net100-',num2str(ii),'.mat'));
        load(strcat('fminsearch-',num2str(ii),'.mat'));
        ALP=cat(3,ALP,alpz);
        T2Z=cat(3,T2Z,t2z);
        S0Z=cat(3,S0Z,s0z);
        ERZ=cat(3,ERZ,errz);
        %T1Z=cat(3,T1Z,1z);

    catch exception
      
        ALP=cat(3,ALP,zer);
        T2Z=cat(3,T2Z,zer);
        S0Z=cat(3,S0Z,zer);
        ERZ=cat(3,ERZ,zer);
        %T1Z=cat(3,T1Z,zer);
        ind=cat(1,ind,ii);
    end


end
ind'

qf_save(ALP,'ALP.nii.gz');
qf_save(T2Z,'T2Z.nii.gz');
qf_save(S0Z,'S0Z.nii.gz');
qf_save(ERZ,'ERZ.nii.gz');


%qf_save(T1Z,'T1Z.nii.gz');

try
epg_makemask
catch e1
'no epg_makemask'
end
