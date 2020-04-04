###############3
##2018-03-27
cd <- read.table(file = "RNA_fantomcat_masked_counts_summary.txt", header = T,sep = "\t", row.names = 1)
cd$Length <- NULL
dim(cd)
cd[1:5,1:5]
#cd <- cd[, colSums(cd>0)>1.8e3]
#cd <- cd[rowSums(cd)>10, ]
#cd <- cd[rowSums(cd>0)>5, ]
dim(cd)
mat <- log10(as.matrix(cd)+1)
# look at snippet of data
mat[1:5, 1:5]

head(sg, 5)
base.pca <- prcomp(t(mat))
plot(base.pca$x[,1], base.pca$x[,2], col=sg$sampletype, pch=16, main='PCA')
install.packages("Rtsne")
library(Rtsne)
d <- dist(t(mat))
set.seed(1) # tsne has some stochastic steps (gradient descent) so need to set random 
tsne_out <- Rtsne(d, is_distance=TRUE, perplexity=15, verbose = TRUE) 
plot(tsne_out$Y, col=sg$sampletype, pch=16, main='tSNE')

