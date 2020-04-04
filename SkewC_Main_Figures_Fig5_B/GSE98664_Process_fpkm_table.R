## 20181220
##Read all GSE98644 fpkm.table and create data frames 
mm10_GSE98644_fpkm <- fpkm.table

## This script create the Gene table 
require(biomaRt)
library(stringr)
mm10_annot.table_fpkm <- mm10_GSE98644_fpkm
row.names(mm10_annot.table_fpkm) <- str_replace(row.names(mm10_annot.table_fpkm),pattern = ".[0-9]+$",replacement = "")
# This is your annotation table (expression table), it can't be NULL # Collect ensembl IDs from annot.table before converting to normal gene names.
# Prepare gene table with some simple caching to avoid stressing the Ensembl server by many repeated runs
genes.table = NULL
if (!file.exists("cache.genes.table")){
  message("Retrieving genes table from Ensembl...")
  ## listDatasets(mart)
  mart <- useMart("ensembl") #listDatasets(mart=mart)
  mart <- useDataset("mmusculus_gene_ensembl", mart = mart)
  #mart <- useDataset("hsapiens_gene_ensembl", mart = mart)
  
  genes.table <- getBM(filters= "ensembl_gene_id",attributes= c("ensembl_gene_id","external_gene_name"), values= row.names(mm10_annot.table_fpkm), mart= mart)
  save(genes.table, file= "cache.genes.table")
} else {
  load("cache.genes.table")
  message("Reading gene annotation information from cache file: cache/cache.genes.table
          Remove the file if you want to force retrieving data from Ensembl")
}
colnames(genes.table)[1] <- "id"

######### Merege genes.table & 
mm10_GSE98644_fpkm_mereged <-merge(mm10_annot.table_fpkm,genes.table,by.x = 0,by.y = "id")
mm10_GSE98644_fpkm_mereged$Row.names <- NULL
names(mm10_GSE98644_fpkm_mereged)[365] <- "Gene"
library(plyr)
mm10_GSE98644_fpkm_meregedz <- ddply(mm10_GSE98644_fpkm_mereged, "Gene", numcolwise(sum))
mm10_GSE98644_fpkm_mereged <- mm10_GSE98644_fpkm_meregedz
rm(mm10_GSE98644_fpkm_meregedz)
########## Select apoptises genes (Create new exp table)
