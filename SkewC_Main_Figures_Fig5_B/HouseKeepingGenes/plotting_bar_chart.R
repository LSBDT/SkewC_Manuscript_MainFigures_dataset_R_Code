library(pheatmap)
library(RColorBrewer)
pheatmap(housekeepingGenes_DDDD, annotation_col = E_MTE_MTAB_2600_columnAnnotation,
         cluster_rows = F,cluster_cols = F,cellheight = 8, cellwidth = 8, file = "HouseKeepingGenes/emtab2600_housekeeping.png")
library(ggplot2) 
library(Rmisc)
tgc <- summarySE(rbdindAll, measurevar="value", groupvars=c("annotation"))
tgc

tgc2 <- tgc
tgc2$dose <- factor(tgc2$dose)

# Error bars represent standard error of the mean
ggplot(tgc, aes(x=annotation, y=value, fill=annotation)) + 
  geom_bar(position=position_dodge(), stat="identity") +
  geom_errorbar(aes(ymin=value-se, ymax=value+se),
                width=.2,                    # Width of the error bars
                position=position_dodge(.9))

### 
p <- ggplot(tgc, aes(x=annotation, y=value, fill=annotation)) + 
  geom_bar(position=position_dodge(), stat="identity",
           colour="black", # Use black outlines,
           size=.3) +      # Thinner lines
  geom_errorbar(aes(ymin=value-se, ymax=value+se),
                size=.3,    # Thinner lines
                width=.2,
                position=position_dodge(.9)) +
  xlab("Coverage") +
  ylab("FPKM") +
  
  ggtitle("E-MTAB-2600: Expression of GAPDH") +
  theme_bw() + 
  theme(axis.text.x = element_text(face="bold", color="black", 
                                   size=14),
        axis.text.y = element_text(face="bold", color="black", 
                                   size=14))
p +  theme(legend.position = "none") 

boxplot(value ~ annotation,data =rbdindAll,log = "y",col = "blue",ylim = c(0.01, 1000))
title("E-MTAB-2600: Expression profile of markers of apoptosis,high coverage cells")


# Use 95% confidence intervals instead of SEM
ggplot(tgc2, aes(x=dose, y=len, fill=supp)) + 
  geom_bar(position=position_dodge(), stat="identity") +
  geom_errorbar(aes(ymin=len-ci, ymax=len+ci),
                width=.2,                    # Width of the error bars
                position=position_dodge(.9))