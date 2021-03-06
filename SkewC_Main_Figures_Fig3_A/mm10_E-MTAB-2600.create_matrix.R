#20190603
library(magicfor)
library(reshape)
library(ggplot2)
vars <- ls(pattern = "ERR")
nvars <- length(vars)
E_MTAB_2600CoverageValues <-list()
j <- 1
for(i in 1:nvars)
{
  if(class(get(vars[i]))=="numeric")
  {
    E_MTAB_2600CoverageValues[[j]] <- get(vars[i])
    names(E_MTAB_2600CoverageValues)[j] <- vars[i]
    j <- j+1
  }
}
magic_for(silent = TRUE)
for (h in vars)
{
  pmean1<- E_MTAB_2600CoverageValues[[h]][1]
  pmean2<- E_MTAB_2600CoverageValues[[h]][2]
  pmean3<- E_MTAB_2600CoverageValues[[h]][3]
  pmean4<- E_MTAB_2600CoverageValues[[h]][4]
  pmean5<- E_MTAB_2600CoverageValues[[h]][5]
  pmean6<- E_MTAB_2600CoverageValues[[h]][6]
  pmean7<- E_MTAB_2600CoverageValues[[h]][7]
  pmean8<- E_MTAB_2600CoverageValues[[h]][8]
  pmean9<- E_MTAB_2600CoverageValues[[h]][9]
  pmean10<- E_MTAB_2600CoverageValues[[h]][10]
  pmean11<- E_MTAB_2600CoverageValues[[h]][11]
  pmean12<- E_MTAB_2600CoverageValues[[h]][12]
  pmean13<- E_MTAB_2600CoverageValues[[h]][13]
  pmean14<- E_MTAB_2600CoverageValues[[h]][14]
  pmean15<- E_MTAB_2600CoverageValues[[h]][15]
  pmean16<- E_MTAB_2600CoverageValues[[h]][16]
  pmean17<- E_MTAB_2600CoverageValues[[h]][17]
  pmean18<- E_MTAB_2600CoverageValues[[h]][18]
  pmean19<- E_MTAB_2600CoverageValues[[h]][19]
  pmean20<- E_MTAB_2600CoverageValues[[h]][20]
  pmean21<- E_MTAB_2600CoverageValues[[h]][21]
  pmean22<- E_MTAB_2600CoverageValues[[h]][22]
  pmean23<- E_MTAB_2600CoverageValues[[h]][23]
  pmean24<- E_MTAB_2600CoverageValues[[h]][24]
  pmean25<- E_MTAB_2600CoverageValues[[h]][25]
  pmean26<- E_MTAB_2600CoverageValues[[h]][26]
  pmean27<- E_MTAB_2600CoverageValues[[h]][27]
  pmean28<- E_MTAB_2600CoverageValues[[h]][28]
  pmean29<- E_MTAB_2600CoverageValues[[h]][29]
  pmean30<- E_MTAB_2600CoverageValues[[h]][30]
  pmean31<- E_MTAB_2600CoverageValues[[h]][31]
  pmean32<- E_MTAB_2600CoverageValues[[h]][32]
  pmean33<- E_MTAB_2600CoverageValues[[h]][33]
  pmean34<- E_MTAB_2600CoverageValues[[h]][34]
  pmean35<- E_MTAB_2600CoverageValues[[h]][35]
  pmean36<- E_MTAB_2600CoverageValues[[h]][36]
  pmean37<- E_MTAB_2600CoverageValues[[h]][37]
  pmean38<- E_MTAB_2600CoverageValues[[h]][38]
  pmean39<- E_MTAB_2600CoverageValues[[h]][39]
  pmean40<- E_MTAB_2600CoverageValues[[h]][40]
  pmean41<- E_MTAB_2600CoverageValues[[h]][41]
  pmean42<- E_MTAB_2600CoverageValues[[h]][42]
  pmean43<- E_MTAB_2600CoverageValues[[h]][43]
  pmean44<- E_MTAB_2600CoverageValues[[h]][44]
  pmean45<- E_MTAB_2600CoverageValues[[h]][45]
  pmean46<- E_MTAB_2600CoverageValues[[h]][46]
  pmean47<- E_MTAB_2600CoverageValues[[h]][47]
  pmean48<- E_MTAB_2600CoverageValues[[h]][48]
  pmean49<- E_MTAB_2600CoverageValues[[h]][49]
  pmean50<- E_MTAB_2600CoverageValues[[h]][50]
  pmean51<- E_MTAB_2600CoverageValues[[h]][51]
  pmean52<- E_MTAB_2600CoverageValues[[h]][52]
  pmean53<- E_MTAB_2600CoverageValues[[h]][53]
  pmean54<- E_MTAB_2600CoverageValues[[h]][54]
  pmean55<- E_MTAB_2600CoverageValues[[h]][55]
  pmean56<- E_MTAB_2600CoverageValues[[h]][56]
  pmean57<- E_MTAB_2600CoverageValues[[h]][57]
  pmean58<- E_MTAB_2600CoverageValues[[h]][58]
  pmean59<- E_MTAB_2600CoverageValues[[h]][59]
  pmean60<- E_MTAB_2600CoverageValues[[h]][60]
  pmean61<- E_MTAB_2600CoverageValues[[h]][61]
  pmean62<- E_MTAB_2600CoverageValues[[h]][62]
  pmean63<- E_MTAB_2600CoverageValues[[h]][63]
  pmean64<- E_MTAB_2600CoverageValues[[h]][64]
  pmean65<- E_MTAB_2600CoverageValues[[h]][65]
  pmean66<- E_MTAB_2600CoverageValues[[h]][66]
  pmean67<- E_MTAB_2600CoverageValues[[h]][67]
  pmean68<- E_MTAB_2600CoverageValues[[h]][68]
  pmean69<- E_MTAB_2600CoverageValues[[h]][69]
  pmean70<- E_MTAB_2600CoverageValues[[h]][70]
  pmean71<- E_MTAB_2600CoverageValues[[h]][71]
  pmean72<- E_MTAB_2600CoverageValues[[h]][72]
  pmean73<- E_MTAB_2600CoverageValues[[h]][73]
  pmean74<- E_MTAB_2600CoverageValues[[h]][74]
  pmean75<- E_MTAB_2600CoverageValues[[h]][75]
  pmean76<- E_MTAB_2600CoverageValues[[h]][76]
  pmean77<- E_MTAB_2600CoverageValues[[h]][77]
  pmean78<- E_MTAB_2600CoverageValues[[h]][78]
  pmean79<- E_MTAB_2600CoverageValues[[h]][79]
  pmean80<- E_MTAB_2600CoverageValues[[h]][80]
  pmean81<- E_MTAB_2600CoverageValues[[h]][81]
  pmean82<- E_MTAB_2600CoverageValues[[h]][82]
  pmean83<- E_MTAB_2600CoverageValues[[h]][83]
  pmean84<- E_MTAB_2600CoverageValues[[h]][84]
  pmean85<- E_MTAB_2600CoverageValues[[h]][85]
  pmean86<- E_MTAB_2600CoverageValues[[h]][86]
  pmean87<- E_MTAB_2600CoverageValues[[h]][87]
  pmean88<- E_MTAB_2600CoverageValues[[h]][88]
  pmean89<- E_MTAB_2600CoverageValues[[h]][89]
  pmean90<- E_MTAB_2600CoverageValues[[h]][90]
  pmean91<- E_MTAB_2600CoverageValues[[h]][91]
  pmean92<- E_MTAB_2600CoverageValues[[h]][92]
  pmean93<- E_MTAB_2600CoverageValues[[h]][93]
  pmean94<- E_MTAB_2600CoverageValues[[h]][94]
  pmean95<- E_MTAB_2600CoverageValues[[h]][95]
  pmean96<- E_MTAB_2600CoverageValues[[h]][96]
  pmean97<- E_MTAB_2600CoverageValues[[h]][97]
  pmean98<- E_MTAB_2600CoverageValues[[h]][98]
  pmean99<- E_MTAB_2600CoverageValues[[h]][99]
  pmean100<- E_MTAB_2600CoverageValues[[h]][100]
  put(pmean1,pmean2,pmean3,pmean4,pmean5,pmean6,pmean7,pmean8,pmean9,pmean10,pmean11,pmean12,pmean13,pmean14,pmean15,pmean16,pmean17,pmean18,pmean19,pmean20,
      pmean21,pmean22,pmean23,pmean24,pmean25,pmean26,pmean27,pmean28,pmean29,pmean30,pmean31,pmean32,pmean33,pmean34,pmean35,pmean36,pmean37,pmean38,pmean39,
      pmean40,pmean41,pmean42,pmean43,pmean44,pmean45,pmean46,pmean47,pmean48,pmean49,pmean50,pmean51,pmean52,pmean53,pmean54,pmean55,pmean56,pmean57,pmean58,
      pmean59,pmean60,pmean61,pmean62,pmean63,pmean64,pmean65,pmean66,pmean67,pmean68,pmean69,pmean70,pmean71,pmean72,pmean73,pmean74,pmean75,pmean76,pmean77,
      pmean78,pmean79,pmean80,pmean81,pmean82,pmean83,pmean84,pmean85,pmean86,pmean87,pmean88,pmean89,pmean90,pmean91,pmean92,pmean93,pmean94,pmean95,pmean96,
      pmean97,pmean98,pmean99,pmean100)
}
E_MTAB_2600Coverage_means_DF <- magic_result_as_dataframe()
names(E_MTAB_2600Coverage_means_DF)[1] <- "Annotation"
