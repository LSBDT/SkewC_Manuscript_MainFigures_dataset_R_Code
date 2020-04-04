library(Rmisc)
library(ggplot2)
tgcMeta_Good_cells <- subset(tgcMeta_2,Coverage_annotation =="Good_cells")
tgc <- summarySE(tgcMeta_Good_cells, measurevar="area", groupvars=c("cell_cycle_phase"))
tgc$cell_cycle_phase <- factor(tgc$cell_cycle_phase,levels = tgc$cell_cycle_phase[order(tgc$area)])
pd <- position_dodge(0.5) # move them .05 to the left and right
png(filename = "image_analysis_cell_cycle_analysis/CycleC_Good_cells.png", width = 450,height = 350,res = 70)

ggplot(tgc, aes(x=cell_cycle_phase, y=area, colour=cell_cycle_phase)) + 
  geom_errorbar(aes(ymin=area-se, ymax=area+se), width=.1, position=pd,colour="black") +
  geom_line(position=pd) +
  geom_text(aes(label=paste("n=",N)),hjust=1,vjust=0.5,nudge_x =-0.1,nudge_y = 0.1,size=6,colour="black")+
  geom_point(position=pd) +
  geom_point(position=pd, size=4, shape=21, fill="white",stroke = 2) + # 21 is filled circle
  xlab("Cell annotation(Coverage annation)") +
  ylab("Cell size in pixels") +
  theme(axis.text.y = element_text(face="bold", color="black",size=16)) +
  theme(axis.text.x = element_text(face="bold", color="black",size=16)) +
  
  ggtitle(label = "GSE46980:Good cells Cell cycle (n=39)",subtitle = "bars representing SEM") +
  theme(plot.title=element_text(family="Times", face="bold", size=18))+
  theme(axis.title=element_text(size=14,face="bold")) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(panel.background = element_rect(colour = 'black', fill = 'white', size = .75, linetype='solid'))+
  theme(legend.justification=c(1,1),legend.position="bottom",legend.text =element_text(color="black",size=10),legend.title = element_text(face="bold",size = 12))          
dev.off()

###################
library(Rmisc)
library(ggplot2)
tgcMeta_Skewed_cells <- subset(tgcMeta,Coverage_annotation =="Skewed_coverage_cells")
tgc <- summarySE(tgcMeta_Skewed_cells, measurevar="area", groupvars=c("cell_cycle_phase"))
tgc$cell_cycle_phase <- factor(tgc$cell_cycle_phase,levels = tgc$cell_cycle_phase[order(tgc$area)])
pd <- position_dodge(0.5) # move them .05 to the left and right
pdf("image_analysis_cell_cycle_analysis/CycleC_Skewed_cells.pdf")

ggplot(tgc, aes(x=cell_cycle_phase, y=area, colour=cell_cycle_phase)) + 
  geom_errorbar(aes(ymin=area-se, ymax=area+se), width=.1, position=pd,colour="black") +
  geom_line(position=pd) +
  geom_text(aes(label=paste("n=",N)),hjust=1,vjust=0.5,nudge_x =-0.1,nudge_y = 0.1,size=6,colour="black")+
  geom_point(position=pd) +
  geom_point(position=pd, size=4, shape=21, fill="white",stroke = 2) + # 21 is filled circle
  xlab("Cell annotation(Coverage annation)") +
  ylab("Cell size in pixels") +
  theme(axis.text.y = element_text(face="bold", color="black",size=16)) +
  theme(axis.text.x = element_text(face="bold", color="black",size=16)) +
  
  ggtitle(label = "GSE46980:Skewed cells Cell cycle (n=48)",subtitle = "bars representing SEM") +
  theme(plot.title=element_text(family="Times", face="bold", size=18))+
  theme(axis.title=element_text(size=14,face="bold")) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(panel.background = element_rect(colour = 'black', fill = 'white', size = .75, linetype='solid'))+
  theme(legend.justification=c(1,1),legend.position="bottom",legend.text =element_text(color="black",size=10),legend.title = element_text(face="bold",size = 12))          
dev.off()