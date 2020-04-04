## 20190610
## Analysis of the correaltion between the micoscopic image measurments and the coverage analysis

GSE46980_cell_measurements <- read.delim("/osc-fs_home/imad-a/GSE46980_cell_measurements.txt")
View(GSE46980_cell_measurements)
GSE46980_R1_Metadata_V2 <- GSE46980_R1_Metadata 
GSE46980_R1_Metadata_V3 <- merge(GSE46980_R1_Metadata_V2,GSE46980_cell_measurements,by.x = 'wellid',by.y = 'cell_label' )
GSE46980_R1_Metadata_GoodCove <- merge(GSE46980_R1_Metadata_V3,GSE46980_GoodCells_cellID,by.x = 'cell_id',by.y = 'V1')
GSE46980_R1_Metadata_SkewedCove <- merge(GSE46980_R1_Metadata_V3,GSE46980_Skewed_coverage_cellID,by.x = 'cell_id',by.y = 'V1')
GSE46980_R1_Metadata_Dead <- merge(GSE46980_R1_Metadata_V3,GSE46980_R1_Metadata_DEAD_cells,by.x = 'cell_id',by.y = 'V1')
GSE46980_R1_Metadata_V4 <- rbind(GSE46980_R1_Metadata_GoodCove,GSE46980_R1_Metadata_SkewedCove,GSE46980_R1_Metadata_Dead)
names(GSE46980_R1_Metadata_V4)[4] <- 'image_annotation'
names(GSE46980_R1_Metadata_V4)[17] <- 'Coverage_annotation'
###
GSE46980_R1_Metadata_V5 <- merge(GSE46980_coverage_skeweness,GSE46980_R1_Metadata_V4,by= 'cell_id')
names(GSE46980_R1_Metadata_V5)[5] <- 'image_annotation'
names(GSE46980_R1_Metadata_V5)[18] <- 'Coverage_annotation'
GSE46980_R1_Metadata_V5_GoodCove <- subset(GSE46980_R1_Metadata_V5,Coverage_annotation =='Good_cells')
GSE46980_R1_Metadata_V5_SkewedCove <- subset(GSE46980_R1_Metadata_V5,Coverage_annotation =='Skewed_coverage_cells')
GSE46980_R1_Metadata_V5_GoodCove <- subset(GSE46980_R1_Metadata_V5,Coverage_annotation =='Good_cells')

#####
shapiro.test(GSE46980_R1_Metadata_V5$Coverage_Skewness)
ggplot(GSE46980_R1_Metadata_V5, aes(x=Coverage_Skewness)) +geom_density()
ggqqplot(GSE46980_R1_Metadata_V5$Coverage_Skewness)
###
PLOTTING
tgc <- summarySE(tgcMeta, measurevar="area", groupvars=c("Coverage_annotation"))
pd <- position_dodge(0.5) # move them .05 to the left and right

ggplot(tgc, aes(x=Coverage_annotation, y=area, colour=Coverage_annotation)) + 
  geom_errorbar(aes(ymin=area-se, ymax=area+se), width=.1, position=pd) +
  geom_line(position=pd) +
  geom_point(position=pd) +
  geom_point(position=pd, size=3, shape=21, fill="white") + # 21 is filled circle
  xlab("Coverage_annotation") +
  ylab("Area of the cell in pixels") +
  
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.text.y = element_text(face="bold", color="black",size=12)) +
  ggtitle("GSE46980: Distribusion of the area of the cell") +
  theme(plot.title=element_text(family="Times", face="bold", size=14))+
  theme(axis.title=element_text(size=12,face="bold")) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(panel.background = element_rect(colour = 'black', fill = 'white', size = .75, linetype='solid'))+
  theme(legend.justification=c(1,1),
        legend.position="bottom")          

tgc <- summarySE(tgcMeta, measurevar="area", groupvars=c("Coverage_annotation"))
pd <- position_dodge(0.5) # move them .05 to the left and right

ggplot(tgc, aes(x=Coverage_annotation, y=area, colour=Coverage_annotation)) + 
  geom_errorbar(aes(ymin=area-se, ymax=area+se), width=.1, position=pd) +
  geom_line(position=pd) +
  geom_point(position=pd)
#####################################################################3
tgc <- summarySE(GSE46980_R1_Metadata_V5, measurevar="Coverage_Skewness", groupvars=c("image_annotation"))

ggplot(tgc, aes(x=image_annotation, y=Coverage_Skewness, fill=image_annotation)) + 
  geom_bar(position=position_dodge(), stat="identity") +
  geom_errorbar(aes(ymin=Coverage_Skewness-se, ymax=Coverage_Skewness+se),
                width=.2,                    # Width of the error bars
                position=position_dodge(.9))+ggtitle("image_annotation")
#####
tgc <- summarySE(GSE46980_R1_Metadata_V5, measurevar="mean", groupvars=c("image_annotation"))

ggplot(tgc, aes(x=image_annotation, y=mean, fill=image_annotation)) + 
  geom_bar(position=position_dodge(), stat="identity") +
  geom_errorbar(aes(ymin=mean-se, ymax=mean+se),
                width=.2,                    # Width of the error bars
                position=position_dodge(.9))+ggtitle("image_annotation")

#####
tgc <- summarySE(tgcMeta, measurevar="Coverage_Skewness", groupvars=c("Coverage_annotation"))

ggplot(tgc, aes(x=Coverage_annotation, y=Coverage_Skewness, fill=Coverage_annotation)) + 
  geom_bar(position=position_dodge(), stat="identity") +
  geom_errorbar(aes(ymin=Coverage_Skewness-se, ymax=Coverage_Skewness+se),
                width=.2,                    # Width of the error bars
                position=position_dodge(.9))+ggtitle("Coverage_annotation")
#####
tgc <- summarySE(tgcMeta, measurevar="mean", groupvars=c("Coverage_annotation"))

ggplot(tgc, aes(x=Coverage_annotation, y=mean, fill=Coverage_annotation)) + 
  geom_bar(position=position_dodge(), stat="identity") +
  geom_errorbar(aes(ymin=mean-se, ymax=mean+se),
                width=.2,                    # Width of the error bars
                position=position_dodge(.9))+ggtitle("Coverage_annotation")
