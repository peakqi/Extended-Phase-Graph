function epg_make_JuelichMasks
im=qf_load('Juelich-prob-1mm.nii.gz');
m1=[46,47,48,49];
M1=squeeze(im(:,:,:,1)*0);
for ii=1:4
    M1=M1+squeeze(im(:,:,:,m1(ii)+1));
end
qf_save(M1/max(max(max(M1))),'M1.nii.gz')



m1=[80,81];
M1=squeeze(im(:,:,:,1)*0);
for ii=1:2
    M1=M1+squeeze(im(:,:,:,m1(ii)+1));
end
qf_save(M1/max(max(max(M1))),'V1.nii.gz')


m1=[82,83];
M1=squeeze(im(:,:,:,1)*0);
for ii=1:2
    M1=M1+squeeze(im(:,:,:,m1(ii)+1));
end
qf_save(M1/max(max(max(M1))),'V2.nii.gz')

