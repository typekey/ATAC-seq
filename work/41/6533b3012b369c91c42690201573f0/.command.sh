#!/bin/bash -euo pipefail
picard \
    -Xmx4915M \
    MarkDuplicates \
    --ASSUME_SORTED true --REMOVE_DUPLICATES true --VALIDATION_STRINGENCY LENIENT --TMP_DIR tmp \
    --INPUT OSMOTIC_STRESS_T100_SE.mRp.sorted.bam \
    --OUTPUT OSMOTIC_STRESS_T100_SE.sorted.bam \
    --REFERENCE_SEQUENCE genome.fa \
    --METRICS_FILE OSMOTIC_STRESS_T100_SE.sorted.MarkDuplicates.metrics.txt

cat <<-END_VERSIONS > versions.yml
"NFCORE_ATACSEQ:ATACSEQ:MERGED_REPLICATE_MARKDUPLICATES_PICARD:PICARD_MARKDUPLICATES":
    picard: $(echo $(picard MarkDuplicates --version 2>&1) | grep -o 'Version:.*' | cut -f2- -d:)
END_VERSIONS
