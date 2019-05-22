#!/bin/sh
fsl_sub -q veryshort.q matlab -r epg0_start
a=1
while [ "$a" -lt 240 ]    # this is loop1
do
   fsl_sub -q veryshort.q matlab -r epg22_cal_AlpT2S0_fbfitting
   a=`expr $a + 1`
done

