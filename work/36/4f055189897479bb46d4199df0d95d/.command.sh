#!/bin/bash -euo pipefail
bedGraphToBigWig \
    OSMOTIC_STRESS_T100_SE_REP2.bedGraph \
    genome.fa.sizes \
    OSMOTIC_STRESS_T100_SE_REP2.bigWig

cat <<-END_VERSIONS > versions.yml
"NFCORE_ATACSEQ:ATACSEQ:MERGED_LIBRARY_BAM_TO_BIGWIG:UCSC_BEDGRAPHTOBIGWIG":
    ucsc: 445
END_VERSIONS
