## 20190401
## Plotting house keeping gene between different cells
housekeepingGenesx <- subset(mm10_EMTAB_2600_FPKM_mereged,Gene=='Gapdh' | Gene=='Actb' | Gene=='Hprt'
                             | Gene=='B2m' | Gene=='Sdha' | Gene=='Tfrc'| Gene=='Tbp'| Gene=='Ywhaz'| Gene=='Ppia')
housekeepingGenesGapdhActb <- housekeepingGenesx
rownames(housekeepingGenesGapdhActb) <- housekeepingGenesGapdhActb$Gene
housekeepingGenesGapdhActb$Gene <- NULL
####
E_MTAB_2600_columnAnnotationGood_cells <- subset(E_MTAB_2600_columnAnnotation,covGroup =='Good_cells')
E_MTAB_2600_columnAnnotationSkewed_coverage_cells <- subset(E_MTAB_2600_columnAnnotation,covGroup =='Skewed_coverage_cells')
##E_MTAB_2600_columnAnnotationTrimmed_cells <- subset(E_MTAB_2600_columnAnnotation,covGroup =='Trimmed_cells')

###
library(dplyr)
housekeepingGenes_DDDD <- housekeepingGenesGapdhActb %>% select(one_of(as.character(rownames(E_MTAB_2600_columnAnnotation))))
housekeepingGenes_DDDDGood_cells <- housekeepingGenesGapdhActb %>% select(one_of(as.character(rownames(E_MTAB_2600_columnAnnotationGood_cells))))
housekeepingGenes_DDDDSkewed_coverage_cells <- housekeepingGenesGapdhActb %>% select(one_of(as.character(rownames(E_MTAB_2600_columnAnnotationSkewed_coverage_cells))))
##housekeepingGenes_DDDDTrimmed_cells <- housekeepingGenesGapdhActb %>% select(one_of(as.character(rownames(E_MTAB_2600_columnAnnotationTrimmed_cells))))

### 
library(reshape2)
MeltedhousekeepingGenes_DDDDGood_cells <- melt(as.matrix(housekeepingGenes_DDDDGood_cells))
MeltedhousekeepingGenes_DDDDGood_cells$annotation <- 'Good cells' 
MeltedhousekeepingGenes_DDDDSkewed_coverage_cells <- melt(as.matrix(housekeepingGenes_DDDDSkewed_coverage_cells))
MeltedhousekeepingGenes_DDDDSkewed_coverage_cells$annotation <- 'Skewed coverage cells'
# MeltedhousekeepingGenes_DDDDTrimmed_cells <- melt(as.matrix(housekeepingGenes_DDDDTrimmed_cells))
# MeltedhousekeepingGenes_DDDDTrimmed_cells$annotation <- 'Trimmed_cells'

rbindAll <- rbind(MeltedhousekeepingGenes_DDDDSkewed_coverage_cells,
                  MeltedhousekeepingGenes_DDDDGood_cells)
                
#  ,
 #                 MeltedhousekeepingGenes_DDDDTrimmed_cells)
rbindAll$logvalue <- log2(rbindAll$value)
## boxplot of GAPDH
library(ggplot2)
q <- ggplot(rbindAll, aes(annotation, logvalue,fill=annotation)) + 
  stat_boxplot(geom = 'errorbar',width=0.2)+ 
  geom_boxplot(alpha=1) +
  scale_fill_brewer(palette="Greys")+ geom_jitter(width = 0.1,alpha=0.1) +
  theme(legend.direction="vertical",legend.position="right",
        legend.box = "vertical",legend.title=element_text(family="Times",
                                                          face="bold", size=12),legend.text=element_text(family="Times",face="bold", size=12))+
  facet_wrap(~Var1, scales="fixed")+
  theme(strip.text.x = element_text(size = 12, colour = "black",face="bold",family="Times")) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.text.y = element_text(face="bold", color="black",size=12)) +
  ggtitle("E-MTAB-2600:\nNormalized expression of housekeeping genes") +
  theme(plot.title=element_text(family="Times", face="bold", size=14))+
  theme(axis.title=element_text(size=12,face="bold")) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(panel.background = element_rect(colour = 'black', fill = 'white', size = .75, linetype='solid'))
q <- q + labs(y = "log2(gene expression\nFPKM) ")
q <- q + scale_y_continuous(labels = scales::number_format(accuracy = 0.1))
 q <- q + annotate(geom="text", x=0.9, y=15, label="P<.001",
             color="black",size = 4,fontface="italic")
png(filename = "HouseKeepingGenes//emtab2600.png", width = 700,height = 700,res = 100)
q
dev.off()
