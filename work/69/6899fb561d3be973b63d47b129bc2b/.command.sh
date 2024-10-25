#!/bin/bash -euo pipefail
samtools \
    idxstats \
    --threads 0 \
    OSMOTIC_STRESS_T100_SE_REP1.sorted.bam \
    > OSMOTIC_STRESS_T100_SE_REP1.sorted.bam.idxstats

cat <<-END_VERSIONS > versions.yml
"NFCORE_ATACSEQ:ATACSEQ:MERGED_LIBRARY_FILTER_BAM:BAM_STATS_SAMTOOLS:SAMTOOLS_IDXSTATS":
    samtools: $(echo $(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*$//')
END_VERSIONS
