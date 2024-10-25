#!/bin/bash -euo pipefail
plotProfile \
     \
    --matrixFile OSMOTIC_STRESS_T0_PE_REP2.scale_regions.computeMatrix.mat.gz \
    --outFileName OSMOTIC_STRESS_T0_PE_REP2.reference_point.plotProfile.pdf \
    --outFileNameData OSMOTIC_STRESS_T0_PE_REP2.reference_point.plotProfile.tab

cat <<-END_VERSIONS > versions.yml
"NFCORE_ATACSEQ:ATACSEQ:MERGED_LIBRARY_BIGWIG_PLOT_DEEPTOOLS:DEEPTOOLS_PLOTPROFILE":
    deeptools: $(plotProfile --version | sed -e "s/plotProfile //g")
END_VERSIONS
