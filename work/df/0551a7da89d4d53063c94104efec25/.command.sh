#!/bin/bash -euo pipefail
plot_macs2_qc.r \
    -i OSMOTIC_STRESS_T100_SE_peaks.broadPeak,OSMOTIC_STRESS_T0_PE_peaks.broadPeak \
    -s OSMOTIC_STRESS_T100_SE,OSMOTIC_STRESS_T0_PE \
    -o ./ -p macs2_peak

cat <<-END_VERSIONS > versions.yml
"NFCORE_ATACSEQ:ATACSEQ:MERGED_REPLICATE_CALL_ANNOTATE_PEAKS:PLOT_MACS2_QC":
    r-base: $(echo $(R --version 2>&1) | sed 's/^.*R version //; s/ .*$//')
END_VERSIONS
