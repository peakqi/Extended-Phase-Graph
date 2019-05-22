#!/bin/sh
#fsl_sub -q veryshort.q matlab -r epg0_start
cp ../ind176.mat ind.mat
a=1
>filetorun.txt
while [ "$a" -lt 177 ]    # this is loop1
do
   
   fsl_sub -q long.q matlab -r epg303_smoothFA_byslice
   a=`expr $a + 1`
done

