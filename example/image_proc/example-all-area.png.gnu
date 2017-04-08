set style data li
set key out reverse width 3
set t pngcairo enhanced size 900,600 font "Palatino,12"
set xlabel "frames"
set ylabel "confluency"
plot [0:][0:] 0 notitle w li lt 0,'../image_proc/area/exampleAB.area'  u 1:5 notitle w li lt 2 lc rgb 'green' lw 2  ,'../image_proc/area/exampleAA.area'  u 1:5 ti 'wt' w li lt 2 lc rgb 'green' lw 2  ,'../image_proc/area/exampleBB.area'  u 1:5 notitle w li lt 2 lc rgb 'red' lw 2  ,'../image_proc/area/exampleBA.area'  u 1:5 ti 'kd' w li lt 2 lc rgb 'red' lw 2  ,'../image_proc/area/exampleCB.area'  u 1:5 notitle w li lt 3 lc rgb 'yellow' lw 2  ,'../image_proc/area/exampleCA.area'  u 1:5 ti 'mix' w li lt 3 lc rgb 'yellow' lw 2 