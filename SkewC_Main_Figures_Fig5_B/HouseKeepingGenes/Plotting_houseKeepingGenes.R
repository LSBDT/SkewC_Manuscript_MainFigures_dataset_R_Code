## 20190401
## Plotting house keeping gene between different cells
housekeepingGenes1 <- subset(mm10_EMTAB_2600_FPKM_mereged,Gene=='Gapdh')
housekeepingGenes <- housekeepingGenes1
rownames(housekeepingGenes) <- housekeepingGenes$Gene
housekeepingGenes$Gene <- NULL

###
library(dplyr)
housekeepingGenes_DDDD <- housekeepingGenes %>% select(one_of(as.character(rownames(E_MTE_MTAB_2600_columnAnnotation))))
housekeepingGenes_DDDD_3Prime <- housekeepingGenes %>% select(one_of(as.character(rownames(E_MTE_MTAB_2600_columnAnnotation3Prime))))
housekeepingGenes_DDDD_5Prime <- housekeepingGenes %>% select(one_of(as.character(rownames(E_MTE_MTAB_2600_columnAnnotation5Prime))))
housekeepingGenes_DDDD_LowCov <- housekeepingGenes %>% select(one_of(as.character(rownames(E_MTE_MTAB_2600_columnAnnotationLowCov))))
#### row mean of the gene
housekeepingGenes_DDDD_LowCov$Rmean <- rowMeans(housekeepingGenes_DDDD_LowCov)
housekeepingGenes_DDDD_5Prime$Rmean <- rowMeans(housekeepingGenes_DDDD_5Prime)
housekeepingGenes_DDDD_3Prime$Rmean <- rowMeans(housekeepingGenes_DDDD_3Prime)
### 
library(reshape2)
MeltedhousekeepingGenes_DDDD_LowCov <- melt(housekeepingGenes_DDDD_LowCov)
MeltedhousekeepingGenes_DDDD_LowCov$annotation <- 'lowCoverage' 
MeltedhousekeepingGenes_DDDD_5Prime <- melt(housekeepingGenes_DDDD_5Prime)
MeltedhousekeepingGenes_DDDD_5Prime$annotation <- 'hig5prime'
MeltedhousekeepingGenes_DDDD_3Prime <- melt(housekeepingGenes_DDDD_3Prime)
MeltedhousekeepingGenes_DDDD_3Prime$annotation <- 'hig3prime'
rbdindAll <- rbind(MeltedhousekeepingGenes_DDDD_LowCov,MeltedhousekeepingGenes_DDDD_3Prime,
                   MeltedhousekeepingGenes_DDDD_5Prime)