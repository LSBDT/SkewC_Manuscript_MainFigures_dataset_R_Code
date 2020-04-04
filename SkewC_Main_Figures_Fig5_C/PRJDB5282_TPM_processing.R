## 20190513
## Process the tpm table and joint with the gene names
library(dplyr)
F5_CAGE_anno.GENCODEvM1.cage_cluster.info_rownames_geneNameStr <- 
  F5_CAGE_anno.GENCODEvM1.cage_cluster.info %>% select(8)
F5_CAGE_anno.GENCODEvM1.cage_cluster.info_rownames_geneNameStr_TPM <-
  merge(F5_CAGE_anno.GENCODEvM1.cage_cluster.info_rownames_geneNameStr,tpm,by = 0)
F5_CAGE_anno.GENCODEvM1.cage_cluster.info_rownames_geneNameStr_TPM$Row.names <- NULL
names(F5_CAGE_anno.GENCODEvM1.cage_cluster.info_rownames_geneNameStr_TPM)[1] <- "Gene"
mm9_PRJDB5282_TPM_mereged <- F5_CAGE_anno.GENCODEvM1.cage_cluster.info_rownames_geneNameStr_TPM
library(plyr)
mm9_PRJDB5282_TPM_meregedz <- ddply(mm9_PRJDB5282_TPM_mereged, "Gene", numcolwise(sum))
mm9_PRJDB5282_TPM_mereged <- mm9_PRJDB5282_TPM_meregedz
rm(mm9_PRJDB5282_TPM_meregedz)