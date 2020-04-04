liscells <- as.character('ERR523165','ERR522981','ERR522820','ERR523176','ERR523023','ERR522940','ERR522896','ERR522951','ERR523086','ERR523196','ERR523061','ERR523131','ERR522968',
'ERR522854','ERR523184','ERR522981','ERR523173')

low_cov_fpkm <- mm10_EMTAB_2600_FPKM_mereged[,'ERR523165','ERR522981','ERR522820','ERR523176','ERR523023','ERR522940','ERR522896','ERR522951','ERR523086','ERR523196','ERR523061','ERR523131','ERR522968',
                                                         'ERR522854','ERR523184','ERR522981','ERR523173',drop = FALSE])


mm10_EMTAB_2600_FPKM_mereged2C_alternative2imedia <-
  mm10_EMTAB_2600_FPKM_mereged2C %>% dplyr::select(one_of(as.character(mm10_EMTAB_2600_metadata_processd_standard2imedia$Comment.ENA_RUN.)))

rownames(low_cov_fpkm) <- low_cov_fpkm$Gene
names(low_cov_fpkm)[1]
low_cov_fpkm$Gene <- NULL

low_cov_fpkmC <-
  subset(
    low_cov_fpkm,
    row.names(low_cov_fpkm) %in% mm_apoptosis_categorized_gene_v2$Gene)
    
    library(pheatmap)
    library(RColorBrewer)
    pheatmap(low_cov_fpkmC, annotation_row = mydf22, cellheight = 10, cellwidth = 20, file = "TEST20.png")
    