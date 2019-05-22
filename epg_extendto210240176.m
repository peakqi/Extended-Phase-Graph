function epg_extendto210240176(filename)

addpath('/vols/Data/km/fengqi/NIfTI');

f=qf_load(filename);
sz=size(f);
szsz=max(size(sz));    
a1=floor((210-sz(1))/2)+1;
a2=floor((240-sz(2))/2)+1;
a3=floor((176-sz(3))/2)+1;
    
if szsz==4
    im=zeros(210,240,176,sz(4));
    im(a1:a1+sz(1)-1,a2:a2+sz(2)-1,a3:a3+sz(3)-1,:)=f;  
else
    im=zeros(210,240,176);
    im(a1:a1+sz(1)-1,a2:a2+sz(2)-1,a3:a3+sz(3)-1)=f;
end

qf_save(f,strcat('orig_',filename))
qf_save(im,filename)