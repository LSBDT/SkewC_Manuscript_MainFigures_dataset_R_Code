## 2019-07-09
## MVA plotting from FPKM values for all cells
library(ggplot2)
PRJDB5282_FPKM_MVA <- mm9_PRJDB5282_TPM_mereged
row.names(PRJDB5282_FPKM_MVA) <- PRJDB5282_FPKM_MVA$Gene
PRJDB5282_FPKM_MVA$Gene <- NULL
# PRJDB5282_FPKM_MVA <- PRJDB5282_FPKM_MVA[rowSums(PRJDB5282_FPKM_MVA)>=1,]
############
PRJDB5282_FPKM_MVA_mean <- as.data.frame(apply(PRJDB5282_FPKM_MVA,1,mean))
names(PRJDB5282_FPKM_MVA_mean)[1] <- 'Mean'
PRJDB5282_FPKM_MVA_SD <- as.data.frame(apply(PRJDB5282_FPKM_MVA,1,sd))
names(PRJDB5282_FPKM_MVA_SD)[1] <- "SD"
PRJDB5282_FPKM_MVA_mean_SD_CV <- cbind(PRJDB5282_FPKM_MVA_mean,PRJDB5282_FPKM_MVA_SD)
############ Filtering NaN and -Inf
nrow(PRJDB5282_FPKM_MVA_mean_SD_CV[is.nan(PRJDB5282_FPKM_MVA_mean_SD_CV$CV),])
nrow(PRJDB5282_FPKM_MVA_mean_SD_CV[is.infinite(PRJDB5282_FPKM_MVA_mean_SD_CV$Mean),])
row.has.na <- apply(PRJDB5282_FPKM_MVA_mean_SD_CV, 1, function(x){any(is.na(x))})
sum(row.has.na)
PRJDB5282_FPKM_MVA_mean_SD_CV <- PRJDB5282_FPKM_MVA_mean_SD_CV[!row.has.na,]
PRJDB5282_FPKM_MVA_mean_SD_CV$CV <- PRJDB5282_FPKM_MVA_mean_SD_CV$SD/PRJDB5282_FPKM_MVA_mean_SD_CV$Mean
##plot(PRJDB5282_FPKM_MVA_mean_SD_CV_clean$Mean,PRJDB5282_FPKM_MVA_mean_SD_CV_clean$CV,main="Good",pch=19)
## Filter out layers
PRJDB5282_FPKM_MVA_mean_SD_CV_clean <- PRJDB5282_FPKM_MVA_mean_SD_CV
row.has.na <- apply(PRJDB5282_FPKM_MVA_mean_SD_CV_clean, 1, function(x){any(is.na(x))})
PRJDB5282_FPKM_MVA_mean_SD_CV_clean <- PRJDB5282_FPKM_MVA_mean_SD_CV_clean[!row.has.na,]
# PRJDB5282_FPKM_MVA_mean_SD_CV_clean <-
#   PRJDB5282_FPKM_MVA_mean_SD_CV[PRJDB5282_FPKM_MVA_mean_SD_CV$Mean >= 0, ]
# PRJDB5282_FPKM_MVA_mean_SD_CV_clean <-
#   PRJDB5282_FPKM_MVA_mean_SD_CV_clean[PRJDB5282_FPKM_MVA_mean_SD_CV_clean$CV < 5,]
### Plotting
q <- ggplot(PRJDB5282_FPKM_MVA_mean_SD_CV_clean, aes(x=Mean, y=CV)) +
  geom_point(shape = 19,size = 1,alpha = 0.3) + geom_smooth(method="auto",se=T)+xlim(0,50)+ylim(0,10)+
  theme(axis.text.y = element_text(face="bold", color="black",size=16,family = "ArialMT",hjust = 1),
        axis.text.x = element_text(face="bold", color="black",size=16,family = "ArialMT",hjust = 1)) +
  ggtitle("mES|PRJDB5282|C1 CAGE") +
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
pdf("./mm10_MS_mESC_Fig2_correlation_analysis/PRJDB5282_MVA_Plot.pdf", width = 10,height = 8)
q
dev.off()