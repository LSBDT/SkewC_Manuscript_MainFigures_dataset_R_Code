library(reshape2)
mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_melted <- melt(mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes, id = c("Gene"))
row_sub = apply(mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_melted, 1, function(row) all(row !=0.0000000))
mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_melted_row_sub   <-mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_melted[row_sub,]

mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_melted_row_sub[!(apply(mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_melted_row_sub, 1, function(y) any(y == 0))),]

mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_melted_row_sub <- 
  mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_melted[apply(mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_melted!=0, 1, all),]
library(ggplot2)
png("./mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_genes.png",res = 100, height = 5500,width = 5700)
bp <-
  ggplot(data = mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_melted_row_sub_mereged, aes(x = variable, y = value, fill = Gene)) +   geom_bar(stat = "identity") + coord_flip()
bp + scale_fill_manual(
  values = c(
    "#D55E00",
    "#E69F00",
    "#56B4E9",
    "#009E73",
    "#F0E442",
    "#0072B2"
  ),
  name = "Apoptosis genes",
  breaks = c(
    "ENSMUSG00000003873.10",
    "ENSMUSG00000025888.5",
    "ENSMUSG00000027381.16",
    "ENSMUSG00000057789.13",
    "ENSMUSG00000059552.13",
    "ENSMUSG00000063727.3"
  ),
  labels = c(
    "BAX(Positive Regulation of Apoptosis)",
    "CASP1(Positive Regulation of Apoptosis)",
    "BCL2L11(pro-apoptotic genes)",
    "BAK1(pro-apoptotic genes)",
    "TRP53(Induction of apoptosis)",
    "TNFRSF11B(Death domain reciptor)"
  )
) 
bp+ xlab("Single-cell Id") + ylab("Apoptosis gene expression in FPKM") + ggtitle("mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes")
bp + facet_grid(Main_category ~ .)
dev.off()
