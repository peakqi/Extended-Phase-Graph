#!/bin/sh
#fsl_sub -q veryshort.q matlab -r epg0_start
cp ../ind176.mat ind.mat
a=1
while [ "$a" -lt 240 ]    # this is loop1
do
   fsl_sub -q long.q matlab -r epg21_cal_AlpT2S0_fminsearch
   a=`expr $a + 1`
done

