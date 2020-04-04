library(tclust)
coverageDF_filtered_Clustering <- GSE46980Coverage_means_DF_R1_Live_cells
row.names(coverageDF_filtered_Clustering) <- coverageDF_filtered_Clustering$Annotation
coverageDF_filtered_Clustering$Annotation <- NULL
clus <- tclust (coverageDF_filtered_Clustering, k = 1,alpha = 0.55,
                restr.fact = 1,  restr = "eigen",equal.weights = TRUE)
clus$size
png(filename = "./Classification_of_gene_body_coverage/Clustering_ofcoverageDF_filtered/CLUSTResult.png",height = 500,width = 500,res = 100)
plot(clus,main = list("mES:GSE46980: STRT\nGene coverage clusters", cex = 1.5,
                      col = "black", font = 2))
box(lty = "solid", col = 'black',lwd=3)
axis(side=1,lwd=2,lwd.ticks=4,col.ticks="black")
axis(side=2,lwd=3,lwd.ticks=4,col.ticks="black")
dev.off()

clusoutdf <- as.data.frame(clus$cluster) 
coverageDF_filtered_ClusteringBINF <- cbind(coverageDF_filtered_Clustering,clus$cluster)
GSE46980_GoodCells_cellID <- subset(coverageDF_filtered_ClusteringBINF,coverageDF_filtered_ClusteringBINF$`clus$cluster`==1)
write.table(row.names(GSE46980_GoodCells_cellID),file = "Classification_of_gene_body_coverage/Clustering_ofcoverageDF_filtered/GSE46980_GoodCells_cellID.txt",sep = "\t",row.names = F,quote = F,col.names = F)
GSE46980_Skewed_coverage_cellID <- subset(coverageDF_filtered_ClusteringBINF,coverageDF_filtered_ClusteringBINF$`clus$cluster`==0)
write.table(row.names(GSE46980_Skewed_coverage_cellID),file = "Classification_of_gene_body_coverage/Clustering_ofcoverageDF_filtered/GSE46980_Skewed_coverage_cellID.txt",sep = "\t",row.names = F,quote = F,col.names = F)