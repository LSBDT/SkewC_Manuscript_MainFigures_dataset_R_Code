## 2019-07-04
## MVA plotting from FPKM values for all cells
library(ggplot2)
GSE29087_FPKM_MVA <- mm10_GSE29087_FPKM_mereged
row.names(GSE29087_FPKM_MVA) <- GSE29087_FPKM_MVA$Gene
GSE29087_FPKM_MVA$Gene <- NULL
##GSE29087_FPKM_MVA <- GSE29087_FPKM_MVA[rowSums(GSE29087_FPKM_MVA)>=1,]
############
GSE29087_FPKM_MVA <- GSE29087_FPKM_MVA
GSE29087_FPKM_MVA_mean <- as.data.frame(apply(GSE29087_FPKM_MVA,1,mean))
names(GSE29087_FPKM_MVA_mean)[1] <- 'Mean'
GSE29087_FPKM_MVA_SD <- as.data.frame(apply(GSE29087_FPKM_MVA,1,sd))
names(GSE29087_FPKM_MVA_SD)[1] <- "SD"
GSE29087_FPKM_MVA_mean_SD_CV <- cbind(GSE29087_FPKM_MVA_mean,GSE29087_FPKM_MVA_SD)
############ Filtering NaN and -Inf
nrow(GSE29087_FPKM_MVA_mean_SD_CV[is.nan(GSE29087_FPKM_MVA_mean_SD_CV$CV),])
nrow(GSE29087_FPKM_MVA_mean_SD_CV[is.infinite(GSE29087_FPKM_MVA_mean_SD_CV$Mean),])
row.has.na <- apply(GSE29087_FPKM_MVA_mean_SD_CV, 1, function(x){any(is.na(x))})
sum(row.has.na)
GSE29087_FPKM_MVA_mean_SD_CV <- GSE29087_FPKM_MVA_mean_SD_CV[!row.has.na,]
GSE29087_FPKM_MVA_mean_SD_CV$CV <- GSE29087_FPKM_MVA_mean_SD_CV$SD/GSE29087_FPKM_MVA_mean_SD_CV$Mean
##plot(GSE29087_FPKM_MVA_mean_SD_CV_clean$Mean,GSE29087_FPKM_MVA_mean_SD_CV_clean$CV,main="Good",pch=19)
## Filter out layers
GSE29087_FPKM_MVA_mean_SD_CV_clean <- GSE29087_FPKM_MVA_mean_SD_CV
row.has.na <- apply(GSE29087_FPKM_MVA_mean_SD_CV_clean, 1, function(x){any(is.na(x))})
GSE29087_FPKM_MVA_mean_SD_CV_clean <- GSE29087_FPKM_MVA_mean_SD_CV_clean[!row.has.na,]
# GSE29087_FPKM_MVA_mean_SD_CV_clean <-
#   GSE29087_FPKM_MVA_mean_SD_CV[GSE29087_FPKM_MVA_mean_SD_CV$Mean >= 0, ]
# GSE29087_FPKM_MVA_mean_SD_CV_clean <-
#   GSE29087_FPKM_MVA_mean_SD_CV_clean[GSE29087_FPKM_MVA_mean_SD_CV_clean$CV < 5,]
### Plotting
q <- ggplot(GSE29087_FPKM_MVA_mean_SD_CV_clean, aes(x=Mean, y=CV)) +
  geom_point(shape = 19,size = 1,alpha = 0.3) + 
  geom_smooth(method="auto",se=T)+xlim(0,50)+ylim(0,10)+
  theme(axis.text.y = element_text(face="bold", color="black",size=16,family = "ArialMT",hjust = 1),
        axis.text.x = element_text(face="bold", color="black",size=16,family = "ArialMT",hjust = 1)) +
  ggtitle("mES|GSE29087|STRT") +
  theme(plot.title=element_text(family="ArialMT", face="bold", size=20))+
  theme(axis.title=element_text(family="ArialMT",size=16,face="bold")) +
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
  theme(axis.ticks = element_line(colour = 'black',size = 1.2,linetype = 'dashed'))+
  theme(axis.ticks.length = unit(0.2,"cm"))+
  theme(panel.background = element_rect(colour = 'black', fill = 'white', size = .75, linetype='solid'))
q <- q + labs(y = "Coefficient of variation")
q <- q + labs(x = zz)+ theme(axis.title.x = element_text(family = "ArialMT",face="bold", size=20))
pdf("./mm10_MS_mESC_Fig2_correlation_analysis/GSE29087_MVA_Plot.pdf", width = 10,height = 8)
q
dev.off()