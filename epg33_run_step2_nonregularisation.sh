#!/bin/sh
a=1
while [ "$a" -lt 177 ]    
do
   fsl_sub -q long.q matlab -r "epg33_step2_nonregularisation($a)"
   a=`expr $a + 1`
done

