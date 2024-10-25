#!/bin/bash -euo pipefail
plotFingerprint \
    --skipZeros --numberOfSamples 100 --labels OSMOTIC_STRESS_T0_PE_REP1 \
     \
    --bamfiles OSMOTIC_STRESS_T0_PE_REP1.sorted.bam \
    --plotFile OSMOTIC_STRESS_T0_PE_REP1.plotFingerprint.pdf \
    --outRawCounts OSMOTIC_STRESS_T0_PE_REP1.plotFingerprint.raw.txt \
    --outQualityMetrics OSMOTIC_STRESS_T0_PE_REP1.plotFingerprint.qcmetrics.txt \
    --numberOfProcessors 2

cat <<-END_VERSIONS > versions.yml
"NFCORE_ATACSEQ:ATACSEQ:MERGED_LIBRARY_DEEPTOOLS_PLOTFINGERPRINT":
    deeptools: $(plotFingerprint --version | sed -e "s/plotFingerprint //g")
END_VERSIONS
