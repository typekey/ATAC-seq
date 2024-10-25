#!/bin/bash -euo pipefail
plotFingerprint \
    --skipZeros --numberOfSamples 100 --labels OSMOTIC_STRESS_T100_SE_REP2 \
    --extendReads 200 \
    --bamfiles OSMOTIC_STRESS_T100_SE_REP2.sorted.bam \
    --plotFile OSMOTIC_STRESS_T100_SE_REP2.plotFingerprint.pdf \
    --outRawCounts OSMOTIC_STRESS_T100_SE_REP2.plotFingerprint.raw.txt \
    --outQualityMetrics OSMOTIC_STRESS_T100_SE_REP2.plotFingerprint.qcmetrics.txt \
    --numberOfProcessors 2

cat <<-END_VERSIONS > versions.yml
"NFCORE_ATACSEQ:ATACSEQ:MERGED_LIBRARY_DEEPTOOLS_PLOTFINGERPRINT":
    deeptools: $(plotFingerprint --version | sed -e "s/plotFingerprint //g")
END_VERSIONS
