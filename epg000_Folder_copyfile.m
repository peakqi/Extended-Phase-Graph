function epg000_Folder_copyfile
if isempty(strfind(pwd,'Documents'))
    addpath('/vols/Data/km/fengqi/NIfTI');
 
else
   addpath('/Users/fengqi/Documents/MND_REGISTRATION/EPG/EPG_code');
end


folder_SF_B1{1}='/vols/Data/postmort/SF/MND12_ssfp7T_q300/x_B1map/';
folder_SF_B1{2}='/vols/Data/postmort/SF/MND13_ssfp7T_q300/x_B1map/';
folder_SF_B1{3}='/vols/Data/postmort/SF/MND14_ssfp7T_q300/x_B1map/';
folder_SF_B1{4}='/vols/Data/postmort/SF/MND15_ssfp7T_q300/x_150403/x_B1map/';
folder_SF_B1{5}='/vols/Data/postmort/SF/MND15_ssfp7T_q300/x_150919/x_B1map/';
folder_SF_B1{6}='/vols/Data/postmort/SF/MND16_ssfp7T_q300/x_150411/x_B1map/';
folder_SF_B1{7}='/vols/Data/postmort/SF/MND16_ssfp7T_q300/x_150803/x_B1map/';
folder_SF_B1{8}='/vols/Data/postmort/SF/MND17_ssfp7T_q300/x_B1map/';
folder_SF_B1{9}='/vols/Data/postmort/SF/MND18_ssfp7T_q300/x_150509/x_B1map/';
folder_SF_B1{10}='/vols/Data/postmort/SF/MND18_ssfp7T_q300/x_150909/x_B1map/';
folder_SF_B1{11}='/vols/Data/postmort/SF/MND19_ssfp7T_q300/x_150516/x_B1map/';
folder_SF_B1{12}='/vols/Data/postmort/SF/MND19_ssfp7T_q300/x_150724/x_B1map/';
folder_SF_B1{13}='/vols/Data/postmort/SF/MND20_ssfp7T_q300/x_B1map/';
folder_SF_B1{14}='/vols/Data/postmort/SF/MND21_ssfp7T_q300/x_B1map/';
folder_SF_B1{15}='/vols/Data/postmort/SF/MND22_ssfp7T_q300/x_B1map/';
folder_SF_B1{16}='/vols/Data/postmort/SF/MND23_ssfp7T_q300/x_B1map/';



folder_SF{1}='/vols/Data/postmort/SF/MND12_ssfp7T_q300/x_relax/';
folder_SF{2}='/vols/Data/postmort/SF/MND13_ssfp7T_q300/x_relax/';
folder_SF{3}='/vols/Data/postmort/SF/MND14_ssfp7T_q300/x_relax/';
folder_SF{4}='/vols/Data/postmort/SF/MND15_ssfp7T_q300/x_150403/x_relax/';
folder_SF{5}='/vols/Data/postmort/SF/MND15_ssfp7T_q300/x_150919/x_relax/';
folder_SF{6}='/vols/Data/postmort/SF/MND16_ssfp7T_q300/x_150411/x_relax/';
folder_SF{7}='/vols/Data/postmort/SF/MND16_ssfp7T_q300/x_150803/x_relax/';
folder_SF{8}='/vols/Data/postmort/SF/MND17_ssfp7T_q300/x_relax/';
folder_SF{9}='/vols/Data/postmort/SF/MND18_ssfp7T_q300/x_150509/x_relax/';
folder_SF{10}='/vols/Data/postmort/SF/MND18_ssfp7T_q300/x_150909/x_relax/';
folder_SF{11}='/vols/Data/postmort/SF/MND19_ssfp7T_q300/x_150516/x_relax/';
folder_SF{12}='/vols/Data/postmort/SF/MND19_ssfp7T_q300/x_150724/x_relax/';
folder_SF{13}='/vols/Data/postmort/SF/MND20_ssfp7T_q300/x_relax/';
folder_SF{14}='/vols/Data/postmort/SF/MND21_ssfp7T_q300/x_relax/';
folder_SF{15}='/vols/Data/postmort/SF/MND22_ssfp7T_q300/x_relax/';
folder_SF{16}='/vols/Data/postmort/SF/MND23_ssfp7T_q300/x_relax/';

folder_EPG{1}=strcat('/vols/Data/km/fengqi/EPG/','MND12');
folder_EPG{2}=strcat('/vols/Data/km/fengqi/EPG/','MND13');
folder_EPG{3}=strcat('/vols/Data/km/fengqi/EPG/','MND14');
folder_EPG{4}=strcat('/vols/Data/km/fengqi/EPG/','MND15_150403');
folder_EPG{5}=strcat('/vols/Data/km/fengqi/EPG/','MND15_150919');
folder_EPG{6}=strcat('/vols/Data/km/fengqi/EPG/','MND16_150411');
folder_EPG{7}=strcat('/vols/Data/km/fengqi/EPG/','MND16_150803');
folder_EPG{8}=strcat('/vols/Data/km/fengqi/EPG/','MND17');
folder_EPG{9}=strcat('/vols/Data/km/fengqi/EPG/','MND18_150509');
folder_EPG{10}=strcat('/vols/Data/km/fengqi/EPG/','MND18_150909');
folder_EPG{11}=strcat('/vols/Data/km/fengqi/EPG/','MND19_150516');
folder_EPG{12}=strcat('/vols/Data/km/fengqi/EPG/','MND19_150724');
folder_EPG{13}=strcat('/vols/Data/km/fengqi/EPG/','MND20');
folder_EPG{14}=strcat('/vols/Data/km/fengqi/EPG/','MND21');
folder_EPG{15}=strcat('/vols/Data/km/fengqi/EPG/','MND22');
folder_EPG{16}=strcat('/vols/Data/km/fengqi/EPG/','MND23');
folder_EPG{17}=strcat('/vols/Data/km/fengqi/EPG/','CTL10');
folder_EPG{18}=strcat('/vols/Data/km/fengqi/EPG/','CTL11');
folder_EPG{19}=strcat('/vols/Data/km/fengqi/EPG/','CTL12');




ESP_ls{1}=11.5;
ESP_ls{2}=11.5;
ESP_ls{3}=11.5;
ESP_ls{4}=11.5;
ESP_ls{5}=11.5;
ESP_ls{6}=11.5;
ESP_ls{7}=11.5;
ESP_ls{8}=11.5;
ESP_ls{9}=11.5;
ESP_ls{10}=11.5;
ESP_ls{11}=11.5;
ESP_ls{12}=11.5;
ESP_ls{13}=11.5;%MND20
ESP_ls{14}=10;%MND21
ESP_ls{15}=10;%MND22
ESP_ls{16}=10;%MND23
ESP_ls{17}=12.5;%CTL10
ESP_ls{18}=12.5;%CTL11
ESP_ls{19}=12.5;%CTL12
ESP_ls{20}=12.5;%MND24


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


warning off
flag_medfilt3=0;
if flag_medfilt3==1
    for ii=1:16
        try
            folder_EPG_pc{ii}
            disp('good')
                cd (folder_EPG_pc{ii}) 
                qf_medfilt3('ALP.nii.gz')
                
        catch
            folder_EPG_pc{ii}
            disp('bad')
        end
    end
end



T1=450;
generatePara=0
if generatePara==1
    for ii=1:16
        cd (folder_EPG{ii})
        ESP=ESP_ls(ii);
       save ('para.mat','ESP','T1'); 
    end
end
%series time


%flag has six echo?
flag{1}=1;
flag{2}=1;
flag{3}=0;
flag{4}=0;
flag{5}=1;
flag{6}=0;
flag{7}=1;
flag{8}=0;
flag{9}=1;
flag{10}=1;
flag{11}=1;
flag{12}=1;
flag{13}=1;
flag{14}=1;
flag{15}=0;
flag{16}=1;


flag_flirt{1}=0;
flag_flirt{2}=0;
flag_flirt{3}=0;
flag_flirt{4}=0;
flag_flirt{5}=1;
flag_flirt{6}=0;
flag_flirt{7}=0;
flag_flirt{8}=0;
flag_flirt{9}=0;
flag_flirt{10}=0;
flag_flirt{11}=0;
flag_flirt{12}=0;
flag_flirt{13}=0;
flag_flirt{14}=0;
flag_flirt{15}=0;
flag_flirt{16}=0;


flagcopyfile=0;
if flagcopyfile==1
    for ii=15:16
        try
        cd (folder_SF{ii})
        copyfile(strcat('*.nii.gz'),folder_EPG{ii});
        cd ../x_struct   
        copyfile(strcat('struct_to_diff.nii.gz'),folder_EPG{ii});
        catch exp
        end
    end
end



