## 20190530
## Compute t-SNE from E-MTAB-2805 count table for Good single-cells
mm10_GSE98664_count_mereged_TSNE <- mm10_GSE98644_count_mereged
row.names(mm10_GSE98664_count_mereged_TSNE) <- mm10_GSE98644_count_mereged$Gene
mm10_GSE98664_count_mereged_TSNE$Gene <- NULL
####
mm9_PRJDB5282_count_mereged_TSNE_DDDDGood_cells <- mm9_PRJDB5282_count_mereged_TSNE %>% select(one_of(as.character(rownames(PRJDB5282_columnAnnotationGood_cells))))
###
library(dplyr)
mm9_PRJDB5282_count_mereged_TSNE_DDDDGood_cells <- mm9_PRJDB5282_count_mereged_TSNE %>% select(one_of(as.character(rownames(PRJDB5282_columnAnnotationGood_cells))))
######### 
matGood <- log10(as.matrix(mm9_PRJDB5282_count_mereged_TSNE_DDDDGood_cells)+1)
library(Rtsne)
dGood <- dist(t(matGood))
set.seed(0) # tsne has some stochastic steps (gradient descent) so need to set random 
tsne_outGood <- Rtsne(dGood, is_distance = T,perplexity=5,verbose=T) 
plot(tsne_outGood$Y,  pch=16, main='tSNE')
