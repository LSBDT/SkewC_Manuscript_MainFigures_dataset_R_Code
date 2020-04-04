## 20190530
## Compute t-SNE from E-MTAB-2600 count table for Good AND Skewed single-cells
mm10_EMTAB_2600_count_mereged_TSNE <- mm10_EMTAB_2600_count_mereged
row.names(mm10_EMTAB_2600_count_mereged_TSNE) <- mm10_EMTAB_2600_count_mereged$Gene
mm10_EMTAB_2600_count_mereged_TSNE$Gene <- NULL
####
E_MTAB_2600_columnAnnotationGood_cells <- subset(E_MTAB_2600_columnAnnotation,covGroup =='Good_cells')
E_MTAB_2600_columnAnnotationSkewed_coverage_cells <- subset(E_MTAB_2600_columnAnnotation,covGroup =='Skewed_coverage_cells')
##E_MTAB_2600_columnAnnotationTrimmed_cells <- subset(E_MTAB_2600_columnAnnotation,covGroup =='Trimmed_cells')

###
library(dplyr)
mm10_EMTAB_2600_count_mereged_TSNE_DDDD <- mm10_EMTAB_2600_count_mereged_TSNE %>% select(one_of(as.character(mm10_EMTAB_2600_metadata_processd_2$cell_id)))
mm10_EMTAB_2600_count_mereged_TSNE_DDDDGood_cells <- mm10_EMTAB_2600_count_mereged_TSNE %>% select(one_of(as.character(rownames(E_MTAB_2600_columnAnnotationGood_cells))))
mm10_EMTAB_2600_count_mereged_TSNE_DDDDSkewed_coverage_cells <- mm10_EMTAB_2600_count_mereged_TSNE %>% select(one_of(as.character(rownames(E_MTAB_2600_columnAnnotationSkewed_coverage_cells))))
######### 
matGoodSkewed <- log10(as.matrix(mm10_EMTAB_2600_count_mereged_TSNE_DDDD)+1)
library(Rtsne)
d <- dist(t(matGoodSkewed))
set.seed(1) # tsne has some stochastic steps (gradient descent) so need to set random 
prep<- as.integer((nrow(E_MTAB_2600_columnAnnotationGood_cells)-1)/3)
tsne_out <- Rtsne(d, is_distance=TRUE, perplexity=prep, verbose = TRUE) 
plot(tsne_out$Y,  pch=16, main='tSNE')
