#!/bin/bash -euo pipefail
plot_macs2_qc.r \
    -i OSMOTIC_STRESS_T100_SE_REP2_peaks.broadPeak,OSMOTIC_STRESS_T100_SE_REP1_peaks.broadPeak,OSMOTIC_STRESS_T0_PE_REP2_peaks.broadPeak,OSMOTIC_STRESS_T150_SE_REP1_peaks.broadPeak,OSMOTIC_STRESS_T0_PE_REP1_peaks.broadPeak,OSMOTIC_STRESS_T15_PE_REP1_peaks.broadPeak \
    -s OSMOTIC_STRESS_T100_SE_REP2,OSMOTIC_STRESS_T100_SE_REP1,OSMOTIC_STRESS_T0_PE_REP2,OSMOTIC_STRESS_T150_SE_REP1,OSMOTIC_STRESS_T0_PE_REP1,OSMOTIC_STRESS_T15_PE_REP1 \
    -o ./ -p macs2_peak

cat <<-END_VERSIONS > versions.yml
"NFCORE_ATACSEQ:ATACSEQ:MERGED_LIBRARY_CALL_ANNOTATE_PEAKS:PLOT_MACS2_QC":
    r-base: $(echo $(R --version 2>&1) | sed 's/^.*R version //; s/ .*$//')
END_VERSIONS