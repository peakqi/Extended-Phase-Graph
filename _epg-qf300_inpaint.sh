#!/bin/sh
#fsl_sub -q veryshort.q matlab -r epg0_start
cp ../ind.mat .
a=1
while [ "$a" -lt 240 ]    # this is loop1
do
   fsl_sub -q veryshort.q matlab -r epg300_inpaint
   a=`expr $a + 1`
done

