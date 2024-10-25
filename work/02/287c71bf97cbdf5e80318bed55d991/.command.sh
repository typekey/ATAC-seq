#!/bin/bash -euo pipefail
annotatePeaks.pl \
    OSMOTIC_STRESS_T0_PE_REP2_peaks.broadPeak \
    genome.fa \
    -gid \
    -gtf genes.gtf \
    -cpu 2 \
    > OSMOTIC_STRESS_T0_PE_REP2_peaks.annotatePeaks.txt

cat <<-END_VERSIONS > versions.yml
"NFCORE_ATACSEQ:ATACSEQ:MERGED_LIBRARY_CALL_ANNOTATE_PEAKS:HOMER_ANNOTATEPEAKS":
    homer: 4.11
END_VERSIONS