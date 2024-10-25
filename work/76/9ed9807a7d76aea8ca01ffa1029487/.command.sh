#!/bin/bash -euo pipefail
deseq2_qc.r \
    --count_file consensus_peaks.featureCounts.txt \
    --outdir ./ \
    --outprefix consensus_peaks \
    --cores 2 \
    --id_col 1 --sample_suffix '.sorted.bam' --count_col 7 --vst TRUE

sed 's/deseq2_pca/deseq2_pca_1/g' <merged_library_deseq2_pca_header.txt >tmp.txt
sed -i -e 's/DESeq2 /consensus_peaks DESeq2 /g' tmp.txt
cat tmp.txt consensus_peaks.pca.vals.txt > consensus_peaks.pca.vals_mqc.tsv

sed 's/deseq2_clustering/deseq2_clustering_1/g' <merged_library_deseq2_clustering_header.txt >tmp.txt
sed -i -e 's/DESeq2 /consensus_peaks DESeq2 /g' tmp.txt
cat tmp.txt consensus_peaks.sample.dists.txt > consensus_peaks.sample.dists_mqc.tsv

cat <<-END_VERSIONS > versions.yml
"NFCORE_ATACSEQ:ATACSEQ:MERGED_LIBRARY_CONSENSUS_PEAKS:DESEQ2_QC":
    r-base: $(echo $(R --version 2>&1) | sed 's/^.*R version //; s/ .*$//')
    bioconductor-deseq2: $(Rscript -e "library(DESeq2); cat(as.character(packageVersion('DESeq2')))")
END_VERSIONS
