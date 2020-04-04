library(ggplot2)
PRJDB5282_columnAnnotation_2 <- names(mm9_PRJDB5282_count_mereged_TSNE_DDDD)
PRJDB5282_columnAnnotation_3 <- subset(PRJDB5282_columnAnnotation,rownames(PRJDB5282_columnAnnotation) %in% PRJDB5282_columnAnnotation_2)
PRJDB5282_columnAnnotation_3$cell_id <- row.names(PRJDB5282_columnAnnotation_3)
tsne_plot <- data.frame(x = tsne_out$Y[,1], y = tsne_out$Y[,2], col = PRJDB5282_columnAnnotation_3$covGroup)
p1 <- ggplot(data = tsne_plot, aes(x=x, y=y, color=col)) + geom_point(size=2.0) +
  labs(title="PRJDB5282:Non skewed vs. Skewed single-cells", x="tSNE1", y="tSNE2") + scale_color_manual(labels = c("Good", "Skewed"), values = c("green3", "magenta")) + theme_bw() + guides(color=guide_legend("Sample type"))


p1 <- p1 + xlab("tSNE1")+ theme(axis.title.x = element_text(face="bold", colour="black", size=15),axis.text.x  = element_text(face="bold",size=15,colour = "black"))
p1 <- p1 + ylab("tSNE2")+ theme(axis.title.y = element_text(face="bold", colour="black", size=15),axis.text.y  = element_text(face="bold",size=15, color = "black"))
p1 <- p1 + theme(legend.title = element_text(colour="black", size=15, face="bold")) + theme(legend.text = element_text(colour="black", size=15, face = "bold"))
p1 <- p1 + theme(plot.title = element_text(lineheight=.8, face="bold", size = 16)) + theme(plot.title = element_text(colour = "black",hjust = 0.5))
p1 <- p1 + theme(panel.background = element_rect(fill = "white", colour = "white"))
p1 <- p1 + theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"),panel.border = element_rect(colour = "black",fill = NA,size = 1.2))
p1 <- p1 + theme(axis.ticks = element_line(colour = 'black',size = 1.2,linetype = 'dashed'))
p1 <- p1 + theme(axis.ticks.length = unit(0.2,"cm"))
p1 <- p1 + theme(legend.position="bottom")
pdf("./T-SNE_Good_Skewed_covergae/Rsne_good_skewed.pdf")
p1
dev.off()
p1
