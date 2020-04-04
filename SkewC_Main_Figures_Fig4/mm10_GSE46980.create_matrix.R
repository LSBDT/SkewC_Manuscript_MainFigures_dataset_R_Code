#20190606
library(magicfor)
library(reshape)
library(ggplot2)
vars <- ls(pattern = "SRR")
nvars <- length(vars)
GSE46980CoverageValues <-list()
j <- 1
for(i in 1:nvars)
{
  if(class(get(vars[i]))=="numeric")
  {
    GSE46980CoverageValues[[j]] <- get(vars[i])
    names(GSE46980CoverageValues)[j] <- vars[i]
    j <- j+1
  }
}
magic_for(silent = TRUE)
for (h in vars)
{
  pmean1<- GSE46980CoverageValues[[h]][1]
  pmean2<- GSE46980CoverageValues[[h]][2]
  pmean3<- GSE46980CoverageValues[[h]][3]
  pmean4<- GSE46980CoverageValues[[h]][4]
  pmean5<- GSE46980CoverageValues[[h]][5]
  pmean6<- GSE46980CoverageValues[[h]][6]
  pmean7<- GSE46980CoverageValues[[h]][7]
  pmean8<- GSE46980CoverageValues[[h]][8]
  pmean9<- GSE46980CoverageValues[[h]][9]
  pmean10<- GSE46980CoverageValues[[h]][10]
  pmean11<- GSE46980CoverageValues[[h]][11]
  pmean12<- GSE46980CoverageValues[[h]][12]
  pmean13<- GSE46980CoverageValues[[h]][13]
  pmean14<- GSE46980CoverageValues[[h]][14]
  pmean15<- GSE46980CoverageValues[[h]][15]
  pmean16<- GSE46980CoverageValues[[h]][16]
  pmean17<- GSE46980CoverageValues[[h]][17]
  pmean18<- GSE46980CoverageValues[[h]][18]
  pmean19<- GSE46980CoverageValues[[h]][19]
  pmean20<- GSE46980CoverageValues[[h]][20]
  pmean21<- GSE46980CoverageValues[[h]][21]
  pmean22<- GSE46980CoverageValues[[h]][22]
  pmean23<- GSE46980CoverageValues[[h]][23]
  pmean24<- GSE46980CoverageValues[[h]][24]
  pmean25<- GSE46980CoverageValues[[h]][25]
  pmean26<- GSE46980CoverageValues[[h]][26]
  pmean27<- GSE46980CoverageValues[[h]][27]
  pmean28<- GSE46980CoverageValues[[h]][28]
  pmean29<- GSE46980CoverageValues[[h]][29]
  pmean30<- GSE46980CoverageValues[[h]][30]
  pmean31<- GSE46980CoverageValues[[h]][31]
  pmean32<- GSE46980CoverageValues[[h]][32]
  pmean33<- GSE46980CoverageValues[[h]][33]
  pmean34<- GSE46980CoverageValues[[h]][34]
  pmean35<- GSE46980CoverageValues[[h]][35]
  pmean36<- GSE46980CoverageValues[[h]][36]
  pmean37<- GSE46980CoverageValues[[h]][37]
  pmean38<- GSE46980CoverageValues[[h]][38]
  pmean39<- GSE46980CoverageValues[[h]][39]
  pmean40<- GSE46980CoverageValues[[h]][40]
  pmean41<- GSE46980CoverageValues[[h]][41]
  pmean42<- GSE46980CoverageValues[[h]][42]
  pmean43<- GSE46980CoverageValues[[h]][43]
  pmean44<- GSE46980CoverageValues[[h]][44]
  pmean45<- GSE46980CoverageValues[[h]][45]
  pmean46<- GSE46980CoverageValues[[h]][46]
  pmean47<- GSE46980CoverageValues[[h]][47]
  pmean48<- GSE46980CoverageValues[[h]][48]
  pmean49<- GSE46980CoverageValues[[h]][49]
  pmean50<- GSE46980CoverageValues[[h]][50]
  pmean51<- GSE46980CoverageValues[[h]][51]
  pmean52<- GSE46980CoverageValues[[h]][52]
  pmean53<- GSE46980CoverageValues[[h]][53]
  pmean54<- GSE46980CoverageValues[[h]][54]
  pmean55<- GSE46980CoverageValues[[h]][55]
  pmean56<- GSE46980CoverageValues[[h]][56]
  pmean57<- GSE46980CoverageValues[[h]][57]
  pmean58<- GSE46980CoverageValues[[h]][58]
  pmean59<- GSE46980CoverageValues[[h]][59]
  pmean60<- GSE46980CoverageValues[[h]][60]
  pmean61<- GSE46980CoverageValues[[h]][61]
  pmean62<- GSE46980CoverageValues[[h]][62]
  pmean63<- GSE46980CoverageValues[[h]][63]
  pmean64<- GSE46980CoverageValues[[h]][64]
  pmean65<- GSE46980CoverageValues[[h]][65]
  pmean66<- GSE46980CoverageValues[[h]][66]
  pmean67<- GSE46980CoverageValues[[h]][67]
  pmean68<- GSE46980CoverageValues[[h]][68]
  pmean69<- GSE46980CoverageValues[[h]][69]
  pmean70<- GSE46980CoverageValues[[h]][70]
  pmean71<- GSE46980CoverageValues[[h]][71]
  pmean72<- GSE46980CoverageValues[[h]][72]
  pmean73<- GSE46980CoverageValues[[h]][73]
  pmean74<- GSE46980CoverageValues[[h]][74]
  pmean75<- GSE46980CoverageValues[[h]][75]
  pmean76<- GSE46980CoverageValues[[h]][76]
  pmean77<- GSE46980CoverageValues[[h]][77]
  pmean78<- GSE46980CoverageValues[[h]][78]
  pmean79<- GSE46980CoverageValues[[h]][79]
  pmean80<- GSE46980CoverageValues[[h]][80]
  pmean81<- GSE46980CoverageValues[[h]][81]
  pmean82<- GSE46980CoverageValues[[h]][82]
  pmean83<- GSE46980CoverageValues[[h]][83]
  pmean84<- GSE46980CoverageValues[[h]][84]
  pmean85<- GSE46980CoverageValues[[h]][85]
  pmean86<- GSE46980CoverageValues[[h]][86]
  pmean87<- GSE46980CoverageValues[[h]][87]
  pmean88<- GSE46980CoverageValues[[h]][88]
  pmean89<- GSE46980CoverageValues[[h]][89]
  pmean90<- GSE46980CoverageValues[[h]][90]
  pmean91<- GSE46980CoverageValues[[h]][91]
  pmean92<- GSE46980CoverageValues[[h]][92]
  pmean93<- GSE46980CoverageValues[[h]][93]
  pmean94<- GSE46980CoverageValues[[h]][94]
  pmean95<- GSE46980CoverageValues[[h]][95]
  pmean96<- GSE46980CoverageValues[[h]][96]
  pmean97<- GSE46980CoverageValues[[h]][97]
  pmean98<- GSE46980CoverageValues[[h]][98]
  pmean99<- GSE46980CoverageValues[[h]][99]
  pmean100<- GSE46980CoverageValues[[h]][100]
  put(pmean1,pmean2,pmean3,pmean4,pmean5,pmean6,pmean7,pmean8,pmean9,pmean10,pmean11,pmean12,pmean13,pmean14,pmean15,pmean16,pmean17,pmean18,pmean19,pmean20,
      pmean21,pmean22,pmean23,pmean24,pmean25,pmean26,pmean27,pmean28,pmean29,pmean30,pmean31,pmean32,pmean33,pmean34,pmean35,pmean36,pmean37,pmean38,pmean39,
      pmean40,pmean41,pmean42,pmean43,pmean44,pmean45,pmean46,pmean47,pmean48,pmean49,pmean50,pmean51,pmean52,pmean53,pmean54,pmean55,pmean56,pmean57,pmean58,
      pmean59,pmean60,pmean61,pmean62,pmean63,pmean64,pmean65,pmean66,pmean67,pmean68,pmean69,pmean70,pmean71,pmean72,pmean73,pmean74,pmean75,pmean76,pmean77,
      pmean78,pmean79,pmean80,pmean81,pmean82,pmean83,pmean84,pmean85,pmean86,pmean87,pmean88,pmean89,pmean90,pmean91,pmean92,pmean93,pmean94,pmean95,pmean96,
      pmean97,pmean98,pmean99,pmean100)
}
GSE46980Coverage_means_DF <- magic_result_as_dataframe()
names(GSE46980Coverage_means_DF)[1] <- "Annotation"
