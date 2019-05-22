#!/bin/sh
flirt -in trufi_comb.nii.gz -ref dti_MD.nii.gz -out struct_to_diff
flirt -in T2map.nii.gz -ref struct_to_diff.nii.gz -omat matrix.mat -cost mutualinfo
flirt -in T2map.nii.gz -ref struct_to_diff.nii.gz -applyxfm -init matrix.mat -out _T2_map_t2.nii.gz
flirt -in S0.nii.gz -ref struct_to_diff.nii.gz -applyxfm -init matrix.mat -out _T2_map_s0.nii.gz
flirt -in backup/vol0000.nii.gz -ref struct_to_diff.nii.gz -applyxfm -init matrix.mat -out _vol0000.nii.gz
flirt -in backup/vol0001.nii.gz -ref struct_to_diff.nii.gz -applyxfm -init matrix.mat -out _vol0001.nii.gz
flirt -in backup/vol0002.nii.gz -ref struct_to_diff.nii.gz -applyxfm -init matrix.mat -out _vol0002.nii.gz
flirt -in vol0003.nii.gz -ref struct_to_diff.nii.gz -applyxfm -init matrix.mat -out _vol0003.nii.gz
flirt -in vol0004.nii.gz -ref struct_to_diff.nii.gz -applyxfm -init matrix.mat -out _vol0004.nii.gz
flirt -in vol0005.nii.gz -ref struct_to_diff.nii.gz -applyxfm -init matrix.mat -out _vol0005.nii.gz
fslmerge -t _tse.nii.gz _vol0000.nii.gz _vol0001.nii.gz _vol0002.nii.gz _vol0003.nii.gz _vol0004.nii.gz _vol0005.nii.gz