#!/bin/sh
a=1
while [ "$a" -lt 177 ]    # this is loop1
do
   fsl_sub -q long.q matlab -r epg33_cal_T2S0_fminsearch_smooth_nonregularisation
   a=`expr $a + 1`
done

