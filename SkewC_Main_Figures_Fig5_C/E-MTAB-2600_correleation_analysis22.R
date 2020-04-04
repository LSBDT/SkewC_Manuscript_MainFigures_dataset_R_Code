library(ggplot2)

low_low_cor <-
  round(cor(
    mm10_EMTAB_2600_FPKM_mereged$ERR523100,
    mm10_EMTAB_2600_FPKM_mereged$ERR522921,
    method = "spearman"),2)
sp <-
ggplot(mm10_EMTAB_2600_FPKM_mereged,aes(x =log10(ERR523100) , y = log10(ERR522921))) + geom_point(alpha =.3) 

+
 
           
           theme_bw() + ylab("log10 fpkm(ERR522921)") + xlab("log10 fpkm(ERR523100)") + scale_x_continuous(trans = 'log10') + scale_y_continuous(trans = 'log10')
sp + labs(title = "EMTAB_2600: Expression correlation low-low coverage cells",
          subtitle = paste0("Spearman correlation:",low_low_cor))
  
  
  
  
  
  
  
ggtitle("") + 
  theme(plot.title = element_text(lineheight=.8, face="bold"))
 

cor(mm10_EMTAB_2600_FPKM_mereged$ERR522921, mm10_EMTAB_2600_FPKM_mereged$ERR523100)

