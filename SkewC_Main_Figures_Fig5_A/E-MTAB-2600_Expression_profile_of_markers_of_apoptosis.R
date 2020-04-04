## replace zeros with NA
mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_sub <- mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes

mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_sub[mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_sub ==0] <- NA

png(
  filename = "./E-MTAB-2600_boxplot_high_high.png",
  height = 1200,
  width = 1200,
  res = 150
)
boxplot(mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_sub[, c('ERR1211471', 'ERR1211638')], 
log = "y",col = "blue",ylim = c(0.01, 50))
title("E-MTAB-2600: Expression profile of markers of apoptosis,high coverage cells")



dev.off()

png(
  filename = "./E-MTAB-2600_boxplot_low_low.png",
  height = 1200,
  width = 1200,
  res = 150
)
boxplot(mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes[, c('ERR523100', 'ERR522921')], 
        log = "y",col = "blue",ylim = c(0.01, 50))
title("E-MTAB-2600: Expression profile of markers of apoptosis,low coverage cells")
dev.off()
