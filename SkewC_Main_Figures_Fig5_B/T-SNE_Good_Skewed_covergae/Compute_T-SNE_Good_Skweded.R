## 20190530
## Compute t-SNE from GSE98664 count table for Good AND Skewed single-cells
mm10_GSE98664_count_mereged_TSNE <- mm10_GSE98644_count_mereged
row.names(mm10_GSE98664_count_mereged_TSNE) <- mm10_GSE98644_count_mereged$Gene
mm10_GSE98664_count_mereged_TSNE$Gene <- NULL
####
GSE98664_columnAnnotationGood_cells <- subset(GSE98664_columnAnnotation,covGroup =='Good_cells')
GSE98664_columnAnnotationSkewed_coverage_cells <- subset(GSE98664_columnAnnotation,covGroup =='Skewed_coverage_cells')
##GSE98664_columnAnnotationTrimmed_cells <- subset(GSE98664_columnAnnotation,covGroup =='Trimmed_cells')

###
library(dplyr)
mm10_GSE98664_count_mereged_TSNE_DDDD <- mm10_GSE98664_count_mereged_TSNE %>% select(one_of(as.character(rownames(GSE98664_columnAnnotation))))
mm10_GSE98664_count_mereged_TSNE_DDDDGood_cells <- mm10_GSE98664_count_mereged_TSNE %>% select(one_of(as.character(rownames(GSE98664_columnAnnotationGood_cells))))
mm10_GSE98664_count_mereged_TSNE_DDDDSkewed_coverage_cells <- mm10_GSE98664_count_mereged_TSNE %>% select(one_of(as.character(rownames(GSE98664_columnAnnotationSkewed_coverage_cells))))
######### 
matGoodSkewed <- log10(as.matrix(mm10_GSE98664_count_mereged_TSNE_DDDD)+1)
library(Rtsne)
d <- dist(t(matGoodSkewed))
set.seed(0) # tsne has some stochastic steps (gradient descent) so need to set random 
tsne_out <- Rtsne(d,is_distance = T,perplexity=10,verbose=T) 
