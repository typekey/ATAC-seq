#!/bin/bash -euo pipefail
plotHeatmap \
     \
    --matrixFile OSMOTIC_STRESS_T150_SE_REP1.reference_point.computeMatrix.mat.gz \
    --outFileName OSMOTIC_STRESS_T150_SE_REP1.scale_regions.plotHeatmap.pdf \
    --outFileNameMatrix OSMOTIC_STRESS_T150_SE_REP1.scale_regions.plotHeatmap.mat.tab

cat <<-END_VERSIONS > versions.yml
"NFCORE_ATACSEQ:ATACSEQ:MERGED_LIBRARY_BIGWIG_PLOT_DEEPTOOLS:DEEPTOOLS_PLOTHEATMAP":
    deeptools: $(plotHeatmap --version | sed -e "s/plotHeatmap //g")
END_VERSIONS
