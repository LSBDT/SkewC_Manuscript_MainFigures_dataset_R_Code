## 20190530
## Compute t-SNE from PRJDB5282 count table for Good AND Skewed single-cells
mm9_PRJDB5282_count_mereged_TSNE <- mm9_PRJDB5282_Count_mereged
row.names(mm9_PRJDB5282_count_mereged_TSNE) <- mm9_PRJDB5282_Count_mereged$Gene
mm9_PRJDB5282_count_mereged_TSNE$Gene <- NULL
####
PRJDB5282_columnAnnotationGood_cells <- subset(PRJDB5282_columnAnnotation,covGroup =='Good_cells')
PRJDB5282_columnAnnotationSkewed_coverage_cells <- subset(PRJDB5282_columnAnnotation,covGroup =='Skewed_coverage_cells')
##PRJDB5282_columnAnnotationTrimmed_cells <- subset(PRJDB5282_columnAnnotation,covGroup =='Trimmed_cells')

###
library(dplyr)
mm9_PRJDB5282_count_mereged_TSNE_DDDD <-  mm9_PRJDB5282_count_mereged_TSNE %>% select(one_of(as.character(rownames(PRJDB5282_columnAnnotation))))
mm9_PRJDB5282_count_mereged_TSNE_DDDDGood_cells <- mm9_PRJDB5282_count_mereged_TSNE %>% select(one_of(as.character(rownames(PRJDB5282_columnAnnotationGood_cells))))
mm9_PRJDB5282_count_mereged_TSNE_DDDDSkewed_coverage_cells <- mm9_PRJDB5282_count_mereged_TSNE %>% select(one_of(as.character(rownames(PRJDB5282_columnAnnotationSkewed_coverage_cells))))
mm9_PRJDB5282_count_mereged_TSNE_DDDD <- cbind(mm9_PRJDB5282_count_mereged_TSNE_DDDDGood_cells,mm9_PRJDB5282_count_mereged_TSNE_DDDDSkewed_coverage_cells)
######### 
matGoodSkewed <- log10(as.matrix(mm9_PRJDB5282_count_mereged_TSNE_DDDD)+1)
library(Rtsne)
d <- dist(t(matGoodSkewed))
set.seed(0) # tsne has some stochastic steps (gradient descent) so need to set random 
tsne_out <- Rtsne(d,is_distance = T,perplexity=5,verbose=T) 
