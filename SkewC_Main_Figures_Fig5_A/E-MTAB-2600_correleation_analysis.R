ERR1211471 
ERR1211638

ERR523100
ERR522921

library(dplyr)
higcov <- mm10_EMTAB_2600_FPKM_mereged %>% select(ERR1211471,ERR1211638,ERR523100,ERR522921)
library(ggplot2)

sp <- ggplot(higcov, aes(x=ERR523100 , y=ERR522921)) + geom_point(alpha=.3)

sp + scale_x_continuous(trans='log2') + scale_y_continuous(trans='log2') 

#  (by default includes 95% confidence region)
cor(mm10_EMTAB_2600_FPKM_mereged$ERR523064,mm10_EMTAB_2600_FPKM_mereged$ERR1211471)
library(easyGgplot2)

ggplot2.scatterplot(data=higcov, xName='ERR1211471',yName='ERR1211638',xScale="log10", yScale="log10")
