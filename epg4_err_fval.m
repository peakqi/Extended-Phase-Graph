function epg4_err_fval


addpath('/vols/Data/km/fengqi/NIfTI');
load ind.mat
zz=ind(1);
ind(1)=[];
if isempty(ind)
    delete('ind.mat')
else
    ind(1)
    save ('ind.mat','ind')
end
    
try
im=qf_load('_tse.nii.gz');
catch
   aaa=pwd;
   cd ..
   im=qf_load('_tse.nii.gz');
   cd (aaa)
end

try 
S0=qf_load('masked_step2_S0Z.nii.gz');
catch
   aaa=pwd;
   cd ..
  S0=qf_load('masked_step2_S0Z.nii.gz');
   cd (aaa)
end

try 
T20=qf_load('masked_step2_T2Z.nii.gz');
catch
   aaa=pwd;
   cd ..
   T20=qf_load('masked_step2_T2Z.nii.gz');
   cd (aaa)
end

try 
S0_=qf_load('_T2_map_s0.nii.gz');
catch
   aaa=pwd;
   cd ..
  S0_=qf_load('_T2_map_s0.nii.gz');
   cd (aaa)
end

try 
T20_=qf_load('_T2_map_t2.nii.gz');
catch
   aaa=pwd;
   cd ..
   T20_=qf_load('_T2_map_t2.nii.gz');
   cd (aaa)
end

ESP_in=epg_ESP;
te=[ESP_in,2*ESP_in,3*ESP_in,4*ESP_in,5*ESP_in,6*ESP_in];


try 
Alp=qf_load('masked_step2_ALP.nii.gz');
catch
   aaa=pwd;
   cd ..
   Alp=qf_load('masked_step2_ALP.nii.gz');
   cd (aaa)
end

sz=size(im);

err=squeeze(im(:,:,:,1)*0);
err0=squeeze(im(:,:,:,1)*0);

f=@(x)epg_cpmg(x);
step=1

for ii=1:step:sz(1)  
    ii
    for jj=1:step:sz(2)
        
        for kk=zz
            
    
            if T20(ii,jj,kk)>0      
                tse=squeeze(im(ii,jj,kk,:));
                try
                   
                   fv= f([Alp(ii,jj,kk),T20(ii,jj,kk),S0(ii,jj,kk)]);
                   err(ii,jj,kk)=sqrt(abs(sum((fv-tse').^2))/6)/S0(ii,jj,kk);
                   
                   sg=S0_(ii,jj,kk)*exp(-te/T20_(ii,jj,kk));
                   err0(ii,jj,kk)=sqrt(abs(sum((sg-tse').^2))/6)/S0_(ii,jj,kk);

                catch exception
                    err(ii,jj,kk)=0;
                    err0(ii,jj,kk)=0;
                end      
            else
            end
            
            
         
            
            
        end

    end
  
end


exp_err=squeeze(err0(:,:,kk));
step2_err=squeeze(err(:,:,kk));
step2_err(step2_err>1)=0;
exp_err(exp_err>1)=0;

save (strcat('err-',num2str(zz),'.mat'),'exp_err','step2_err');


