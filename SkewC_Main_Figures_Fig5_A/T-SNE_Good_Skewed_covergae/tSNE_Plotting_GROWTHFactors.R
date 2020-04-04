library(ggplot2)
mm10_EMTAB_2600_metadata_processd_1 <- as.data.frame(select(mm10_EMTAB_2600_metadata_processd,Comment.ENA_RUN.,FactorValue.growth.condition.))
mm10_EMTAB_2600_metadata_processd_2 <- merge(mm10_EMTAB_2600_metadata_processd_1,E_MTAB_2600_columnAnnotation_2, by = "cell_id")
tsne_plot <- data.frame(x = tsne_out$Y[,1], y = tsne_out$Y[,2], col = mm10_EMTAB_2600_metadata_processd_2$Growth_condition)
p1 <- ggplot(data = tsne_plot, aes(x=x, y=y, color=col)) + geom_point(size=2.0) +
  labs(title="E-MTAB-2600", x="tSNE1", y="tSNE2")  + theme_bw() + 
  guides(color=guide_legend("Growth factor",nrow =  3))


p1 <- p1 + xlab("tSNE1")+ theme(axis.title.x = element_text(face="bold", colour="black", size=15),axis.text.x  = element_text(face="bold",size=15,colour = "black"))
p1 <- p1 + ylab("tSNE2")+ theme(axis.title.y = element_text(face="bold", colour="black", size=15),axis.text.y  = element_text(face="bold",size=15, color = "black"))
p1 <- p1 + theme(legend.title = element_text(colour="black", size=15, face="bold")) + theme(legend.text = element_text(colour="black", size=15, face = "bold"))
p1 <- p1 + theme(plot.title = element_text(lineheight=.8, face="bold", size = 16)) + theme(plot.title = element_text(colour = "black",hjust = 0.5))
p1 <- p1 + theme(panel.background = element_rect(fill = "white", colour = "white"))
p1 <- p1 + theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"),panel.border = element_rect(colour = "black",fill = NA,size = 1.2))
p1 <- p1 + theme(axis.ticks = element_line(colour = 'black',size = 1.2,linetype = 'dashed'))
p1 <- p1 + theme(axis.ticks.length = unit(0.2,"cm"))
p1 <- p1 + theme(legend.position="bottom")
pdf("./T-SNE_Good_Skewed_covergae/Rsne_growth.pdf")
p1
dev.off()
p1
