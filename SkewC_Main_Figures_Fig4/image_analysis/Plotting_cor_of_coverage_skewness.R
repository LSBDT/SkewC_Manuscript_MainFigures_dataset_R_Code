png(filename = "image_analysis/cor_between_pixels_intensities_and_coverage_skewness.png", width = 600,height = 600,res = 100)
ggplot(GSE46980_R1_Metadata_V5, aes(x=log2(Coverage_Skewness), y=log2(integrated_density))) +
  geom_point(shape=20) +    # Use hollow circles
  geom_smooth()     +       # Add a loess smoothed fit curve with confidence region
  xlab("log2(Coverage skewness)") +
  ylab("log2(Pixels intensities of the cell)") +
  theme(axis.text.y = element_text(face="bold", color="black",size=16)) +
  theme(axis.text.x = element_text(face="bold", color="black",size=16)) +
  
  ggtitle("GSE46980:Correlation between pixels intensities\n of the cells and coverage skewness") +
  theme(plot.title=element_text(family="Times", face="bold", size=18))+
  theme(axis.title=element_text(size=14,face="bold")) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(panel.background = element_rect(colour = 'black', fill = 'white', size = .75, linetype='solid'))+
  annotate(geom="text",x=1.8, y=16, label=" Spearman's correlation = -0.1702116",
             color="black",size = 3.5,fontface=3,family="Arial")
dev.off()
####
png(filename = "image_analysis/cor_between_cell_size_and_coverage_skewness.png", width = 600,height = 600,res = 100)
ggplot(GSE46980_R1_Metadata_V5, aes(x=log2(Coverage_Skewness), y=log2(area))) +
  geom_point(shape=20) +    # Use hollow circles
  geom_smooth()     +       # Add a loess smoothed fit curve with confidence region
  xlab("log2(Coverage skewness)") +
  ylab("log2(Cell size)") +
  theme(axis.text.y = element_text(face="bold", color="black",size=16)) +
  theme(axis.text.x = element_text(face="bold", color="black",size=16)) +
  
  ggtitle("GSE46980:Correlation between cell size\n and coverage skewness") +
  theme(plot.title=element_text(family="Times", face="bold", size=18))+
  theme(axis.title=element_text(size=14,face="bold")) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(panel.background = element_rect(colour = 'black', fill = 'white', size = .75, linetype='solid'))+
  annotate(geom="text",x=1.8, y=8.5, label=" Spearman's correlation = -0.1788363",
           color="black",size = 3.5,fontface=3,family="Arial")
dev.off()