#!/bin/bash -euo pipefail
samtools \
    index \
    -@ 1 \
     \
    OSMOTIC_STRESS_T150_SE_REP1_T2.Lb.sorted.bam

cat <<-END_VERSIONS > versions.yml
"NFCORE_ATACSEQ:ATACSEQ:FASTQ_ALIGN_BWA:BAM_SORT_STATS_SAMTOOLS:SAMTOOLS_INDEX":
    samtools: $(echo $(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*$//')
END_VERSIONS
