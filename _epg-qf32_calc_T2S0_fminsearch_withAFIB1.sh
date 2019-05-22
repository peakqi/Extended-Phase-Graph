#!/bin/sh
fsl_sub -q veryshort.q matlab -r epg0_start
a=1
while [ "$a" -lt 240 ]    # this is loop1
do
   fsl_sub -q veryshort.q matlab -r epg32_cal_T2S0_fminsearch_withAFIB1
   a=`expr $a + 1`
done

