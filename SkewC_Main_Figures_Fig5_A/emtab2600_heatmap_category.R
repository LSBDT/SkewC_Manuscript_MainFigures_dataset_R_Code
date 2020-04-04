[1] "Abl1"      "Aifm1"     "Akt1"      "Anxa5"     "Apaf1"     "Api5"      "Atf5"      "Bad"       "Bag1"      "Bag3"     
[11] "Bak1"      "Bax"       "Bcl10"     "Bcl2"      "Bcl2a1a"   "Bcl2l1"    "Bcl2l10"   "Bcl2l11"   "Bcl2l2"    "Bid"      
[21] "Birc2"     "Birc3"     "Birc5"     "Bnip2"     "Bnip3"     "Bnip3l"    "Bok"       "Card10"    "Casp1"     "Casp12"   
[31] "Casp14"    "Casp2"     "Casp3"     "Casp4"     "Casp6"     "Casp7"     "Casp8"     "Casp9"     "Cd40"      "Cd40lg"   
[41] "Cd70"      "Cflar"     "Cidea"     "Cideb"     "Cradd"     "Dad1"      "Dapk1"     "Dffa"      "Dffb"      "Diablo"   
[51] "Fadd"      "Fas"       "Fasl"      "Gadd45a"   "Igf1r"     "Il10"      "Lhx4"      "Ltbr"      "Mapk1"     "Mcl1"     
[61] "Naip1"     "Naip2"     "Nfkb1"     "Nme5"      "Nod1"      "Nol3"      "Polb"      "Prdx2"     "Pycard"    "Ripk1"    
[71] "Tnf"       "Tnfrsf10b" "Tnfrsf11b" "Tnfrsf1a"  "Tnfsf10"   "Tnfsf12"   "Traf1"     "Traf2"     "Traf3"     "Trp53"    
[81] "Trp53bp2"  "Trp63"     "Trp73"     "Xiap"     



mydf <- data.frame(row.names = paste(rownames(mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_serumC), sep="_"), category = c(rep("Pro-Apoptosis",3),rep("Anti-Apoptosis",2),rep("Pro-Apoptosis",1),rep("Anti-Apoptosis",2)))
mydf <- data.frame(row.names = paste(rownames(mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_serumC)))
mydfrow <- as.data.frame(rownames(mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_serumC))
mydf2 <- as.data.frame(subset(mm_apoptosis_categorized_gene_v2,mm_apoptosis_categorized_gene_v2$Gene %in% rownames(mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_serumC)))
rownames(mydf22) <- mydf22$Gene
mydf22$Gene <- NULL

mydf <- category= c(mm_apoptosis_categorized_gene_v2)
rownames(mm_apoptosis_categorized_gene_v2) <- rownames(mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_serumC)
library(pheatmap)
library(RColorBrewer)
pheatmap(mm10_EMTAB_2600_FPKM_mereged_Apoptosis_genes_standard2imediaC, annotation_row = mydf22, cellheight = 5, cellwidth = 10, file = "TEST5.png")
