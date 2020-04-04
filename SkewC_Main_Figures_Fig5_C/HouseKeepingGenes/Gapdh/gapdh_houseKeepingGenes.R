## 20190401
## Plotting house keeping gene between different cells
housekeepingGenes1 <- subset(mm10_EMTAB_2600_FPKM_mereged,Gene=='Gapdh')
housekeepingGenesGapdh <- housekeepingGenes1
rownames(housekeepingGenesGapdh) <- housekeepingGenesGapdh$Gene
housekeepingGenesGapdh$Gene <- NULL

###
library(dplyr)
housekeepingGenes_DDDDGapdh <- housekeepingGenes %>% select(one_of(as.character(rownames(E_MTE_MTAB_2600_columnAnnotation))))
housekeepingGenes_DDDDGapdh_3Prime <- housekeepingGenes %>% select(one_of(as.character(rownames(E_MTE_MTAB_2600_columnAnnotation3Prime))))
housekeepingGenes_DDDDGapdh_5Prime <- housekeepingGenes %>% select(one_of(as.character(rownames(E_MTE_MTAB_2600_columnAnnotation5Prime))))
housekeepingGenes_DDDDGapdh_LowCov <- housekeepingGenes %>% select(one_of(as.character(rownames(E_MTE_MTAB_2600_columnAnnotationLowCov))))

### 
library(reshape2)
MeltedhousekeepingGenes_DDDDGapdh_LowCov <- melt(housekeepingGenes_DDDDGapdh_LowCov)
MeltedhousekeepingGenes_DDDDGapdh_LowCov$annotation <- 'low_gene_coverage' 
MeltedhousekeepingGenes_DDDDGapdh_5Prime <- melt(housekeepingGenes_DDDDGapdh_5Prime)
MeltedhousekeepingGenes_DDDDGapdh_5Prime$annotation <- 'high_5`end_gene_coverage'
MeltedhousekeepingGenes_DDDDGapdh_3Prime <- melt(housekeepingGenes_DDDDGapdh_3Prime)
MeltedhousekeepingGenes_DDDDGapdh_3Prime$annotation <- 'high_3`end_gene_coverage'
rbindAllGapdh <- rbind(MeltedhousekeepingGenes_DDDDGapdh_LowCov,MeltedhousekeepingGenes_DDDDGapdh_3Prime,
                   MeltedhousekeepingGenes_DDDDGapdh_5Prime)
rbindAllGapdh$logvalue <- log2(rbindAllGapdh$value)
## boxplot of GAPDH
q <- ggplot(rbindAllGapdh, aes(annotation, logvalue)) + stat_boxplot(geom = 'errorbar',width=0.2)+ geom_boxplot() + geom_jitter(width = 0.1,alpha=0.4) + theme_bw()+ 
  theme(axis.text.x = element_text(face="bold", color="black", 
                                   size=12,angle=90),
        axis.text.y = element_text(face="bold", color="black", 
                                   size=12)) +
  ggtitle("E-MTAB-2600:\nNormalized Expression of GAPDH") +
  theme(plot.title=element_text(family="Times", face="bold", size=18))+
  theme(axis.title=element_text(size=16,face="bold")) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(panel.background = element_rect(colour = 'black', fill = 'white', size = 1, linetype='solid'))

q <- q + labs(x = "Gene coverage", y = "log2(gene expression\nFPKM) ")
png(filename = "HouseKeepingGenes/Gapdh/emtab2600_gapdh.png", width = 600,height = 600,res = 100)
q
dev.off()

