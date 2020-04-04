## 2019-07-09
## MVA plotting from FPKM values for all cells
library(ggplot2)
GSE98664_FPKM_MVA <- mm10_GSE98664_FPKM_mereged2_density
# row.names(GSE98664_FPKM_MVA) <- GSE98664_FPKM_MVA$Gene
# GSE98664_FPKM_MVA$Gene <- NULL
# GSE98664_FPKM_MVA <- GSE98664_FPKM_MVA[rowSums(GSE98664_FPKM_MVA)>=1,]
############
GSE98664_FPKM_MVA_mean <- as.data.frame(apply(GSE98664_FPKM_MVA,1,mean))
names(GSE98664_FPKM_MVA_mean)[1] <- 'Mean'
GSE98664_FPKM_MVA_SD <- as.data.frame(apply(GSE98664_FPKM_MVA,1,sd))
names(GSE98664_FPKM_MVA_SD)[1] <- "SD"
GSE98664_FPKM_MVA_mean_SD_CV <- cbind(GSE98664_FPKM_MVA_mean,GSE98664_FPKM_MVA_SD)
############ Filtering NaN and -Inf
nrow(GSE98664_FPKM_MVA_mean_SD_CV[is.nan(GSE98664_FPKM_MVA_mean_SD_CV$CV),])
nrow(GSE98664_FPKM_MVA_mean_SD_CV[is.infinite(GSE98664_FPKM_MVA_mean_SD_CV$Mean),])
row.has.na <- apply(GSE98664_FPKM_MVA_mean_SD_CV, 1, function(x){any(is.na(x))})
sum(row.has.na)
GSE98664_FPKM_MVA_mean_SD_CV <- GSE98664_FPKM_MVA_mean_SD_CV[!row.has.na,]
GSE98664_FPKM_MVA_mean_SD_CV$CV <- GSE98664_FPKM_MVA_mean_SD_CV$SD/GSE98664_FPKM_MVA_mean_SD_CV$Mean
##plot(GSE98664_FPKM_MVA_mean_SD_CV_clean$Mean,GSE98664_FPKM_MVA_mean_SD_CV_clean$CV,main="Good",pch=19)
## Filter out layers
GSE98664_FPKM_MVA_mean_SD_CV_clean <- GSE98664_FPKM_MVA_mean_SD_CV
row.has.na <- apply(GSE98664_FPKM_MVA_mean_SD_CV_clean, 1, function(x){any(is.na(x))})
GSE98664_FPKM_MVA_mean_SD_CV_clean <- GSE98664_FPKM_MVA_mean_SD_CV_clean[!row.has.na,]
# GSE98664_FPKM_MVA_mean_SD_CV_clean <-
#   GSE98664_FPKM_MVA_mean_SD_CV[GSE98664_FPKM_MVA_mean_SD_CV$Mean >= 0, ]
# GSE98664_FPKM_MVA_mean_SD_CV_clean <-
#   GSE98664_FPKM_MVA_mean_SD_CV_clean[GSE98664_FPKM_MVA_mean_SD_CV_clean$CV < 5,]
### Plotting
q <- ggplot(GSE98664_FPKM_MVA_mean_SD_CV_clean, aes(x=Mean, y=CV)) +
  geom_point(shape = 19,size = 1,alpha = 0.3) + geom_smooth(method="auto",se=T)+xlim(0,50)+ylim(0,10)+
  theme(axis.text.y = element_text(face="bold", color="black",size=16,family = "ArialMT",hjust = 1),
        axis.text.x = element_text(face="bold", color="black",size=16,family = "ArialMT",hjust = 1)) +
  ggtitle("mES|GSE98664|RamDA") +
  theme(plot.title=element_text(family="ArialMT", face="bold", size=20))+
  theme(axis.title.y=element_text(family = "ArialMT",size=16,face="bold")) +
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
pdf("./mm10_MS_mESC_Fig2_correlation_analysis/GSE98664_MVA_Plot.pdf", width = 10,height = 8)
q
dev.off()