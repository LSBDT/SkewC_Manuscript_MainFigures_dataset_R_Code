## ANOAVA test for E-MTAB-2600 (three Var2s)

E_MTAB_2600_columnAnnotationAnova <- E_MTAB_2600_columnAnnotation

E_MTAB_2600_columnAnnotationAnova$cellid <- rownames(E_MTAB_2600_columnAnnotationAnova)

cbdindAll<- cbind(housekeepingGenes_DDDDGood_cells,
                  housekeepingGenes_DDDDSkewed_coverage_cells,
                  housekeepingGenes_DDDDTrimmed_cells)

colnames(cbdindAll) <- E_MTAB_2600_columnAnnotationAnova$covGroup

E_MTAB_2600_columnAnnotationAnova$covVar2[match(names(cbdindAll),E_MTAB_2600_columnAnnotationAnova$covVar2)]

## subset cbdindAll
library(tidyverse)

cbdindAllGapdh <- subset(cbdindAll, row.names(cbdindAll)=="Gapdh")
cbdindAllActb <- subset(cbdindAll, row.names(cbdindAll)=="Actb")
cbdindAllB2m <- subset(cbdindAll, row.names(cbdindAll)=="B2m")
cbdindAllHprt <- subset(cbdindAll, row.names(cbdindAll)=="Hprt")
cbdindAllPpia <- subset(cbdindAll, row.names(cbdindAll)=="Ppia")
cbdindAllSdha <- subset(cbdindAll, row.names(cbdindAll)=="Sdha")
cbdindAllTbp <- subset(cbdindAll, row.names(cbdindAll)=="Tbp")
cbdindAllTfrc <- subset(cbdindAll, row.names(cbdindAll)=="Tfrc")
cbdindAllYwhaz <- subset(cbdindAll, row.names(cbdindAll)=="Ywhaz")
gsub("\\..*","",a)
names(cbdindAllGapdh) <- gsub(x = names(cbdindAllGapdh), pattern = "\\..*", replacement = "")
names(cbdindAllActb) <- gsub(x = names(cbdindAllActb), pattern = "\\..*", replacement = "") 
names(cbdindAllB2m) <- gsub(x = names(cbdindAllB2m), pattern = "\\..*", replacement = "") 
names(cbdindAllHprt) <- gsub(x = names(cbdindAllHprt), pattern = "\\..*", replacement = "") 
names(cbdindAllPpia) <- gsub(x = names(cbdindAllPpia), pattern = "\\..*", replacement = "") 
names(cbdindAllSdha) <- gsub(x = names(cbdindAllSdha), pattern = "\\..*", replacement = "") 
names(cbdindAllTbp) <- gsub(x = names(cbdindAllTbp), pattern = "\\..*", replacement = "") 
names(cbdindAllTfrc) <- gsub(x = names(cbdindAllTfrc), pattern = "\\..*", replacement = "") 
names(cbdindAllYwhaz) <- gsub(x = names(cbdindAllYwhaz), pattern = "\\..*", replacement = "") 

library(reshape2)
meltedcbdindAllGapdh <- melt(as.matrix(cbdindAllGapdh))
meltedcbdindAllYwhaz <- melt(as.matrix(cbdindAllYwhaz))
meltedcbdindAllTfrc <- melt(as.matrix(cbdindAllTfrc))
meltedcbdindAllTbp <- melt(as.matrix(cbdindAllTbp))
meltedcbdindAllSdha <- melt(as.matrix(cbdindAllSdha))
meltedcbdindAllPpia <- melt(as.matrix(cbdindAllPpia))
meltedcbdindAllHprt <- melt(as.matrix(cbdindAllHprt))
meltedcbdindAllB2m <- melt(as.matrix(cbdindAllB2m))
meltedcbdindAllActb <- melt(as.matrix(cbdindAllActb))

# Compute the analysis of variance
res.aovGapdh <- aov(value ~ Var2, data = meltedcbdindAllGapdh)
res.aovActb <- aov(value ~ Var2, data = meltedcbdindAllActb)
res.aovB2m <- aov(value ~ Var2, data = meltedcbdindAllB2m)
res.aovHprt <- aov(value ~ Var2, data = meltedcbdindAllHprt)
res.aovPpia <- aov(value ~ Var2, data = meltedcbdindAllPpia)
res.aovSdha <- aov(value ~ Var2, data = meltedcbdindAllSdha)
res.aovTbp <- aov(value ~ Var2, data = meltedcbdindAllTbp)
res.aovTfrc <- aov(value ~ Var2, data = meltedcbdindAllTfrc)
res.aovYwhaz <- aov(value ~ Var2, data = meltedcbdindAllYwhaz)

# Summary of the analysis
summary(res.aovB2m)
TukeyHSDGapdh <- TukeyHSD(res.aovGapdh)
TukeyHSDB2m   <- TukeyHSD(res.aovB2m)
TukeyHSDActb  <- TukeyHSD(res.aovActb)
TukeyHSDHprt  <- TukeyHSD(res.aovHprt)
TukeyHSDPpia  <- TukeyHSD(res.aovPpia)
TukeyHSDSdha  <- TukeyHSD(res.aovSdha)
TukeyHSDTbp   <- TukeyHSD(res.aovTbp)
TukeyHSDTfrc  <- TukeyHSD(res.aovTfrc)
TukeyHSDYwhaz <- TukeyHSD(res.aovYwhaz)

library(gdata)
TukeyHSDhousekeeping <- combine(TukeyHSDB2m$Var2,
                                TukeyHSDGapdh$Var2,
                                TukeyHSDActb$Var2,
                                TukeyHSDHprt$Var2,
                                TukeyHSDPpia$Var2,
                                TukeyHSDSdha$Var2,
                                TukeyHSDTbp$Var2,
                                TukeyHSDTfrc$Var2,
                                TukeyHSDYwhaz$Var2)
TukeyHSDhousekeepingDF <- TukeyHSDhousekeeping
TukeyHSDhousekeepingDF$source <- sub(pattern = "\\$Var2", replacement = "",TukeyHSDhousekeepingDF$source)
TukeyHSDhousekeepingDF$source <- sub(pattern = "\\TukeyHSD", replacement = "",TukeyHSDhousekeepingDF$source)
myvars <- names(TukeyHSDhousekeepingDF) %in% c("diff", "lwr", "upr") 
TukeyHSDhousekeepingDF_C <- TukeyHSDhousekeepingDF[!myvars]
names(TukeyHSDhousekeepingDF_C)[2] <- "Gene"
write.table(TukeyHSDhousekeepingDF_C,file = "/analysisdata/singlecell-db/expression/mm10/mm10_E-MTAB-2600/E-MTAB-2600_apoptosis_analysis/HouseKeepingGenes/stat_test/TukeyHSDhousekeepingDF_C.txt", sep = "\t",quote = F)
