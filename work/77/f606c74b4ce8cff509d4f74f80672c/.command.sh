#!/bin/bash -euo pipefail
samtools \
    index \
    -@ 1 \
     \
    OSMOTIC_STRESS_T0_PE_REP2.mLb.mkD.sorted.bam

cat <<-END_VERSIONS > versions.yml
"NFCORE_ATACSEQ:ATACSEQ:MERGED_LIBRARY_MARKDUPLICATES_PICARD:SAMTOOLS_INDEX":
    samtools: $(echo $(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*$//')
END_VERSIONS
