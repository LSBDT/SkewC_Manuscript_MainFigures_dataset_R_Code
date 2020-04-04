## 20190401
## Plotting house keeping gene between different cells
housekeepingGenes2 <- subset(mm10_EMTAB_2600_FPKM_mereged,Gene=='Actb')
housekeepingGenesActb <- housekeepingGenes2
rownames(housekeepingGenesActb) <- housekeepingGenesActb$Gene
housekeepingGenesActb$Gene <- NULL

###
library(dplyr)
housekeepingGenes_DDDDActb <- housekeepingGenes %>% select(one_of(as.character(rownames(E_MTE_MTAB_2600_columnAnnotation))))
housekeepingGenes_DDDDActb_3Prime <- housekeepingGenes %>% select(one_of(as.character(rownames(E_MTE_MTAB_2600_columnAnnotation3Prime))))
housekeepingGenes_DDDDActb_5Prime <- housekeepingGenes %>% select(one_of(as.character(rownames(E_MTE_MTAB_2600_columnAnnotation5Prime))))
housekeepingGenes_DDDDActb_LowCov <- housekeepingGenes %>% select(one_of(as.character(rownames(E_MTE_MTAB_2600_columnAnnotationLowCov))))

### 
library(reshape2)
MeltedhousekeepingGenes_DDDDActb_LowCov <- melt(housekeepingGenes_DDDDActb_LowCov)
MeltedhousekeepingGenes_DDDDActb_LowCov$annotation <- 'low_gene_coverage' 
MeltedhousekeepingGenes_DDDDActb_5Prime <- melt(housekeepingGenes_DDDDActb_5Prime)
MeltedhousekeepingGenes_DDDDActb_5Prime$annotation <- 'high_5`end_gene_coverage'
MeltedhousekeepingGenes_DDDDActb_3Prime <- melt(housekeepingGenes_DDDDActb_3Prime)
MeltedhousekeepingGenes_DDDDActb_3Prime$annotation <- 'high_3`end_gene_coverage'
rbindAllActb <- rbind(MeltedhousekeepingGenes_DDDDActb_LowCov,MeltedhousekeepingGenes_DDDDActb_3Prime,
                   MeltedhousekeepingGenes_DDDDActb_5Prime)
rbindAllActb$logvalue <- log2(rbindAllActb$value)
## boxplot of Actb
v <- ggplot(rbindAllActb, aes(annotation, logvalue)) + stat_boxplot(geom = 'errorbar',width=0.2)+ geom_boxplot() + geom_jitter(width = 0.1,alpha=0.4) + theme_bw()+ 
  theme(axis.text.x = element_text(face="bold", color="black", 
                                   size=12,angle=90),
        axis.text.y = element_text(face="bold", color="black", 
                                   size=12)) +
  ggtitle("E-MTAB-2600:\nNormalized Expression of Actb") +
  theme(plot.title=element_text(family="Times", face="bold", size=18))+
  theme(axis.title=element_text(size=16,face="bold")) +
  theme(plot.title = element_text(hjust = 0.5))+
  theme(panel.background = element_rect(colour = 'black', fill = 'white', size = 1, linetype='solid'))

v <- v + labs(x = "Gene coverage", y = "log2(gene expression\nFPKM) ")

png(filename = "HouseKeepingGenes/Actb/emtab2600_Actb.png", width = 600,height = 600,res = 100)
v
dev.off()

