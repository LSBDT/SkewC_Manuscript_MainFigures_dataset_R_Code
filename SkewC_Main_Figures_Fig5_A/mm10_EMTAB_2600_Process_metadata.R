### 20181220
### Preprocessing dpl 
library(dplyr)
mm10_EMTAB_2600_metadata_processd <- 
  mm10_EMTAB_2600_metadata %>% group_by(Comment.ENA_SAMPLE.) %>% slice(1L)
## read metadata rds from /analysisdata/singlecell-db/metadata 
sc_hg_mm_curated_metadata_V6 <-
  readRDS("/analysisdata/singlecell-db/metadata/sc_hg_mm_curated_metadata_V6.rds")
 mm10_GSE78779_metadata_v2 <-
   subset(sc_hg_mm_curated_metadata_V6,cell_id %in% mm10_EMTAB_2600_metadata_processd$Comment.ENA_RUN.)

##mm10_GSE78779_metadataz <- merge(mm10_GSE78779_metadata,GSE78779_metadata,by.x = "cell_id",by.y = "Run")
################################################################
## split cells by FactorValue.growth.condition.
# standard 2i media + LIF
 mm10_EMTAB_2600_metadata_processd_standard2imedia <-
   subset(mm10_EMTAB_2600_metadata_processd,FactorValue.growth.condition. =='standard 2i media + LIF')
 # alternative 2i media + LIF
 mm10_EMTAB_2600_metadata_processd_alternative2imedia <-
   subset(mm10_EMTAB_2600_metadata_processd,FactorValue.growth.condition. =='alternative 2i media + LIF')
 # serum + LIF
 mm10_EMTAB_2600_metadata_processd_serum <-
   subset(mm10_EMTAB_2600_metadata_processd,FactorValue.growth.condition. =='serum + LIF')
 
 
##########################################################
