function epg_normalise

folder_EPG_pc{1}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND12');
folder_EPG_pc{2}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND13');
folder_EPG_pc{3}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND14');
folder_EPG_pc{4}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND15_150403');
folder_EPG_pc{5}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND15_150919');
folder_EPG_pc{6}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND16_150411');
folder_EPG_pc{7}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND16_150803');
folder_EPG_pc{8}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND17');
folder_EPG_pc{9}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND18_150509');
folder_EPG_pc{10}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND18_150909');
folder_EPG_pc{11}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND19_150516');
folder_EPG_pc{12}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND19_150724');
folder_EPG_pc{13}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND20');
folder_EPG_pc{14}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND21');
folder_EPG_pc{15}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND22');
folder_EPG_pc{16}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND23');
folder_EPG_pc{17}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','CTL10');
folder_EPG_pc{18}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','CTL11');
folder_EPG_pc{19}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','CTL12');
flag{1}=1;
flag{2}=1;
flag{3}=1;
flag{4}=1;
flag{5}=1;
flag{6}=1;
flag{7}=1;
flag{8}=1;
flag{9}=1;
flag{10}=1;
flag{11}=1;
flag{12}=1;
flag{13}=1;
flag{14}=1;
flag{15}=1;
flag{16}=1;
flag{17}=2;
flag{18}=2;
flag{19}=2;


cd /Users/fengqi/Documents/MND_REGISTRATION/EPG/
type=qf_load('masked_ALS_mixeltype.nii.gz');
G=qf_load('/Users/fengqi/Documents/MND_REGISTRATION/EPG/cortex_mask_MNDtemplate.nii.gz');
gm=single(type==5&G>0);
mask=qf_load('/Users/fengqi/Documents/MND_REGISTRATION/EPG/MNI/cort_50.nii.gz');
mx=max(max(max(mask)));

nn=1000;




for ii=1:numel(folder_EPG_pc)
    ii
    
    try
        cd (folder_EPG_pc{ii});
        im=qf_load('deformed_T2map.nii.gz');
        im(im>200)=0;im(im<0)=0;

        for jj=1:48
            %[ii,jj]
            try
            ROI=single(mask==jj).*gm.*im;
            ROI_flat=reshape(ROI,210*240*176,1);
            [ind,val]=find(ROI_flat);
            val=ROI_flat(ind);

            sel_ind=round(rand(1,nn)*numel(val));
            sel_val=val(sel_ind);
            mean_ROI(jj)=mean(sel_val);
            std_ROI(jj)=std(sel_val);
            catch eeee
            end
        end
        mean_ROI=mean_ROI/mean_ROI(48);
        cor=im*0;
        for jj=1:48
           cor=cor+single(mask==jj).*gm*mean_ROI(jj);

        end 
        qf_save(cor,'normalised_cor.nii.gz')
    
    catch ee
       disp( 'caught')
       ii
    end
        
    
end

figure
hold on;

for ii=1:numel(folder_EPG_pc)
    ii
    
    try
        cd (folder_EPG_pc{ii});
        im=qf_load('normalised_cor.nii.gz');
        
        scatter(ii,im(55,142,127))
    catch ee
       disp( 'caught')
       ii
    end
        
    
end

