#20190614
source('../../all_r_files/hg38_10x_PBMC_all_r.r')
library(magicfor)
library(reshape)
library(ggplot2)
vars <- ls()
nvars <- length(vars)
hg38_10x_PBMCCoverageValues <-list()
j <- 1
for(i in 1:nvars)
{
  if(class(get(vars[i]))=="numeric")
  {
    hg38_10x_PBMCCoverageValues[[j]] <- get(vars[i])
    names(hg38_10x_PBMCCoverageValues)[j] <- vars[i]
    j <- j+1
  }
}
magic_for(silent = TRUE)
for (h in vars)
{
  pmean1<- hg38_10x_PBMCCoverageValues[[h]][1]
  pmean2<- hg38_10x_PBMCCoverageValues[[h]][2]
  pmean3<- hg38_10x_PBMCCoverageValues[[h]][3]
  pmean4<- hg38_10x_PBMCCoverageValues[[h]][4]
  pmean5<- hg38_10x_PBMCCoverageValues[[h]][5]
  pmean6<- hg38_10x_PBMCCoverageValues[[h]][6]
  pmean7<- hg38_10x_PBMCCoverageValues[[h]][7]
  pmean8<- hg38_10x_PBMCCoverageValues[[h]][8]
  pmean9<- hg38_10x_PBMCCoverageValues[[h]][9]
  pmean10<- hg38_10x_PBMCCoverageValues[[h]][10]
  pmean11<- hg38_10x_PBMCCoverageValues[[h]][11]
  pmean12<- hg38_10x_PBMCCoverageValues[[h]][12]
  pmean13<- hg38_10x_PBMCCoverageValues[[h]][13]
  pmean14<- hg38_10x_PBMCCoverageValues[[h]][14]
  pmean15<- hg38_10x_PBMCCoverageValues[[h]][15]
  pmean16<- hg38_10x_PBMCCoverageValues[[h]][16]
  pmean17<- hg38_10x_PBMCCoverageValues[[h]][17]
  pmean18<- hg38_10x_PBMCCoverageValues[[h]][18]
  pmean19<- hg38_10x_PBMCCoverageValues[[h]][19]
  pmean20<- hg38_10x_PBMCCoverageValues[[h]][20]
  pmean21<- hg38_10x_PBMCCoverageValues[[h]][21]
  pmean22<- hg38_10x_PBMCCoverageValues[[h]][22]
  pmean23<- hg38_10x_PBMCCoverageValues[[h]][23]
  pmean24<- hg38_10x_PBMCCoverageValues[[h]][24]
  pmean25<- hg38_10x_PBMCCoverageValues[[h]][25]
  pmean26<- hg38_10x_PBMCCoverageValues[[h]][26]
  pmean27<- hg38_10x_PBMCCoverageValues[[h]][27]
  pmean28<- hg38_10x_PBMCCoverageValues[[h]][28]
  pmean29<- hg38_10x_PBMCCoverageValues[[h]][29]
  pmean30<- hg38_10x_PBMCCoverageValues[[h]][30]
  pmean31<- hg38_10x_PBMCCoverageValues[[h]][31]
  pmean32<- hg38_10x_PBMCCoverageValues[[h]][32]
  pmean33<- hg38_10x_PBMCCoverageValues[[h]][33]
  pmean34<- hg38_10x_PBMCCoverageValues[[h]][34]
  pmean35<- hg38_10x_PBMCCoverageValues[[h]][35]
  pmean36<- hg38_10x_PBMCCoverageValues[[h]][36]
  pmean37<- hg38_10x_PBMCCoverageValues[[h]][37]
  pmean38<- hg38_10x_PBMCCoverageValues[[h]][38]
  pmean39<- hg38_10x_PBMCCoverageValues[[h]][39]
  pmean40<- hg38_10x_PBMCCoverageValues[[h]][40]
  pmean41<- hg38_10x_PBMCCoverageValues[[h]][41]
  pmean42<- hg38_10x_PBMCCoverageValues[[h]][42]
  pmean43<- hg38_10x_PBMCCoverageValues[[h]][43]
  pmean44<- hg38_10x_PBMCCoverageValues[[h]][44]
  pmean45<- hg38_10x_PBMCCoverageValues[[h]][45]
  pmean46<- hg38_10x_PBMCCoverageValues[[h]][46]
  pmean47<- hg38_10x_PBMCCoverageValues[[h]][47]
  pmean48<- hg38_10x_PBMCCoverageValues[[h]][48]
  pmean49<- hg38_10x_PBMCCoverageValues[[h]][49]
  pmean50<- hg38_10x_PBMCCoverageValues[[h]][50]
  pmean51<- hg38_10x_PBMCCoverageValues[[h]][51]
  pmean52<- hg38_10x_PBMCCoverageValues[[h]][52]
  pmean53<- hg38_10x_PBMCCoverageValues[[h]][53]
  pmean54<- hg38_10x_PBMCCoverageValues[[h]][54]
  pmean55<- hg38_10x_PBMCCoverageValues[[h]][55]
  pmean56<- hg38_10x_PBMCCoverageValues[[h]][56]
  pmean57<- hg38_10x_PBMCCoverageValues[[h]][57]
  pmean58<- hg38_10x_PBMCCoverageValues[[h]][58]
  pmean59<- hg38_10x_PBMCCoverageValues[[h]][59]
  pmean60<- hg38_10x_PBMCCoverageValues[[h]][60]
  pmean61<- hg38_10x_PBMCCoverageValues[[h]][61]
  pmean62<- hg38_10x_PBMCCoverageValues[[h]][62]
  pmean63<- hg38_10x_PBMCCoverageValues[[h]][63]
  pmean64<- hg38_10x_PBMCCoverageValues[[h]][64]
  pmean65<- hg38_10x_PBMCCoverageValues[[h]][65]
  pmean66<- hg38_10x_PBMCCoverageValues[[h]][66]
  pmean67<- hg38_10x_PBMCCoverageValues[[h]][67]
  pmean68<- hg38_10x_PBMCCoverageValues[[h]][68]
  pmean69<- hg38_10x_PBMCCoverageValues[[h]][69]
  pmean70<- hg38_10x_PBMCCoverageValues[[h]][70]
  pmean71<- hg38_10x_PBMCCoverageValues[[h]][71]
  pmean72<- hg38_10x_PBMCCoverageValues[[h]][72]
  pmean73<- hg38_10x_PBMCCoverageValues[[h]][73]
  pmean74<- hg38_10x_PBMCCoverageValues[[h]][74]
  pmean75<- hg38_10x_PBMCCoverageValues[[h]][75]
  pmean76<- hg38_10x_PBMCCoverageValues[[h]][76]
  pmean77<- hg38_10x_PBMCCoverageValues[[h]][77]
  pmean78<- hg38_10x_PBMCCoverageValues[[h]][78]
  pmean79<- hg38_10x_PBMCCoverageValues[[h]][79]
  pmean80<- hg38_10x_PBMCCoverageValues[[h]][80]
  pmean81<- hg38_10x_PBMCCoverageValues[[h]][81]
  pmean82<- hg38_10x_PBMCCoverageValues[[h]][82]
  pmean83<- hg38_10x_PBMCCoverageValues[[h]][83]
  pmean84<- hg38_10x_PBMCCoverageValues[[h]][84]
  pmean85<- hg38_10x_PBMCCoverageValues[[h]][85]
  pmean86<- hg38_10x_PBMCCoverageValues[[h]][86]
  pmean87<- hg38_10x_PBMCCoverageValues[[h]][87]
  pmean88<- hg38_10x_PBMCCoverageValues[[h]][88]
  pmean89<- hg38_10x_PBMCCoverageValues[[h]][89]
  pmean90<- hg38_10x_PBMCCoverageValues[[h]][90]
  pmean91<- hg38_10x_PBMCCoverageValues[[h]][91]
  pmean92<- hg38_10x_PBMCCoverageValues[[h]][92]
  pmean93<- hg38_10x_PBMCCoverageValues[[h]][93]
  pmean94<- hg38_10x_PBMCCoverageValues[[h]][94]
  pmean95<- hg38_10x_PBMCCoverageValues[[h]][95]
  pmean96<- hg38_10x_PBMCCoverageValues[[h]][96]
  pmean97<- hg38_10x_PBMCCoverageValues[[h]][97]
  pmean98<- hg38_10x_PBMCCoverageValues[[h]][98]
  pmean99<- hg38_10x_PBMCCoverageValues[[h]][99]
  pmean100<- hg38_10x_PBMCCoverageValues[[h]][100]
  put(pmean1,pmean2,pmean3,pmean4,pmean5,pmean6,pmean7,pmean8,pmean9,pmean10,pmean11,pmean12,pmean13,pmean14,pmean15,pmean16,pmean17,pmean18,pmean19,pmean20,
      pmean21,pmean22,pmean23,pmean24,pmean25,pmean26,pmean27,pmean28,pmean29,pmean30,pmean31,pmean32,pmean33,pmean34,pmean35,pmean36,pmean37,pmean38,pmean39,
      pmean40,pmean41,pmean42,pmean43,pmean44,pmean45,pmean46,pmean47,pmean48,pmean49,pmean50,pmean51,pmean52,pmean53,pmean54,pmean55,pmean56,pmean57,pmean58,
      pmean59,pmean60,pmean61,pmean62,pmean63,pmean64,pmean65,pmean66,pmean67,pmean68,pmean69,pmean70,pmean71,pmean72,pmean73,pmean74,pmean75,pmean76,pmean77,
      pmean78,pmean79,pmean80,pmean81,pmean82,pmean83,pmean84,pmean85,pmean86,pmean87,pmean88,pmean89,pmean90,pmean91,pmean92,pmean93,pmean94,pmean95,pmean96,
      pmean97,pmean98,pmean99,pmean100)
}
hg38_10x_PBMCCoverage_means_DF <- magic_result_as_dataframe()
names(hg38_10x_PBMCCoverage_means_DF)[1] <- "Annotation"
