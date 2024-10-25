#!/bin/bash -euo pipefail
samtools \
    index \
    -@ 1 \
     \
    OSMOTIC_STRESS_T100_SE_REP1.mLb.mkD.sorted.bam

cat <<-END_VERSIONS > versions.yml
"NFCORE_ATACSEQ:ATACSEQ:MERGED_LIBRARY_MARKDUPLICATES_PICARD:SAMTOOLS_INDEX":
    samtools: $(echo $(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*$//')
END_VERSIONS
