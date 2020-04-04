## 20190513
## Process the Count table and joint with the gene names
library(dplyr)
F5_CAGE_anno.GENCODEvM1.cage_cluster.info_rownames_geneNameStr <- 
  F5_CAGE_anno.GENCODEvM1.cage_cluster.info %>% select(8)
F5_CAGE_anno.GENCODEvM1.cage_cluster.info_rownames_geneNameStr_Count <-
  merge(F5_CAGE_anno.GENCODEvM1.cage_cluster.info_rownames_geneNameStr,counts,by = 0)
F5_CAGE_anno.GENCODEvM1.cage_cluster.info_rownames_geneNameStr_Count$Row.names <- NULL
names(F5_CAGE_anno.GENCODEvM1.cage_cluster.info_rownames_geneNameStr_Count)[1] <- "Gene"
mm9_PRJDB5282_Count_mereged <- F5_CAGE_anno.GENCODEvM1.cage_cluster.info_rownames_geneNameStr_Count
library(plyr)
mm9_PRJDB5282_Count_meregedz <- ddply(mm9_PRJDB5282_Count_mereged, "Gene", numcolwise(sum))
mm9_PRJDB5282_Count_mereged <- mm9_PRJDB5282_Count_meregedz
rm(mm9_PRJDB5282_Count_meregedz)