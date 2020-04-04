##20190614
hg38_10x_PBMC_GoodCells_cellID$covGroup <- 'Good_cells'
hg38_10x_PBMC_Skewed_coverage_cellID$covGroup <- 'Skewed_coverage_cells'
#hg38_10x_PBMC_Skewed_coverage_trimmedcellID$covGroup <- 'Trimmed_cells'


hg38_10x_PBMC_columnAnnotation <- rbind(hg38_10x_PBMC_GoodCells_cellID,
                                      hg38_10x_PBMC_Skewed_coverage_cellID)
rownames(hg38_10x_PBMC_columnAnnotation) <- hg38_10x_PBMC_columnAnnotation$V1
hg38_10x_PBMC_columnAnnotation$V1 <- NULL
saveRDS(hg38_10x_PBMC_columnAnnotation,file = "/analysisdata/singlecell-db/expression/hg38/hg38_10x_PBMC/hg38_10x_PBMC_apoptosis_analysis/hg38_10x_PBMC_columnAnnotation.rds")