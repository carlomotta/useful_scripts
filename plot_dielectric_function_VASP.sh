#!/bin/sh

awk 'BEGIN{i=1} /imag/,\
                /\/imag/ \
                 {a[i]=$2 ; b[i]=$3 ; i=i+1} \
     END{for (j=12;j<i-3;j++) print a[j],b[j]}' vasprun.xml > imag.dat

awk 'BEGIN{i=1} /real/,\
                /\/real/ \
                 {a[i]=$2 ; b[i]=$3 ; i=i+1} \
     END{for (j=12;j<i-3;j++) print a[j],b[j]}' vasprun.xml > real.dat

cat >gplotfile<<!
# set term postscript enhanced eps colour lw 2 "Helvetica" 20
# set output "optics.{{Template:optics_dielectric}}eps"
plot [0:25] "imag.dat" using (\$1):(\$2) w lp, "real.dat" using (\$1):(\$2) w lp
!

gnuplot -persist gplotfile
