##20190409
E_MTAB_2600_GoodCells_cellID$covGroup <- 'Good_cells'
E_MTAB_2600_Skewed_coverage_cellID$covGroup <- 'Skewed_coverage_cells'
#E_MTAB_2600_Skewed_coverage_trimmedcellID$covGroup <- 'Trimmed_cells'


E_MTAB_2600_columnAnnotation <- rbind(E_MTAB_2600_GoodCells_cellID,
                                      E_MTAB_2600_Skewed_coverage_cellID)
                                      ,
                                      E_MTAB_2600_Skewed_coverage_trimmedcellID)
rownames(E_MTAB_2600_columnAnnotation) <- E_MTAB_2600_columnAnnotation$V1
E_MTAB_2600_columnAnnotation$V1 <- NULL
saveRDS(E_MTAB_2600_columnAnnotation,file = "/analysisdata/singlecell-db/expression/mm10/mm10_E-MTAB-2600/E-MTAB-2600_apoptosis_analysis/E_MTAB_2600_columnAnnotation.rds")