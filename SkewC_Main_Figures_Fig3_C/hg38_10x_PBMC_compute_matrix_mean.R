#20190614
p10 <- c('pmean1','pmean2','pmean3','pmean4','pmean5','pmean6','pmean7','pmean8','pmean9','pmean10')
p20 <- c('pmean11','pmean12','pmean13','pmean14','pmean15','pmean16','pmean17','pmean18','pmean19','pmean20')  
p30 <- c('pmean21','pmean22','pmean23','pmean24','pmean25','pmean26','pmean27','pmean28','pmean29','pmean30')  
p40 <- c('pmean31','pmean32','pmean33','pmean34','pmean35','pmean36','pmean37','pmean38','pmean39','pmean40')  
p50 <- c('pmean41','pmean42','pmean43','pmean44','pmean45','pmean46','pmean47','pmean48','pmean49','pmean50')   
p60 <- c('pmean51','pmean52','pmean53','pmean54','pmean55','pmean56','pmean57','pmean58','pmean59','pmean60')
p70 <- c('pmean61','pmean62','pmean63','pmean64','pmean65','pmean66','pmean67','pmean68','pmean69','pmean70')
p80 <- c('pmean71','pmean72','pmean73','pmean74','pmean75','pmean76','pmean77','pmean78','pmean79','pmean80') 
p90 <- c('pmean81','pmean82','pmean83','pmean84','pmean85','pmean86','pmean87','pmean88','pmean89','pmean90')   
p100 <- c('pmean91','pmean92','pmean93','pmean94','pmean95','pmean96','pmean97','pmean98','pmean99','pmean100')
#### 
hg38_10x_PBMCCoverage_means_DF$pmeanAve10 <-
  rowMeans(hg38_10x_PBMCCoverage_means_DF[c(p10)],na.rm=TRUE)
hg38_10x_PBMCCoverage_means_DF$pmeanAve20 <-
  rowMeans(hg38_10x_PBMCCoverage_means_DF[c(p20)],na.rm=TRUE)
hg38_10x_PBMCCoverage_means_DF$pmeanAve30 <-
  rowMeans(hg38_10x_PBMCCoverage_means_DF[c(p30)],na.rm=TRUE)
hg38_10x_PBMCCoverage_means_DF$pmeanAve40 <-
  rowMeans(hg38_10x_PBMCCoverage_means_DF[c(p40)],na.rm=TRUE)
hg38_10x_PBMCCoverage_means_DF$pmeanAve50 <-
  rowMeans(hg38_10x_PBMCCoverage_means_DF[c(p50)],na.rm=TRUE)
hg38_10x_PBMCCoverage_means_DF$pmeanAve60 <-
  rowMeans(hg38_10x_PBMCCoverage_means_DF[c(p60)],na.rm=TRUE)
hg38_10x_PBMCCoverage_means_DF$pmeanAve70 <-
  rowMeans(hg38_10x_PBMCCoverage_means_DF[c(p70)],na.rm=TRUE)
hg38_10x_PBMCCoverage_means_DF$pmeanAve80 <-
  rowMeans(hg38_10x_PBMCCoverage_means_DF[c(p80)],na.rm=TRUE)
hg38_10x_PBMCCoverage_means_DF$pmeanAve90 <-
  rowMeans(hg38_10x_PBMCCoverage_means_DF[c(p90)],na.rm=TRUE)
hg38_10x_PBMCCoverage_means_DF$pmeanAve100 <-
  rowMeans(hg38_10x_PBMCCoverage_means_DF[c(p100)],na.rm=TRUE)
### 
hg38_10x_PBMCCoverage_means_DF <- hg38_10x_PBMCCoverage_means_DF[,-c(2:101)] 