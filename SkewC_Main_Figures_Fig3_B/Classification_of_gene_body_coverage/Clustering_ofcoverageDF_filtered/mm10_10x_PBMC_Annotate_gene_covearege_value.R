##20190616
mm10_10x_PBMC_GoodCells_cellID$covGroup <- 'Good_cells'
mm10_10x_PBMC_Skewed_coverage_cellID$covGroup <- 'Skewed_coverage_cells'
#mm10_10x_PBMC_Skewed_coverage_trimmedcellID$covGroup <- 'Trimmed_cells'


mm10_10x_PBMC_columnAnnotation <- rbind(mm10_10x_PBMC_GoodCells_cellID,
                                      mm10_10x_PBMC_Skewed_coverage_cellID)
rownames(mm10_10x_PBMC_columnAnnotation) <- mm10_10x_PBMC_columnAnnotation$V1
mm10_10x_PBMC_columnAnnotation$V1 <- NULL
saveRDS(mm10_10x_PBMC_columnAnnotation,file = "/analysisdata/singlecell-db/expression/mm10/mm10_10x_PBMC/mm10_10x_PBMC_apoptosis_analysis/mm10_10x_PBMC_columnAnnotation.rds")