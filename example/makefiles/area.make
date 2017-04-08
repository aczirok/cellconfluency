# experiment number

IDA=$(shell pwd . | rev | cut -d"/" -f2 | rev)


AplotA=" "
AplotAA=" u 1:5 ti 'wt' w li lt 2 lc rgb 'green' lw 2 "
AplotAB=" u 1:5 notitle w li lt 2 lc rgb 'green' lw 2 "
AplotAC=" u 1:5 notitle w li lt 2 lc rgb 'green' lw 2 "
AplotAD=" u 1:5 notitle w li lt 2 lc rgb 'green' lw 2 "
AplotAE=" u 1:5 notitle w li lt 2 lc rgb 'green' lw 2 "
AplotAF=" u 1:5 notitle w li lt 2 lc rgb 'green' lw 2 "
AplotB=" "
AplotBA=" u 1:5 ti 'kd' w li lt 2 lc rgb 'red' lw 2 "
AplotBB=" u 1:5 notitle w li lt 2 lc rgb 'red' lw 2 "
AplotBC=" u 1:5 notitle w li lt 2 lc rgb 'red' lw 2 "
AplotBD=" u 1:5 notitle w li lt 2 lc rgb 'red' lw 2 "
AplotBE=" u 1:5 notitle w li lt 2 lc rgb 'red' lw 2 "
AplotBF=" u 1:5 notitle w li lt 2 lc rgb 'red' lw 2 "
AplotC=" "
AplotCA=" u 1:5 ti 'mix' w li lt 3 lc rgb 'yellow' lw 2 "
AplotCB=" u 1:5 notitle w li lt 3 lc rgb 'yellow' lw 2 "
AplotCC=" u 1:5 notitle w li lt 3 lc rgb 'yellow' lw 2 "
AplotCD=" u 1:5 notitle w li lt 3 lc rgb 'yellow' lw 2 "
AplotCE=" u 1:5 notitle w li lt 3 lc rgb 'yellow' lw 2 "
AplotD=" "
AplotDA=" u 1:5 notitle w li lt 3 lc rgb '\#DD181D' lw 2 "
AplotDB=" u 1:5 notitle w li lt 3 lc rgb '\#A6080C' lw 2 "
AplotDC=" u 1:5 notitle w li lt 3 lc rgb '\#7E0003' lw 2 "


INA= ../AF-GAMMA/PC
OUTA=../image_proc/area

AposA = $(notdir $(wildcard ${INA}/A*) )
AposB = $(notdir $(wildcard ${INA}/B*) )
AposC = $(notdir $(wildcard ${INA}/C*) )
AposD = $(notdir $(wildcard ${INA}/D*) )
Apos =${AposA} ${AposB} ${AposC} ${AposD} 

# present: selected fields for the plot
# comb: label in plot name
Apresent=${Apos}
Acomb=all

../segment_thr :
	echo 6 > $@

${OUTA}/${IDA}%.area : ${INA}/%/+0/ ../segment_thr
	mkdir -p $(dir $@)
	../../area.sh -S $$(cat ../segment_thr) $(wildcard $</*[05].* ) | sort -g > $@


../image_proc/${IDA}-${Acomb}-area.png : $(foreach i,$(Apos),${OUTA}/${IDA}$(i).area )
	(echo set style data li;\
	echo set key out reverse width 3;\
	echo set t pngcairo enhanced size 900,600 font \"Palatino,12\";\
	echo set xlabel \"frames\" ;\
	echo set ylabel \"confluency\" ;\
	echo -n plot '[0:][0:]' 0 notitle w li lt 0;\
	echo -n $(foreach j, $(Apresent), \,\'${OUTA}/${IDA}$(j).area\' ${Aplot$(j)} );) | tee $@.gnu |  gnuplot > $@


AREA : ../image_proc/${IDA}-${Acomb}-area.png
