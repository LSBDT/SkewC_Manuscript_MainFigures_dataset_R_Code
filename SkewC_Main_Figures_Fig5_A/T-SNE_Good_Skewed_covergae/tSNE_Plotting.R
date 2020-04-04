library(ggplot2)
tsne_plot <- data.frame(x = tsne_out$Y[,1], y = tsne_out$Y[,2], col = sg$sampletype)
p1 <- ggplot(data = tsne_plot, aes(x=x, y=y, color=col,label=sg$sampletype)) + geom_point(size=2.0) + geom_text(aes(label=sg$samplename),hjust=0.5,vjust=1.0,size=2.5) +
  
  labs(title="FANTOM5 RNA libraries tSNE (n=70)", x="tSNE1", y="tSNE2") + scale_color_manual(labels = c("Cell line", "Primary cell", "Tissue"), values = c("blue", "red", "black")) + theme_bw() + guides(color=guide_legend("Sample type"))
p1 <- p1 + xlab("tSNE1")+ theme(axis.title.x = element_text(face="bold", colour="black", size=15),axis.text.x  = element_text(face="bold",size=15,colour = "black"))
p1 <- p1 + ylab("tSNE2")+ theme(axis.title.y = element_text(face="bold", colour="black", size=15),axis.text.y  = element_text(face="bold",size=15, color = "black"))
p1 <- p1 + theme(legend.title = element_text(colour="black", size=15, face="bold")) + theme(legend.text = element_text(colour="black", size=15, face = "bold"))
p1 <- p1 + theme(plot.title = element_text(lineheight=.8, face="bold", size = 16)) + theme(plot.title = element_text(colour = "black",hjust = 0.5))
p1 <- p1 + theme(panel.background = element_rect(fill = "white", colour = "white"))
p1 <- p1 + theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"),panel.border = element_rect(colour = "black",fill = NA,size = 1.2))
p1 <- p1 + theme(axis.ticks = element_line(colour = 'black',size = 1.2,linetype = 'dashed'))
p1 <- p1 + theme(axis.ticks.length = unit(0.2,"cm"))
png("/osc-fs_home/imad-a/FANTOM5_RNA_librarier_tSNE.png",width = 1250,height=1000,res=200)
p1
dev.off()
p1
