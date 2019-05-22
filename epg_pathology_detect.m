  
function epg_pathology_detect(T2)
    switch nargin
            case 1
                
            otherwise
                T2=qf_load('sim_KT_withHole_flowout/Corrected-T2_KT_withHole_flowout_Correction.nii.gz');
                %T2=qf_load('T2.nii.gz');
    end


mask=qf_load('mask.nii.gz');
T2=T2.*mask;
% qf_save(T2,'EPGed_T2_masked.nii.gz')
  CC = bwconncomp(T2<35&T2>17);
  ind=[];
  for ii=1:CC.NumObjects
      s=size(CC.PixelIdxList{ii});
      if s(1)>100 %& s(1)>100
          ii
          s
          ind=cat(1,ind,CC.PixelIdxList{ii});
      end
  end
  
  A=reshape(T2*0,sz(1)*sz(2)*sz(3),1);
  A(ind)=1;
  patho=reshape(A,sz);
  qf_save(patho,'pathology.nii.gz')