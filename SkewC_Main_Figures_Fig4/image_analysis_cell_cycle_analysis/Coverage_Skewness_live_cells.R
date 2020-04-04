library(Rmisc)
library(ggplot2)
tgc <- summarySE(tgcMeta, measurevar="Coverage_Skewness", groupvars=c("Coverage_annotation"))
tgc$Coverage_annotation <- factor(tgc$Coverage_annotation,levels = tgc$Coverage_annotation[order(tgc$Coverage_Skewness)])
pd <- position_dodge(0.5) # move them .05 to the left and right

bp  <- ggplot(tgc, aes(x=Coverage_annotation, y=Coverage_Skewness, colour=Coverage_annotation)) + 
  geom_errorbar(aes(ymin=Coverage_Skewness-se, ymax=Coverage_Skewness+se), width=.1, position=pd,colour="black") +
  geom_line(position=pd) +
  geom_text(aes(label=paste("n=",N)),hjust=1,vjust=0.5,nudge_x =-0.1,nudge_y = 0.005,size=6,colour="black")+
  geom_point(position=pd) +
  geom_point(position=pd, size=4, shape=21, fill="white",stroke = 2) + # 21 is filled circle
  xlab("Cell annotation(Coverage annation)") +
  ylab("Coverage skewness") +
  theme(axis.text.y = element_text(face="bold", color="black",size=16)) +
  theme(axis.text.x = element_text(face="bold", color="black",size=16)) +
  
  ggtitle(label = "GSE46980:Coverage skewness of live cells (n=87)",subtitle = "bars representing SEM") +
  theme(plot.title=element_text(family="Times", face="bold", size=18))+
  theme(axis.title=element_text(size=14,face="bold")) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(panel.background = element_rect(colour = 'black', fill = 'white', size = .75, linetype='solid'))+
  theme(legend.justification=c(1,1),legend.position="bottom",legend.text =element_text(color="black",size=10),legend.title = element_text(face="bold",size = 12))          
bp  <- bp + scale_colour_manual(values = c("Skewed_coverage_cells" = "magenta", "Good_cells" = "green3"))
pdf("image_analysis_cell_cycle_analysis/live_cells_Coverage_Skewness.pdf")
bp
dev.off()

