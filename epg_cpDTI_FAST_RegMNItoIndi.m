function epg_cpDTI_FAST_RegMNItoIndi
epg_addpath;


pm_folder{1}='/vols/Data/postmort/SF/MND12_ssfp7T_q300/';
pm_folder{2}='/vols/Data/postmort/SF/MND13_ssfp7T_q300/';
pm_folder{3}='/vols/Data/postmort/SF/MND14_ssfp7T_q300/';
pm_folder{4}='/vols/Data/postmort/SF/MND15_ssfp7T_q300/x_150403/';
pm_folder{5}='/vols/Data/postmort/SF/MND15_ssfp7T_q300/x_150919/';
pm_folder{6}='/vols/Data/postmort/SF/MND16_ssfp7T_q300/x_150411/';
pm_folder{7}='/vols/Data/postmort/SF/MND16_ssfp7T_q300/x_150803/';
pm_folder{8}='/vols/Data/postmort/SF/MND17_ssfp7T_q300/';
pm_folder{9}='/vols/Data/postmort/SF/MND18_ssfp7T_q300/x_150509/';
pm_folder{10}='/vols/Data/postmort/SF/MND18_ssfp7T_q300/x_150909/';
pm_folder{11}='/vols/Data/postmort/SF/MND19_ssfp7T_q300/x_150516/';
pm_folder{12}='/vols/Data/postmort/SF/MND19_ssfp7T_q300/x_150724/';
pm_folder{13}='/vols/Data/postmort/SF/MND20_ssfp7T_q300/';
pm_folder{14}='/vols/Data/postmort/SF/MND21_ssfp7T_q300/';
pm_folder{15}='/vols/Data/postmort/SF/MND22_ssfp7T_q300/';
pm_folder{16}='/vols/Data/postmort/SF/MND23_ssfp7T_q300/';



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


for ii=1:length(pm_folder)
    try
        cd (folder_EPG(ii))
        sourceaddr=strcat(pm_folder{ii},'x_bedpost_24deg.dtifit/','*MD.nii.gz')       
        copyfile(sourceaddr,'.')
        
        
    catch e1
        ii
        sourceaddr
        
    end
    
end



