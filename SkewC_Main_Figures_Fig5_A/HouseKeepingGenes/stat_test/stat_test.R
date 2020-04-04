## Testing t-test and mann whitnery u test


m = matrix(runif(100, max=c(rep(1, 50), rep(1.5, 50))), nrow=10) # make some data
apply(m, 1, function(x) t.test(x[1:5], x[6:10])$p.value)

cbdindAll<- cbind(apoptosisGenes_DDDDGood_cells,apoptosisGenes_DDDDSkewed_coverage_cells)

hkgenesPValue <- as.data.frame(apply(cbdindAll, 1, function(x)wilcox.test(x[1:765], x[766:850],
                                                                          alternative = "greater",
                                                                          conf.level = 0.95)$p.value))
names(hkgenesPValue)[1] <- "P-value"
PValue <- hkgenesPValue$`P-value`
hkgenesPValue$adjustedp <- p.adjust(PValue,method="hochberg")

write.table(hkgenesPValue,file = "./apoptosisGenes/stat_test/hkgenesPValue.text",sep = "\t",quote = F)
