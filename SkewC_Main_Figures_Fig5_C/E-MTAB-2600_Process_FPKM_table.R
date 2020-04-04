## 20181220
##Read all E-MTAB-2600 fpkm.table and create data frames 
mm10_EMTAB_2600_FPKM <- read.table("../fpkm.table",sep="\t", header=TRUE, row.names =NULL)  
mm10_EMTAB_2600_FPKM_V2 <-
  mm10_EMTAB_2600_FPKM %>% select(one_of(dput(mm10_EMTAB_2600_metadata_processd$Comment.ENA_RUN.)))

## This script create the Gene table 
require(biomaRt)
library(stringr)
mm10_annot.table_count <- mm10_EMTAB_2600_FPKM
mm10_annot.table_count$id <- str_replace(mm10_annot.table_count$id,pattern = ".[0-9]+$",replacement = "")
# This is your annotation table (expression table), it can't be NULL # Collect ensembl IDs from annot.table before converting to normal gene names.
# Prepare gene table with some simple caching to avoid stressing the Ensembl server by many repeated runs
genes.table = NULL
if (!file.exists("cache.genes.table")){
  message("Retrieving genes table from Ensembl...")
  ## listDatasets(mart)
  mart <- useMart("ensembl") #listDatasets(mart=mart)
  mart <- useDataset("mmusculus_gene_ensembl", mart = mart)
  #mart <- useDataset("hsapiens_gene_ensembl", mart = mart)
  
  genes.table <- getBM(filters= "ensembl_gene_id",attributes= c("ensembl_gene_id","external_gene_name"), values= mm10_annot.table_count$id, mart= mart)
  save(genes.table, file= "cache.genes.table")
} else {
  load("cache.genes.table")
  message("Reading gene annotation information from cache file: cache/cache.genes.table
          Remove the file if you want to force retrieving data from Ensembl")
}
colnames(genes.table)[1] <- "id"

######### Merege genes.table & 
mm10_EMTAB_2600_FPKM_mereged <-merge(mm10_annot.table_count,genes.table,by="id")
mm10_EMTAB_2600_FPKM_mereged$id <- NULL
names(mm10_EMTAB_2600_FPKM_mereged)[870] <- "Gene"
library(plyr)
mm10_EMTAB_2600_FPKM_meregedz <- ddply(mm10_EMTAB_2600_FPKM_mereged, "Gene", numcolwise(sum))
mm10_EMTAB_2600_FPKM_mereged <- mm10_EMTAB_2600_FPKM_meregedz
rm(mm10_EMTAB_2600_FPKM_meregedz)
########## Select apoptises genes (Create new exp table)
### select apoptosis markers
library(dplyr)
mm_apoptosis_categorized_gene <- 
  readRDS(file = "/analysisdata/singlecell-db/apoptosis_gene_markers/mm_apoptosis_categorized_gene.rds")
mm_apoptosis_genes <- as.character(mm_apoptosis_categorized_gene$Gene)

mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes <-
  subset(mm10_EMTAB_2600_FPKM_mereged, Gene %in% mm_apoptosis_genes)

mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genesz <- ddply(mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes, "Gene", numcolwise(sum))
mm10_EMTAB_2600_FPKM_mereged_Apoptosis <- mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genesz
row.names(mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genesz) <- mm10_EMTAB_2600_FPKM_mereged_Apoptosis[,1]
rm(mm10_EMTAB_2600_FPKM_mereged_Apoptosis)
mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes <- mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genesz
rm(mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genesz)
mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes$Gene <- NULL
mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_V2 <- mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes
mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_V2 <-
  mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes %>% dplyr::select(one_of(dput(as.character(mm10_EMTAB_2600_metadata_processd$Comment.ENA_RUN.))))
mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes <- mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_V2
rm(mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_V2)
