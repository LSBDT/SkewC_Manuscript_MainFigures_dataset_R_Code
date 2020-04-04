##20190606
GSE46980_GoodCells_cellID$covGroup <- 'Good_cells'
GSE46980_Skewed_coverage_cellID$covGroup <- 'Skewed_coverage_cells'
#GSE46980_Skewed_coverage_trimmedcellID$covGroup <- 'Trimmed_cells'


GSE46980_columnAnnotation <- rbind(GSE46980_GoodCells_cellID,
                                      GSE46980_Skewed_coverage_cellID)

rownames(GSE46980_columnAnnotation) <- GSE46980_columnAnnotation$V1
GSE46980_columnAnnotation$V1 <- NULL
saveRDS(GSE46980_columnAnnotation,file = "/analysisdata/singlecell-db/expression/mm10/mm10_GSE46980/GSE46980_apoptosis_analysis/GSE46980_columnAnnotation.rds")