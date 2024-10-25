#!/bin/bash -euo pipefail
featureCounts \
    -F SAF -O --fracOverlap 0.2 \
    -p \
    -T 2 \
    -a consensus_peaks.saf \
    -s 0 \
    -o consensus_peaks.featureCounts.txt \
    OSMOTIC_STRESS_T100_SE_REP2.sorted.bam OSMOTIC_STRESS_T100_SE_REP1.sorted.bam OSMOTIC_STRESS_T0_PE_REP2.sorted.bam OSMOTIC_STRESS_T150_SE_REP1.sorted.bam OSMOTIC_STRESS_T0_PE_REP1.sorted.bam OSMOTIC_STRESS_T15_PE_REP1.sorted.bam

cat <<-END_VERSIONS > versions.yml
"NFCORE_ATACSEQ:ATACSEQ:MERGED_LIBRARY_CONSENSUS_PEAKS:SUBREAD_FEATURECOUNTS":
    subread: $( echo $(featureCounts -v 2>&1) | sed -e "s/featureCounts v//g")
END_VERSIONS
