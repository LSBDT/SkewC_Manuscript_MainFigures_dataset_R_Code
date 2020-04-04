# EMTAB_2600_FPKM_MVA_mean_SD_CV_clean_Com <- EMTAB_2600_FPKM_MVA_mean_SD_CV_clean
# EMTAB_2600_FPKM_MVA_mean_SD_CV_clean_Com$Dataset <- "E-MTAB-2600"
# EMTAB_2805_FPKM_MVA_mean_SD_CV_clean_Com <- EMTAB_2805_FPKM_MVA_mean_SD_CV_clean
# EMTAB_2805_FPKM_MVA_mean_SD_CV_clean_Com$Dataset <- "E-MTAB-2805"
# GSE29087_FPKM_MVA_mean_SD_CV_clean_Com<- GSE29087_FPKM_MVA_mean_SD_CV_clean
# GSE29087_FPKM_MVA_mean_SD_CV_clean_Com$Dataset <- "GSE29087"
# GSE42268_FPKM_MVA_mean_SD_CV_clean_Com <- GSE42268_FPKM_MVA_mean_SD_CV_clean
# GSE42268_FPKM_MVA_mean_SD_CV_clean_Com$Dataset <- "GSE42268"
# GSE46980_FPKM_MVA_mean_SD_CV_clean_Com<- GSE46980_FPKM_MVA_mean_SD_CV_clean
# GSE46980_FPKM_MVA_mean_SD_CV_clean_Com$Dataset <- "GSE46980"
# GSE53386_FPKM_MVA_mean_SD_CV_clean_Com<- GSE53386_FPKM_MVA_mean_SD_CV_clean
# GSE53386_FPKM_MVA_mean_SD_CV_clean_Com$Dataset <- "GSE53386"
# GSE54695_FPKM_MVA_mean_SD_CV_clean_Com <- GSE54695_FPKM_MVA_mean_SD_CV_clean
# GSE54695_FPKM_MVA_mean_SD_CV_clean_Com$Dataset <- "GSE54695"
# GSE98664_FPKM_MVA_mean_SD_CV_clean_Com<- GSE98664_FPKM_MVA_mean_SD_CV_clean
# GSE98664_FPKM_MVA_mean_SD_CV_clean_Com$Dataset <- "GSE98664"
# PRJDB5282_FPKM_MVA_mean_SD_CV_clean_Com<- PRJDB5282_FPKM_MVA_mean_SD_CV_clean
# PRJDB5282_FPKM_MVA_mean_SD_CV_clean_Com$Dataset <- "PRJDB5282"
# mES_FPKM_MVA_mean_SD_CV_clean_Com <- do.call(rbind, mget(ls(pattern="FPKM_MVA_mean_SD_CV_clean_Com")))
##### Plotting all mES

mES_FPKM_MVA_mean_SD_CV_clean_Com$seqeunce <-
  ifelse(
    mES_FPKM_MVA_mean_SD_CV_clean_Com$Dataset == 'E-MTAB-2600-SMARTer'|
      mES_FPKM_MVA_mean_SD_CV_clean_Com$Dataset == 'E-MTAB-2805-SMARTer'|
      mES_FPKM_MVA_mean_SD_CV_clean_Com$Dataset == 'GSE42268-Quartz-seq'|
      mES_FPKM_MVA_mean_SD_CV_clean_Com$Dataset == 'GSE53386-SUPer-seq'|
      mES_FPKM_MVA_mean_SD_CV_clean_Com$Dataset == 'GSE98664-Ram-DA', 'Full length sequence' ,
    ifelse(mES_FPKM_MVA_mean_SD_CV_clean_Com$Dataset == 'GSE29087-STRT','5`-end sequnce',
            ifelse(mES_FPKM_MVA_mean_SD_CV_clean_Com$Dataset == 'GSE46980-STRT','5`-end sequnce',
                    ifelse (mES_FPKM_MVA_mean_SD_CV_clean_Com$Dataset == 'PRJDB5282-C1 CAGE','5`-end sequnce','3`-end sequnce'))))
mES_FPKM_MVA_mean_SD_CV_clean_Com$sequence_f <- factor(mES_FPKM_MVA_mean_SD_CV_clean_Com$sequence,
                                                                         levels = c("Full length sequence","5`-end sequnce","3`-end sequnce"))                   
                    
q <- ggplot(mES_FPKM_MVA_mean_SD_CV_clean_Com, aes(x=Mean, y=CV,shape=Dataset,colour=Dataset)) + 
  geom_smooth(method="auto",se=T,size=0.75)+
  xlim(0,50)+ylim(0,10)+
  facet_wrap(.~sequence_f,nrow = 1)+
  theme(strip.text.x = element_text(size = 16, colour = "black",face="bold",family ="ArialMT")) +
  theme(strip.background  = element_rect(colour = "black",fill="gray97")) +
  theme(axis.text.y = element_text(color="black",size=16,hjust = 1),
        axis.text.x = element_text( color="black",size=16,hjust = 1)) +
  ggtitle("mES: CV / mean plot") +
  theme(plot.title=element_text(face="bold", size=20,family = "ArialMT"))+
  theme(axis.title.y=element_text(family = "ArialMT",size=16,face="bold")) +
  theme(axis.title.x=element_text(family = "ArialMT",size=16,face="bold")) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(
    panel.background = element_blank(),
    axis.line = element_line(color = "black"),
    panel.border = element_rect(
      colour = "black",
      fill = NA,
      size = 1.2
    )
  )+
theme(plot.title = element_text(face = "bold", colour="black", size = 18,family = "ArialMT"))+ 
theme(axis.ticks = element_line(colour = 'black',size = 1.2,linetype = 'dashed'))+
theme(axis.ticks.length=unit(.2, "cm"))+
theme(axis.title.x = element_text(colour="black", size=18,family = "ArialMT"))+ 
theme(axis.title.y = element_text(colour="black", size=18,family = "ArialMT"))+
theme(legend.title = element_text(face = "bold",colour="black", size=18,family = "ArialMT"))+
theme(legend.text = element_text(colour="black", size = 16,family = "ArialMT"))+
theme(axis.text = element_text(face = "bold", colour="red", size=12))+ 
theme(panel.border  = element_rect(colour = "black",fill = NA,size = 2.2),
      panel.background = element_rect(fill = NA))
# theme(plot.title = element_text(hjust = 0.5))+
q <- q + labs(y = "Coefficient of variation")
q <- q + labs(x = zz)+ theme(axis.title.x = element_text(family = "ArialMT", size=20))
pdf("./mm10_MS_mESC_Fig2_correlation_analysis/mES_MVA_Plot_v2.pdf", width =13,height =8)
q
dev.off()
