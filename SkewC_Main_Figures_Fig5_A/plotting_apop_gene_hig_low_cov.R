mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_sub_high_inputread <- subset(mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_melted_row_sub,
                                                                          variable== "ERR523100" | variable=="ERR522921" |
                                                                          variable== "ERR522930"|variable== "ERR522952"|
                                                                            variable== "ERR523097"|variable== "ERR523064"|
                                                                            variable== "ERR522996"|variable== "ERR522822")
####
mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_sub_high_inputread <- subset(mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_melted_row_sub,
                                                                          variable== "ERR523143")
png(
  filename = "./E-MTAB-2600_boxplot_Test4.png",
  height = 600,
  width = 600,
  res = 110
)
p10 <- ggplot(mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_serum_melted ,aes(x=variable,y=value))+
  geom_boxplot(outlier.size = 0.1) +  coord_cartesian(ylim=c(0,1000)) + theme_bw()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1,size = 5))
p10 
dev.off()

mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_sub_high_cov <- subset(mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_melted_row_sub,
                                                                          variable== "ERR1211471" | variable=="ERR1211638" |
                                                                            variable== "ERR1211479" | variable== "ERR1211458")
png(
  filename = "./E-MTAB-2600_boxplot_Test24.png",
  height = 600,
  width = 600,
  res = 110
)
p10 <- ggplot(mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_sub_high_cov ,aes(x=variable,y=value))+
  geom_boxplot(outlier.size = 1)+  coord_cartesian(ylim=c(0,600)) + theme_bw()
p10
dev.off()
###################
mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_sub_high_inputread <- subset(mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_melted_row_sub,
                                                                          variable== "ERR1211471" | variable=="ERR1211638" |
                                                                          variable== "ERR1211479" | variable== "ERR1211458" |
                                                                          variable== "ERR523067" | variable== "ERR1211446")
png(
  filename = "./E-MTAB-2600_boxplot_Test6.png",
  height = 2000,
  width = 3600,
  res = 110
)
p10 <- ggplot(mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_melted ,aes(x=variable,y=value))+
  geom_boxplot(outlier.size = 0.01) +scale_y_continuous(trans = 'log10')
p10
dev.off()
#########################
png(
  filename = "./E-MTAB-2600_boxplot_Inductiion.png",
  height = 3500,
  width = 8000,
  res = 100
)
p10 <- ggplot(mm10_EMTAB_2600_FPKM_InductionofApoptosis ,aes(x=fct_reorder(variable,value,fun=median),y=value))+
  geom_boxplot(outlier.size = 0.1) +  coord_cartesian(ylim=c(0,1000)) + theme_bw()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1,size = 7))
p10 
dev.off()