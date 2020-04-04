## 20190527
## Plotting house keeping gene between different cells
## Selected genes with padjuted value
housekeepingGenesx <- subset(mm10_GSE98664_fpkm_mereged,Gene=='B2m' |Gene=='Ywhaz'
                             | Gene=='Gapdh'| Gene=='Sdha')
housekeepingGenesGapdhActb <- housekeepingGenesx
rownames(housekeepingGenesGapdhActb) <- housekeepingGenesGapdhActb$Gene
housekeepingGenesGapdhActb$Gene <- NULL
####
GSE98664_columnAnnotationGood_cells <- subset(GSE98664_columnAnnotation,covGroup =='Good_cells')
GSE98664_columnAnnotationSkewed_coverage_cells <- subset(GSE98664_columnAnnotation,covGroup =='Skewed_coverage_cells')
##GSE98664_columnAnnotationTrimmed_cells <- subset(GSE98664_columnAnnotation,covGroup =='Trimmed_cells')

###
library(dplyr)
housekeepingGenes_DDDD <- housekeepingGenesGapdhActb %>% select(one_of(as.character(rownames(GSE98664_columnAnnotation))))
housekeepingGenes_DDDDGood_cells <- housekeepingGenesGapdhActb %>% select(one_of(as.character(rownames(GSE98664_columnAnnotationGood_cells))))
housekeepingGenes_DDDDSkewed_coverage_cells <- housekeepingGenesGapdhActb %>% select(one_of(as.character(rownames(GSE98664_columnAnnotationSkewed_coverage_cells))))
##housekeepingGenes_DDDDTrimmed_cells <- housekeepingGenesGapdhActb %>% select(one_of(as.character(rownames(GSE98664_columnAnnotationTrimmed_cells))))

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
## boxplot 
library(ggplot2)
q <- ggplot(rbindAll, aes(annotation, logvalue,fill=annotation)) + 
  stat_boxplot(geom = 'errorbar',width=0.2)+ 
  geom_boxplot(alpha=1) +
  scale_fill_brewer(palette="Greys")+ geom_jitter(width = 0.1,alpha=0.1) +
  theme(legend.direction="horizontal",legend.position="bottom",
        legend.box = "vertical",legend.title=element_blank(),legend.text=element_text(family="Times",face="bold", size=16))+
  facet_wrap(~Var1, scales="fixed",nrow = 1)+
  theme(strip.text.x = element_text(size = 12, colour = "black",face="bold",family="Times")) +
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.text.y = element_text(face="bold", color="black",size=12)) +
  ggtitle("GSE98664:\nNormalized expression of housekeeping genes") +
  theme(plot.title=element_text(family="Times", face="bold", size=14))+
  theme(axis.title=element_text(size=12,face="bold")) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(panel.background = element_rect(colour = 'black', fill = 'white', size = .75, linetype='solid'))
q <- q + labs(y = "log2(gene expression\nFPKM) ")
q <- q + scale_y_continuous(labels = scales::number_format(accuracy = 0.1))
 q <- q + annotate(geom="text",x=1.5, y=15, label="Adj. P-value <.001",
              color="black",size = 3.5,fontface=3,family="Arial")
png(filename = "HouseKeepingGenes/GSE98664_v3.png", width = 700,height = 500,res = 110)
q
dev.off()
