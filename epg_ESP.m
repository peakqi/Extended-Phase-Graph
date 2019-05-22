function ESP=epg_ESP

ESP=11.5;
if ~isnumeric(ESP)
    if isempty(strfind(pwd,'Documents'))
        addpath('/vols/Data/km/fengqi/NIfTI');
        folder_EPG{1}=strcat('/vols/Data/km/fengqi/EPG/','MND12');
        folder_EPG{2}=strcat('/vols/Data/km/fengqi/EPG/','MND13');
        folder_EPG{3}=strcat('/vols/Data/km/fengqi/EPG/','MND14');
        folder_EPG{4}=strcat('/vols/Data/km/fengqi/EPG/','MND15');
        folder_EPG{5}=strcat('/vols/Data/km/fengqi/EPG/','MND15_unused');
        folder_EPG{6}=strcat('/vols/Data/km/fengqi/EPG/','MND16');
        folder_EPG{7}=strcat('/vols/Data/km/fengqi/EPG/','MND16_unused');
        folder_EPG{8}=strcat('/vols/Data/km/fengqi/EPG/','MND17');
        folder_EPG{9}=strcat('/vols/Data/km/fengqi/EPG/','MND18_unused');
        folder_EPG{10}=strcat('/vols/Data/km/fengqi/EPG/','MND18');
        folder_EPG{11}=strcat('/vols/Data/km/fengqi/EPG/','MND19');
        folder_EPG{12}=strcat('/vols/Data/km/fengqi/EPG/','MND19_unused');
        folder_EPG{13}=strcat('/vols/Data/km/fengqi/EPG/','MND20');
        folder_EPG{14}=strcat('/vols/Data/km/fengqi/EPG/','MND21');
        folder_EPG{15}=strcat('/vols/Data/km/fengqi/EPG/','MND22');
        folder_EPG{16}=strcat('/vols/Data/km/fengqi/EPG/','MND23');
        folder_EPG{17}=strcat('/vols/Data/km/fengqi/EPG/','CTL10');
        folder_EPG{18}=strcat('/vols/Data/km/fengqi/EPG/','CTL11');
        folder_EPG{19}=strcat('/vols/Data/km/fengqi/EPG/','CTL12');
        folder_EPG{20}=strcat('/vols/Data/km/fengqi/EPG/','MND24');
        folder_EPG{21}=strcat('/vols/Data/km/fengqi/EPG/','CTL05');
        folder_EPG{22}=strcat('/vols/Data/km/fengqi/EPG/','CTL07');
    else
       addpath('/Users/fengqi/Documents/MND_REGISTRATION/EPG/EPG_code');   
        folder_EPG{1}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND12');
        folder_EPG{2}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND13');
        folder_EPG{3}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND14');
        folder_EPG{4}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND15');
        folder_EPG{5}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND15_unused');
        folder_EPG{6}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND16');
        folder_EPG{7}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND16_unused');
        folder_EPG{8}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND17');
        folder_EPG{9}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND18_unused');
        folder_EPG{10}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND18');
        folder_EPG{11}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND19');
        folder_EPG{12}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND19_unused');
        folder_EPG{13}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND20');
        folder_EPG{14}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND21');
        folder_EPG{15}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND22');
        folder_EPG{16}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND23');
        folder_EPG{17}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','CTL10');
        folder_EPG{18}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','CTL11');
        folder_EPG{19}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','CTL12');
        folder_EPG{20}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','MND24');
        folder_EPG{21}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','CTL05');
        folder_EPG{22}=strcat('/Users/fengqi/Documents/MND_REGISTRATION/EPG/','CTL07');
    end



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
    ESP_ls{13}=11.5;
    ESP_ls{14}=10;
    ESP_ls{15}=10;%MND22
    ESP_ls{16}=10;
    ESP_ls{17}=12.5;
    ESP_ls{18}=12.5;
    ESP_ls{19}=12.5;
    ESP_ls{20}=12.5;
    ESP_ls{21}=13.67;
    ESP_ls{22}=14;
    
    ind=0;
    for ii=1:numel(folder_EPG)
        TF = strcmp(pwd,folder_EPG{ii});

        if TF==1
           ind=ii;
           ESP=ESP_ls{ii};
          % disp(strcat('found ESP:',num2str(ESP),',in folder:',folder_EPG{ii}));
        end
    end

end


