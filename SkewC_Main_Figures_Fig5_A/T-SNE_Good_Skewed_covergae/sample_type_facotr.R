install.packages("scatterplot3d")
sampleid = c("RDhi10000","RDhi10001","RDhi10002","RDhi10003","RDhi10004","RDhi10005","RDhi10006","RDhi10007","RDhi10008","RDhi10009","RDhi10010","RDhi10011","RDhi10016","RDhi10013","RDhi10014","RDhi10015","RDhi10016","RDhi10017","RDhi10018","RDhi10019","RDhi10020","RDhi10051","RDhi10052","RDhi10053","RDhi10054","RDhi10055","RDhi10056","RDhi10057","RDhi10058","RDhi10059","RDhi10060","RDhi10061","RDhi10062","RDhi10063","RDhi10064","RDhi10065","RDhi10066","RDhi10067","RDhi10068","RDhi10069","RDhi10070","RDhi10071","RDhi10072","RDhi10073","RDhi10074","RDhi10075","RDhi10076","RDhi10077","RDhi10078","RDhi10079","RDhi10080","RDhi10081","RDhi10082","RDhi10083","RDhi10084","RDhi10085","RDhi10086","RDhi10087","RDhi10088","RDhi10089","RDhi10090","RDhi10091","RDhi10092","RDhi10093","RDhi10094","RDhi10095","RDhi10096","RDhi10097","RDhi10098","RDhi10099")
sampletype = c("Primary_cell","Primary_cell","Primary_cell","Primary_cell","Primary_cell","Primary_cell","Primary_cell","Primary_cell","Primary_cell","Primary_cell","Primary_cell","Primary_cell","Primary_cell","Primary_cell", "Primary_cell",	"Primary_cell","Primary_cell", "Primary_cell","Primary_cell","Primary_cell","Primary_cell",	"Primary_cell",	"Primary_cell",	"Primary_cell",	"Primary_cell","Tissue","Tissue","Tissue","Tissue","Tissue","Tissue","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Cell_line","Primary_cell","Primary_cell",	"Tissue","Tissue","Tissue","Tissue","Tissue") 

sg <- data.frame(sampleid,sampletype)
sample_coun <- read.table(file = "sample_coun.txt",header = T, sep = "\t")
sg <- sample_coun

library(scatterplot3d)
p2 <- scatterplot3d(x=tsne_out$Y[,1],y=tsne_out$Y[,2],z=tsne_out$Y[,2],color = c("red","green","blue")[sg$sampletype])
##png("FANTOM5_RNA_librarier_tSNE_3D.png"=90)
p2
dev.off()
 