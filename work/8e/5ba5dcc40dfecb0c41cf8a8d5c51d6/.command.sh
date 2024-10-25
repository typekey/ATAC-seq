#!/bin/bash -euo pipefail
sort -T '.' -k1,1 -k2,2n OSMOTIC_STRESS_T0_PE_REP1_peaks.broadPeak OSMOTIC_STRESS_T0_PE_REP2_peaks.broadPeak OSMOTIC_STRESS_T100_SE_REP1_peaks.broadPeak OSMOTIC_STRESS_T100_SE_REP2_peaks.broadPeak OSMOTIC_STRESS_T150_SE_REP1_peaks.broadPeak OSMOTIC_STRESS_T15_PE_REP1_peaks.broadPeak \
    | mergeBed -c 2,3,4,5,6,7,8,9 -o collapse,collapse,collapse,collapse,collapse,collapse,collapse,collapse > consensus_peaks.txt

macs2_merged_expand.py \
    consensus_peaks.txt \
    OSMOTIC_STRESS_T0_PE_REP1,OSMOTIC_STRESS_T0_PE_REP2,OSMOTIC_STRESS_T100_SE_REP1,OSMOTIC_STRESS_T100_SE_REP2,OSMOTIC_STRESS_T150_SE_REP1,OSMOTIC_STRESS_T15_PE_REP1 \
    consensus_peaks.boolean.txt \
    --min_replicates 1 \


awk -v FS='	' -v OFS='	' 'FNR > 1 { print $1, $2, $3, $4, "0", "+" }' consensus_peaks.boolean.txt > consensus_peaks.bed

echo -e "GeneID	Chr	Start	End	Strand" > consensus_peaks.saf
awk -v FS='	' -v OFS='	' 'FNR > 1 { print $4, $1, $2, $3,  "+" }' consensus_peaks.boolean.txt >> consensus_peaks.saf

plot_peak_intersect.r -i consensus_peaks.boolean.intersect.txt -o consensus_peaks.boolean.intersect.plot.pdf

cat <<-END_VERSIONS > versions.yml
"NFCORE_ATACSEQ:ATACSEQ:MERGED_LIBRARY_CONSENSUS_PEAKS:MACS2_CONSENSUS":
    python: $(python --version | sed 's/Python //g')
    r-base: $(echo $(R --version 2>&1) | sed 's/^.*R version //; s/ .*$//')
END_VERSIONS
