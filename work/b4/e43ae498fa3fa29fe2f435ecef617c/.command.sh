#!/bin/bash -euo pipefail
samtools sort \
    -n \
    -@ 2 \
    -o OSMOTIC_STRESS_T0_PE_REP2.mLb.flT.name_sorted.bam \
    -T OSMOTIC_STRESS_T0_PE_REP2.mLb.flT.name_sorted \
    OSMOTIC_STRESS_T0_PE_REP2.mLb.flT.sorted.bam

cat <<-END_VERSIONS > versions.yml
"NFCORE_ATACSEQ:ATACSEQ:MERGED_LIBRARY_FILTER_BAM:SAMTOOLS_SORT":
    samtools: $(echo $(samtools --version 2>&1) | sed 's/^.*samtools //; s/Using.*$//')
END_VERSIONS
