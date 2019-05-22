function epg33_Calc_Recon_forNoRegularisation

if isempty(strfind(pwd,'Documents'))
    addpath('/vols/Data/km/fengqi/NIfTI');   
else
    addpath('/Users/fengqi/Documents/MND_REGISTRATION/EPG/EPG_code');
end



im=qf_load('struct_to_diff.nii.gz');
mask=single(im>200);
CC = bwconncomp(mask);

sz=max(size(CC.PixelIdxList))


for ii=1:sz
    count(ii)=max(size(CC.PixelIdxList{ii})); 
end

[val,ind]=max(count);

mask_de=mask*0;
rm=reshape(mask_de,210*240*176,1);
rm(CC.PixelIdxList{ind})=1;
maskD=reshape(rm,210,240,176);
im=qf_load('S0Z.nii.gz');
maskD(im>=8192)=0;
try
     im=qf_load('Final_noRegularisation/masked_step1_ALP.nii.gz');
catch
     im=qf_load('Final_noRegularisation/final_step1_ALP.nii.gz');
end
maskD(im<=0)=0;
im=qf_load('T2Z.nii.gz');
maskD(im<=0)=0;
im=qf_load('ALP_step1.nii.gz');
maskD(im<=0)=0;
qf_save(maskD,'masked_mask.nii.gz');
mask=maskD;

try
    
    ALP_noRegu=qf_load('Final_noRegularisation/masked_step2_ALP.nii.gz');
    T2Z_noRegu=qf_load('Final_noRegularisation/masked_step2_T2Z.nii.gz');
    S0Z_noRegu=qf_load('Final_noRegularisation/masked_step2_S0Z.nii.gz');
    pre='masked_step2_Recon.nii.gz';
catch ee
    ALP_noRegu=qf_load('Final_noRegularisation/final_step2_ALP.nii.gz');
    T2Z_noRegu=qf_load('Final_noRegularisation/final_step2_T2Z.nii.gz');
    S0Z_noRegu=qf_load('Final_noRegularisation/final_step2_S0Z.nii.gz');
    pre='final_step2_Recon.nii.gz';
    
end
ESP_in=epg_ESP;
sz=size(mask);
vec_zero=zeros(6);
recon=zeros([sz(1),sz(2),sz(3),6]);
for ii=1:sz(1)
    ii
    for jj=1:sz(2)
        for kk=1:sz(3)
            if mask(ii,jj,kk)==0
            else
                
                vec=epg33_vec_step2_L2regularisation([T2Z_noRegu(ii,jj,kk),S0Z_noRegu(ii,jj,kk)],ESP_in, ALP_noRegu(ii,jj,kk));
                recon(ii,jj,kk,:)=vec;
            end
            
        end
    end
end

qf_save(recon,strcat('Final_noRegularisation/',pre))

epg33_makeERRmap
epg33_finalplot





