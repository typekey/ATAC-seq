#!/bin/bash -euo pipefail
samtools \
    stats \
    --threads 1 \
    --reference genome.fa \
    OSMOTIC_STRESS_T100_SE_REP1.sorted.bam \
    > OSMOTIC_STRESS_T100_SE_REP1.sorted.bam.stats

cat <<-END_VERSIONS > versions.yml
"NFCORE_ATACSEQ:ATACSEQ:MERGED_LIBRARY_FILTER_BAM:BAM_STATS_SAMTOOLS:SAMTOOLS_STATS":
    samtools: $(echo $(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*$//')
END_VERSIONS
