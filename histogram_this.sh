#!/bin/sh

datafile=$1
nobins=$2
echo "  #!#  # Copyright (c) Carlo Motta"
echo "  #!#  usage: ./histogram_this.sh <datafile> <number_of_bins>"
echo "  #!#  data = $datafile         number of bins = $2"

cat >gplotfile<<!
# set term postscript enhanced eps colour lw 2 "Helvetica" 20
# set output "optics.{{Template:optics_dielectric}}eps"
binwidth=$2
bin(x,width)=width*floor(x/width)
plot '$datafile' using (bin(\$1,binwidth)):(1.0) smooth freq with boxes
!

gnuplot -persist gplotfile
