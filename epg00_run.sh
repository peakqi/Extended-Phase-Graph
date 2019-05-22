#!/bin/sh
mkdir CTL07
cd CTL07

jid=$(fsl_sub -q veryshort.q matlab -r epg0_prepare_data)

jid2=$(fsl_sub -q veryshort.q -j $jid bash epg1_register.sh)

jid3=$(bash epg-qf21_calc_AlpT2S0_fminsearch.sh $jid2)

bash epg-qfconstruct.sh

mkdir step1
cp fmin* step1

cp ALP.nii.gz ALP_step1.nii.gz
bash epg-qf303_smoothFA_byslice.sh

bash epg-qfconstruct_30medfilt.sh 

mkdir med_flit
cp fmin* med_flit

bash epg33-qf_calc_T2S0_fminsearch_Smoothed_regularised.sh
bash epg-qfconstruct-final.sh

adjust lambda=0
bash epg33-qf_calc_T2S0_fminsearch_Smoothed_regularised.sh



>filetorun.txt
echo ?matlab -r ?? >>filetorun.txt

jid=$(fsl_sub -q long.q -j $1 -t filetorun.txt)

echo $jid

/vols/Data/km/btendler/phase