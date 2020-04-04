library(Rmisc)
tgc <- summarySE(GSE46980_R1_Metadata_V5, measurevar="area", groupvars=c("image_annotation"))
tgc$image_annotation <- factor(tgc$image_annotation,levels = tgc$image_annotation[order(tgc$area)])
pd <- position_dodge(0.5) # move them .05 to the left and right
bp <- ggplot(tgc, aes(x=image_annotation, y=area, colour=image_annotation)) + 
  geom_errorbar(aes(ymin=area-se, ymax=area+se), width=.1, position=pd,colour="black") +
  geom_line(position=pd) + 
  geom_point(position=pd) + 
  geom_text(aes(label=paste("n=",N)),hjust=1,vjust=0.5,nudge_x =-0.1,nudge_y = 0.1,size=6,colour="black")+
geom_point(position=pd, size=4, shape=21, fill="white",stroke = 2) + # 21 is filled circle
  xlab("Cell annotation(microscopic image)") +
  ylab("Cell size in pixels") +
 theme(axis.text.y = element_text(face="bold", color="black",size=16)) +
  theme(axis.text.x = element_text(face="bold", color="black",size=16)) +
  ggtitle(label = "GSE46980:Cell size (Image annoation)",subtitle = "bars representing SEM") +
  theme(plot.title=element_text(family="Times", face="bold", size=18))+
  theme(axis.title=element_text(size=14,face="bold")) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(panel.background = element_rect(colour = 'black', fill = 'white', size = .75, linetype='solid'))+
  theme(legend.justification=c(1,1),legend.position="bottom",legend.text =element_text(color="black",size=10),legend.title = element_text(face="bold",size = 12))          
bp  <- bp + scale_colour_manual(values = c("Dead" = "magenta", "Good_qulaity" = "green3","Low_qulaity"="blue"))
pdf("image_analysis/cell_area_imageAnnotation.pdf")
bp
dev.off()

##################
library(Rmisc)
tgcMeta <- subset(GSE46980_R1_Metadata_V5,Coverage_annotation != "Dead")
tgc <- summarySE(tgcMeta, measurevar="area", groupvars=c("Coverage_annotation"))
tgc$Coverage_annotation <- factor(tgc$Coverage_annotation,levels = tgc$Coverage_annotation[order(tgc$area)])
pd <- position_dodge(0.5) # move them .05 to the left and right

bp <-ggplot(tgc, aes(x=Coverage_annotation, y=area, colour=Coverage_annotation)) + 
  geom_errorbar(aes(ymin=area-se, ymax=area+se), width=.1, position=pd,colour="black") +
  geom_line(position=pd) +
  geom_text(aes(label=paste("n=",N)),hjust=1,vjust=0.5,nudge_x =-0.1,nudge_y = 0.1,size=6,colour="black")+
  geom_point(position=pd) +
  geom_point(position=pd, size=4, shape=21, fill="white",stroke = 2) + # 21 is filled circle
  xlab("Coverage annotation") +
  ylab("Cell size in pixels") +
  
  theme(axis.text.y = element_text(face="bold", color="black",size=16)) +
  theme(axis.text.x = element_text(face="bold", color="black",size=16)) +
  
  ggtitle(label = "GSE46980:Cell size (Coverage annoation)",subtitle = "bars representing SEM") +
  theme(plot.title=element_text(family="Times", face="bold", size=18))+
  theme(axis.title=element_text(size=14,face="bold")) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(panel.background = element_rect(colour = 'black', fill = 'white', size = .75, linetype='solid'))+
  theme(legend.justification=c(1,1),legend.position="bottom",legend.text =element_text(color="black",size=10),legend.title = element_text(face="bold",size = 12)) 
bp  <- bp + scale_colour_manual(values = c("Skewed_coverage_cells" = "magenta", "Good_cells" = "green3"))
pdf("image_analysis/cell_area_Coverage_annotation.pdf")
bp
dev.off()
################################ 
## Analysis the difference in the cell area betweeen the image annoation (G) and the coverage annoation(good
##& skewed coverage)
library(Rmisc)
tgcMeta_2 <- subset(GSE46980_R1_Metadata_V5,image_annotation == "Good_qulaity")
tgc <- summarySE(tgcMeta_2, measurevar="area", groupvars=c("Coverage_annotation"))
tgc$Coverage_annotation <- factor(tgc$Coverage_annotation,levels = tgc$Coverage_annotation[order(tgc$area)])
pd <- position_dodge(0.5) # move them .05 to the left and right
pdf(filename = "image_analysis/cell_area_Coverage_annotation_of_G_cells.pdf", width = 450,height = 350,res = 70)

ggplot(tgc, aes(x=Coverage_annotation, y=area, colour=Coverage_annotation)) + 
  geom_errorbar(aes(ymin=area-se, ymax=area+se), width=.1, position=pd,colour="black") +
  geom_line(position=pd) +
  geom_text(aes(label=paste("n=",N)),hjust=1,vjust=0.5,nudge_x =-0.1,nudge_y = 0.1,size=6,colour="black")+
  geom_point(position=pd) +
  geom_point(position=pd, size=4, shape=21, fill="white",stroke = 2) + # 21 is filled circle
  xlab("Coverage annotation") +
  ylab("Cell size in pixels") +
  theme(axis.text.y = element_text(face="bold", color="black",size=16)) +
  theme(axis.text.x = element_text(face="bold", color="black",size=16)) +
  ggtitle(label = "GSE46980:Cell size (Good cells from image annoation)",subtitle = "bars representing SEM") +
  theme(plot.title=element_text(family="Times", face="bold", size=18))+
  theme(axis.title=element_text(size=14,face="bold")) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(panel.background = element_rect(colour = 'black', fill = 'white', size = .75, linetype='solid'))+
  theme(legend.justification=c(1,1),legend.position="bottom",legend.text =element_text(color="black",size=10),legend.title = element_text(face="bold",size = 12)) 
dev.off()