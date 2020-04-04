library(tclust)
coverageDF_filtered_Clustering <- mm10_10x_PBMCCoverage_means_DF
row.names(coverageDF_filtered_Clustering) <- coverageDF_filtered_Clustering$Annotation
coverageDF_filtered_Clustering$Annotation <- NULL
clus <- tclust (coverageDF_filtered_Clustering, k = 1,alpha =  0.07,
                restr.fact = 1,  restr = "eigen",equal.weights = TRUE)
clus$size
pdf("./Classification_of_gene_body_coverage/Clustering_ofcoverageDF_filtered/10X_mm10_PBMC_CLUSTResult.pdf")
plot(clus,main = list("Mouse PBMC 10x chromium 5' end\nGene coverage clusters", cex = 1.5,
                      col = "black", font = 2))
box(lty = "solid", col = 'black',lwd=3)
axis(side=1,lwd=2,lwd.ticks=4,col.ticks="black")
axis(side=2,lwd=3,lwd.ticks=4,col.ticks="black")
dev.off()

clusoutdf <- as.data.frame(clus$cluster) 
coverageDF_filtered_ClusteringBINF <- cbind(coverageDF_filtered_Clustering,clus$cluster)
mm10_10x_PBMC_GoodCells_cellID <- subset(coverageDF_filtered_ClusteringBINF,coverageDF_filtered_ClusteringBINF$`clus$cluster`==1)
write.table(row.names(mm10_10x_PBMC_GoodCells_cellID),file = "Classification_of_gene_body_coverage/Clustering_ofcoverageDF_filtered/mm10_10x_PBMC_GoodCells_cellID.txt",sep = "\t",row.names = F,quote = F,col.names = F)
mm10_10x_PBMC_Skewed_coverage_cellID <- subset(coverageDF_filtered_ClusteringBINF,coverageDF_filtered_ClusteringBINF$`clus$cluster`==0)
write.table(row.names(mm10_10x_PBMC_Skewed_coverage_cellID),file = "Classification_of_gene_body_coverage/Clustering_ofcoverageDF_filtered/mm10_10x_PBMC_Skewed_coverage_cellID.txt",sep = "\t",row.names = F,quote = F,col.names = F)