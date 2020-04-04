## 20190530
## Compute t-SNE from E-MTAB-2600 count table for Good single-cells
mm10_EMTAB_2600_count_mereged_TSNE <- mm10_EMTAB_2600_count_mereged
row.names(mm10_EMTAB_2600_count_mereged_TSNE) <- mm10_EMTAB_2600_count_mereged$Gene
mm10_EMTAB_2600_count_mereged_TSNE$Gene <- NULL
####
##E_MTAB_2600_columnAnnotationGood_cells <- subset(E_MTAB_2600_columnAnnotation_2_Good =='Good_cells')
##E_MTAB_2600_columnAnnotationTrimmed_cells <- subset(E_MTAB_2600_columnAnnotation,covGroup =='Trimmed_cells')

###
library(dplyr)
mm10_EMTAB_2600_count_mereged_TSNE_DDDDGood_cells <- mm10_EMTAB_2600_count_mereged_TSNE %>% select(one_of(as.character(E_MTAB_2600_columnAnnotation_2_Good$cell_id)))
######### 
matGood <- log10(as.matrix(mm10_EMTAB_2600_count_mereged_TSNE_DDDDGood_cells)+1)
library(Rtsne)
dGood <- dist(t(matGood))
set.seed(1) # tsne has some stochastic steps (gradient descent) so need to set random 
prep<- as.integer((nrow(E_MTAB_2600_columnAnnotation_2_Good)-1)/3)
tsne_outGood <- Rtsne(dGood, is_distance=TRUE, perplexity=prep, verbose = TRUE) 
plot(tsne_outGood$Y,  pch=16, main='tSNE')
