library(ggplot2)
PRJDB5282_columnAnnotation_2_Good <- subset(PRJDB5282_columnAnnotation_2,covGroup=="Good_cells")
tsne_plotGood <- data.frame(x = tsne_outGood$Y[,1], y = tsne_outGood$Y[,2])
p1 <- ggplot(data = tsne_plotGood, aes(x=x, y=y, color="black")) + geom_point(size=2.0,color="black") +
  labs(title="PRJDB5282:Non skewed single-cells", x="tSNE1", y="tSNE2") + theme_bw()


p1 <- p1 + xlab("tSNE1")+ theme(axis.title.x = element_text(face="bold", colour="black", size=15),axis.text.x  = element_text(face="bold",size=15,colour = "black"))
p1 <- p1 + ylab("tSNE2")+ theme(axis.title.y = element_text(face="bold", colour="black", size=15),axis.text.y  = element_text(face="bold",size=15, color = "black"))
p1 <- p1 + theme(legend.position = "none")
p1 <- p1 + theme(plot.title = element_text(lineheight=.8, face="bold", size = 16)) + theme(plot.title = element_text(colour = "black",hjust = 0.5))
p1 <- p1 + theme(panel.background = element_rect(fill = "white", colour = "white"))
p1 <- p1 + theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"),panel.border = element_rect(colour = "black",fill = NA,size = 1.2))
p1 <- p1 + theme(axis.ticks = element_line(colour = 'black',size = 1.2,linetype = 'dashed'))
p1 <- p1 + theme(axis.ticks.length = unit(0.2,"cm"))
pdf("./T-SNE_Good_Skewed_covergae/Rsne_good.pdf")
p1
dev.off()
p1
