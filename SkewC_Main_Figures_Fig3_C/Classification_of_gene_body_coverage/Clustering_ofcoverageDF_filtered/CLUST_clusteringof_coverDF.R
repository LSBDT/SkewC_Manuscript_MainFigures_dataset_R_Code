library(tclust)
hg38_10x_PBMCCoverage_means_DF_Clustering <- hg38_10x_PBMCCoverage_means_DF
row.names(hg38_10x_PBMCCoverage_means_DF_Clustering) <- hg38_10x_PBMCCoverage_means_DF_Clustering$Annotation
hg38_10x_PBMCCoverage_means_DF_Clustering$Annotation <- NULL
clus <- tclust (hg38_10x_PBMCCoverage_means_DF_Clustering, k = 1,alpha =  0.14,
                restr.fact = 1,  restr = "eigen",equal.weights = TRUE)
clus$size
pdf("./Classification_of_gene_body_coverage/Clustering_ofcoverageDF_filtered/10x_hg38_PBMC_CLUSTResult.pdf")
plot(clus,main = list("Human PBMC: 10x chomimum \nGene coverage clusters", cex = 1.5,
                      col = "black", font = 2))
box(lty = "solid", col = 'black',lwd=3)
axis(side=1,lwd=2,lwd.ticks=4,col.ticks="black")
axis(side=2,lwd=3,lwd.ticks=4,col.ticks="black")
dev.off()

clusoutdf <- as.data.frame(clus$cluster) 
hg38_10x_PBMCCoverage_means_DF_ClusteringBINF <- cbind(hg38_10x_PBMCCoverage_means_DF_Clustering,clus$cluster)
hg38_10x_PBMC_GoodCells_cellID <- subset(hg38_10x_PBMCCoverage_means_DF_ClusteringBINF,hg38_10x_PBMCCoverage_means_DF_ClusteringBINF$`clus$cluster`==1)
write.table(row.names(hg38_10x_PBMC_GoodCells_cellID),file = "Classification_of_gene_body_coverage/Clustering_ofcoverageDF_filtered/hg38_10x_PBMC_GoodCells_cellID.txt",sep = "\t",row.names = F,quote = F,col.names = F)
hg38_10x_PBMC_Skewed_coverage_cellID <- subset(hg38_10x_PBMCCoverage_means_DF_ClusteringBINF,hg38_10x_PBMCCoverage_means_DF_ClusteringBINF$`clus$cluster`==0)
write.table(row.names(hg38_10x_PBMC_Skewed_coverage_cellID),file = "Classification_of_gene_body_coverage/Clustering_ofcoverageDF_filtered/hg38_10x_PBMC_Skewed_coverage_cellID.txt",sep = "\t",row.names = F,quote = F,col.names = F)