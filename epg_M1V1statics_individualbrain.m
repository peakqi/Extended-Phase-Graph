function epg_M1V1statics_individualbrain

% export ANTSPATH=/home/fs0/shurley/Software/ANTs/bin
% cp ../MNI152.nii.gz .
% cp ../M1.nii.gz .
% cp ../V1.nii.gz .
% cp ../V2.nii.gz .
% fslcpgeom MNI152.nii.gz M1.nii.gz
% fslswapdim M1.nii.gz -x y z M1.nii.gz
% fslcpgeom MNI152.nii.gz V1.nii.gz
% fslswapdim V1.nii.gz -x y z V1.nii.gz
% fslcpgeom MNI152.nii.gz V2.nii.gz
% fslswapdim V2.nii.gz -x y z V2.nii.gz
% $ANTSPATH/antsApplyTransforms -i M1.nii.gz -o deformed2indi_M1.nii.gz -r MNI2diffWarped.nii.gz -t MNI2diff1Warp.nii.gz -t MNI2diff0GenericAffine.mat
% $ANTSPATH/antsApplyTransforms -i V1.nii.gz -o deformed2indi_V1.nii.gz -r MNI2diffWarped.nii.gz -t MNI2diff1Warp.nii.gz -t MNI2diff0GenericAffine.mat
% $ANTSPATH/antsApplyTransforms -i V2.nii.gz -o deformed2indi_V2.nii.gz -r MNI2diffWarped.nii.gz -t MNI2diff1Warp.nii.gz -t MNI2diff0GenericAffine.mat
% cp MD_seg.nii.gz deformed2indi_seg.nii.gz
% cp struct_to_diff.nii.gz deformed2indi_str.nii.gz
% cp mask.nii.gz deformed2indi_msk.nii.gz
% pwd
%fslview final1_str.nii.gz final1_M1.nii.gz -l Red-Yellow final1_V1.nii.gz -l Blue-Lightblue final1_V2.nii.gz -l Pink final1_seg.nii.gz -l MGH-Cortical &
%fslview final1_str.nii.gz final1_M1gm.nii.gz -l Red-Yellow final1_V1gm.nii.gz -l Blue-Lightblue final1_V2gm.nii.gz -l Pink final1_seg.nii.gz -l &
clear
M1=qf_load('deformed2indi_M1.nii.gz');
V1=qf_load('deformed2indi_V1.nii.gz');
V2=qf_load('deformed2indi_V2.nii.gz');
seg=qf_load('deformed2indi_seg.nii.gz');
str=qf_load('deformed2indi_str.nii.gz');
T2=qf_load('masked_step2_T2Z.nii.gz');

msk=single(T2>0&T2<100);
M1=single(M1==1).*msk;
V1=single(V1==1).*msk;
V2=single(V2==1).*msk;
seg=seg.*msk;
str=str.*msk;
SliceBrowser(seg)
nn=4
SliceBrowser(single(seg>=nn))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

M1gm=single(seg>=nn).*M1;
V1gm=single(seg>=nn).*V1;
V2gm=single(seg>=nn).*V2;

qf_save(M1,'final1_M1.nii.gz')
qf_save(V1,'final1_V1.nii.gz')
qf_save(V2,'final1_V2.nii.gz')
qf_save(str,'final1_str.nii.gz')
qf_save(single(seg>=nn),'final1_seg.nii.gz')
qf_save(M1gm,'final1_M1gm.nii.gz')
qf_save(V1gm,'final1_V1gm.nii.gz')
qf_save(V2gm,'final1_V2gm.nii.gz')

totalvoxel=210*240*176;



ROI=M1gm;
T2ROIflat = reshape(T2.*ROI,totalvoxel,1);
ind=find(T2ROIflat>0);
T2ROItrue=T2ROIflat(ind);
meanT2ROI=mean(T2ROItrue);
ROIflat = reshape(ROI,totalvoxel,1);
ROItrue=ROIflat(ind);
meanROI=mean(ROItrue);
normT2ROI=meanT2ROI/meanROI;
M1mean=normT2ROI

ROI=V1gm;
T2ROIflat = reshape(T2.*ROI,totalvoxel,1);
ind=find(T2ROIflat>0);
T2ROItrue=T2ROIflat(ind);
meanT2ROI=mean(T2ROItrue);
ROIflat = reshape(ROI,totalvoxel,1);
ROItrue=ROIflat(ind);
meanROI=mean(ROItrue);
normT2ROI=meanT2ROI/meanROI;
V1mean=normT2ROI

ROI=V2gm;
T2ROIflat = reshape(T2.*ROI,totalvoxel,1);
ind=find(T2ROIflat>0);
T2ROItrue=T2ROIflat(ind);
meanT2ROI=mean(T2ROItrue);
ROIflat = reshape(ROI,totalvoxel,1);
ROItrue=ROIflat(ind);
meanROI=mean(ROItrue);
normT2ROI=meanT2ROI/meanROI;
V2mean=normT2ROI

load ('../statics.mat');
aa=pwd;
C = strsplit(aa,'/')
subject = {C{end}};
V1=V1mean;
V2=V2mean;
M1=M1mean;
M1V1=M1/V1;
M1V2=M1/V2;
Statinew = table(subject,V1,V2,M1,M1V1,M1V2)
Stati=[Stati;Statinew]




%%%%%%%%%%%%%%%%%%%%%
save('../statics.mat','Stati')
qf_save(T2/V1mean,'final1_T2V1.nii.gz');
qf_save(T2/V2mean,'final1_T2V2.nii.gz');






