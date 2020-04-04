## 2019-07-09
## MVA plotting from FPKM values for all cells
library(ggplot2)
GSE53386_FPKM_MVA <- mm10_GSE53386_FPKM_mereged2
# row.names(GSE53386_FPKM_MVA) <- GSE53386_FPKM_MVA$Gene
# GSE53386_FPKM_MVA$Gene <- NULL
# GSE53386_FPKM_MVA <- GSE53386_FPKM_MVA[rowSums(GSE53386_FPKM_MVA)>=1,]
############
GSE53386_FPKM_MVA <- GSE53386_FPKM_MVA
GSE53386_FPKM_MVA_mean <- as.data.frame(apply(GSE53386_FPKM_MVA,1,mean))
names(GSE53386_FPKM_MVA_mean)[1] <- 'Mean'
GSE53386_FPKM_MVA_SD <- as.data.frame(apply(GSE53386_FPKM_MVA,1,sd))
names(GSE53386_FPKM_MVA_SD)[1] <- "SD"
GSE53386_FPKM_MVA_mean_SD_CV <- cbind(GSE53386_FPKM_MVA_mean,GSE53386_FPKM_MVA_SD)
############ Filtering NaN and -Inf
nrow(GSE53386_FPKM_MVA_mean_SD_CV[is.nan(GSE53386_FPKM_MVA_mean_SD_CV$CV),])
nrow(GSE53386_FPKM_MVA_mean_SD_CV[is.infinite(GSE53386_FPKM_MVA_mean_SD_CV$Mean),])
row.has.na <- apply(GSE53386_FPKM_MVA_mean_SD_CV, 1, function(x){any(is.na(x))})
sum(row.has.na)
GSE53386_FPKM_MVA_mean_SD_CV <- GSE53386_FPKM_MVA_mean_SD_CV[!row.has.na,]
GSE53386_FPKM_MVA_mean_SD_CV$CV <- GSE53386_FPKM_MVA_mean_SD_CV$SD/GSE53386_FPKM_MVA_mean_SD_CV$Mean
##plot(GSE53386_FPKM_MVA_mean_SD_CV_clean$Mean,GSE53386_FPKM_MVA_mean_SD_CV_clean$CV,main="Good",pch=19)
## Filter out layers
GSE53386_FPKM_MVA_mean_SD_CV_clean <- GSE53386_FPKM_MVA_mean_SD_CV
row.has.na <- apply(GSE53386_FPKM_MVA_mean_SD_CV_clean, 1, function(x){any(is.na(x))})
GSE53386_FPKM_MVA_mean_SD_CV_clean <- GSE53386_FPKM_MVA_mean_SD_CV_clean[!row.has.na,]
# GSE53386_FPKM_MVA_mean_SD_CV_clean <-
#   GSE53386_FPKM_MVA_mean_SD_CV[GSE53386_FPKM_MVA_mean_SD_CV$Mean >= 0, ]
# GSE53386_FPKM_MVA_mean_SD_CV_clean <-
#   GSE53386_FPKM_MVA_mean_SD_CV_clean[GSE53386_FPKM_MVA_mean_SD_CV_clean$CV < 5,]
### Plotting
q <- ggplot(GSE53386_FPKM_MVA_mean_SD_CV_clean, aes(x=Mean, y=CV)) +
  geom_point(shape = 19,size = 1,alpha = 0.3) + geom_smooth(method="auto",se=T)+xlim(0,50)+ylim(0,10)+
  theme(axis.text.y = element_text(face="bold", color="black",size=16,family = "ArialMT",hjust = 1),
        axis.text.x = element_text(face="bold", color="black",size=16,family = "ArialMT",hjust = 1)) +
  ggtitle("mES|GSE53386|SUPer-seq") +
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
q <- q + labs(x = zz)+ theme(axis.title.x = element_text(colour = 'black',family = "ArialMT",face="bold", size=16))
pdf("./mm10_MS_mESC_Fig2_correlation_analysis/GSE53386_MVA_Plot.pdf", width = 10,height = 8)
q
dev.off()

                                              