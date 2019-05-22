function epg_generate_concentration_histogram

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

%1=10%
%2=20%NBF
%3=10%NBF
%4=?
flag{1}=1;
flag{2}=1;
flag{3}=2;
flag{4}=1;
flag{5}=1;
flag{6}=1;
flag{7}=1;
flag{8}=1;
flag{9}=3;
flag{10}=3;
flag{11}=4;
flag{12}=4;
flag{13}=1;
flag{14}=3;
flag{15}=1;
flag{16}=3;
flag{17}=3;
flag{18}=3;
flag{19}=3;




cd /Users/fengqi/Documents/MND_REGISTRATION/EPG/
type=qf_load('masked_ALS_mixeltype.nii.gz');
G=qf_load('cortex_mask_MNDtemplate.nii.gz');
wm=single(type==3);
gm=single(type==5&G>0);
nn=10000;
figure
hold on;
for ii=1:numel(folder_EPG_pc)
    ii
    try
    cd (folder_EPG_pc{ii});
    im=qf_load('deformed_T2map.nii.gz');
    im(im>200)=0;im(im<0)=0;
    ig=im.*gm;
    ig_flat=reshape(ig,210*240*176,1);
    [ind,val]=find(ig_flat);
    val=ig_flat(ind);
    sel_ind=round(rand(1,nn)*numel(val));
    sel_val=val(sel_ind);
    mean_gm(ii)=mean(sel_val);
    std_gm(ii)=std(sel_val);
    
    iw=im.*wm;
    iw_flat=reshape(iw,210*240*176,1);
    [ind,val]=find(iw_flat);
    val=iw_flat(ind);
    sel_ind=round(rand(1,nn)*numel(val));
    sel_val=val(sel_ind);
    mean_wm(ii)=mean(sel_val);
    std_wm(ii)=std(sel_val);
    
    catch ee
       disp( 'caught')
       ii
    end
        
    
end

%1=10%
%2=20%NBF
%3=10%NBF
%4=?
figure
hold on


for ii=1:numel(folder_EPG_pc)
    ii
    try
        if flag{ii}==1
          ploterr(mean_wm(ii),mean_gm(ii),std_wm(ii),std_gm(ii),'r')
        elseif flag{ii}==2
          ploterr(mean_wm(ii),mean_gm(ii),std_wm(ii),std_gm(ii),'g')
        elseif flag{ii}==3
          ploterr(mean_wm(ii),mean_gm(ii),std_wm(ii),std_gm(ii),'b')
        elseif flag{ii}==4
          ploterr(mean_wm(ii),mean_gm(ii),std_wm(ii),std_gm(ii),'k')
        end
          
    catch eee
    end
end


figure
hold on
for ii=1:numel(folder_EPG_pc)
    ii
    try
        if flag{ii}==1
          ploterr(1,mean_wm(ii),std_wm(ii),0,'r')
          ploterr(50,mean_gm(ii),std_gm(ii),0,'r')
        elseif flag{ii}==2
          ploterr(1,mean_wm(ii),std_wm(ii),0,'g')
          ploterr(50,mean_gm(ii),std_gm(ii),0,'g')
        elseif flag{ii}==3
          ploterr(1,mean_wm(ii),std_wm(ii),0,'b')
          ploterr(50,mean_gm(ii),std_gm(ii),0,'b')
        elseif flag{ii}==4
          ploterr(1,mean_wm(ii),std_wm(ii),0,'k')
          ploterr(50,mean_gm(ii),std_gm(ii),0,'k')
        end
          
    catch eee
    end
end

xlabel('white matter T2(ms)')
ylabel('grey matter T2(ms)')
xlim([10,60])
ylim([10,50])




