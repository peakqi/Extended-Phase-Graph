function epg_addpath

if isempty(strfind(pwd,'Documents'))
    addpath('/vols/Data/km/fengqi/NIfTI'); 
else
    addpath('/Users/fengqi/Documents/MND_REGISTRATION/EPG/EPG_code');
    set(0,'DefaultFigureWindowStyle','docked') 
end