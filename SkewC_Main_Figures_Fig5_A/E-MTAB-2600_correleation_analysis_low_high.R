low_high_cor <-
  round(cor(
    mm10_EMTAB_2600_FPKM_mereged$ERR523100,
    mm10_EMTAB_2600_FPKM_mereged$ERR1211471,
    method = "pearson"),2)

png(filename = "./E-MTAB-2600_ERR523100_ERR1211471_corr.png",height = 1000,width=1000,res = 150)
p21 <- ggplot(mm10_EMTAB_2600_FPKM_mereged,aes(x=log10(ERR523100), y=log10(ERR1211471)))
p21 <- p21 + geom_point(shape = 19,size = 1,alpha = 0.3) + scale_x_continuous(limits = c(-1,5))+scale_y_continuous(limits = c(-1,5))
p21 <-p21 + theme(axis.title = element_text(colour = "black",size = 20,family = "Times"),axis.text = element_text(size = 20,colour = "black",family = "Times"))
p21 <- p21 + labs(x = "log10(ERR523100)", y = "log10(ERR1211471)")
p21 <- p21 + theme(
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    panel.background = element_blank(),
    axis.line = element_line(color = "black"),panel.border = element_rect(colour = "black",fill = NA,size = 1.2))
p21 <- p21 + theme(axis.ticks = element_line(colour = 'black',size = 1.2,linetype = 'dashed'))
p21 <- p21 + theme(axis.ticks.length = unit(0.2,"cm"))
p21 <- p21 + ggtitle(paste0("EMTAB_2600: Expression correlation\nlow-high coverage cells pearson correlation= ",low_high_cor))+
  theme(plot.title = element_text(lineheight = 0.8,size = 20,colour = "black",family = "Times"))+
  theme (plot.title = element_text(hjust = 0.5))
p21 <- p21 + coord_fixed()
p21
dev.off()

