
library(methylKit)

file.list=list( 
"/home/rtm/methCA/bismark_methylation/dumps/WT_D0_rep1_CG.report.txt.gz",
"/home/rtm/methCA/bismark_methylation/dumps/WT_D0_rep2_CG.report.txt.gz",
"/home/rtm/methCA/bismark_methylation/dumps/WT_D6_rep1_CG.report.txt.gz",
"/home/rtm/methCA/bismark_methylation/dumps/WT_D6_rep3_CG.report.txt.gz",
"/home/rtm/methCA/bismark_methylation/dumps/WT_D6_rep4_CG.report.txt.gz"
 )

myobj=methRead(file.list,
           sample.id=list("D0_1_CG","D0_2_CG","D6_1_CG","D6_3_CG","D6_4_CG"),
           assembly="hg38",
           treatment=c(0,0,1,1,1),
           context="CpG",
           pipeline="bismarkCytosineReport",
           header=FALSE,
           mincov=3)
           
meth=unite(myobj, destrand=TRUE,mc.cores=22)
myDiff=calculateDiffMeth(meth,num.cores=40)
saveRDS(myDiff,"D6_vs_D0_CpG_mydiff.rds")
############################################################################################
############################################################################################

file.list=list( 
"/home/rtm/methCA/bismark_methylation/dumps/WT_D0_rep1_CA.report.txt.gz",
"/home/rtm/methCA/bismark_methylation/dumps/WT_D0_rep2_CA.report.txt.gz",
"/home/rtm/methCA/bismark_methylation/dumps/WT_D6_rep1_CA.report.txt.gz",
"/home/rtm/methCA/bismark_methylation/dumps/WT_D6_rep3_CA.report.txt.gz",
"/home/rtm/methCA/bismark_methylation/dumps/WT_D6_rep4_CA.report.txt.gz"
 )

CAmyobj=methRead(file.list,
           sample.id=list("D0_1_CA","D0_2_CA","D6_1_CA","D6_3_CA","D6_4_CA"),
           assembly="hg38",
           treatment=c(0,0,1,1,1),
           context="none",
           pipeline="bismarkCytosineReport",
           header=FALSE,
           mincov=6)
           
CAmeth=unite(CAmyobj, destrand=FALSE,mc.cores=22)
CAmyDiff=calculateDiffMeth(CAmeth,num.cores=40)
saveRDS(CAmyDiff,"D6_vs_D0_CpA_mydiff.rds")
############################################################################################
############################################################################################

#pooled CG
library(methylKit)

file.list=list( 
"/home/rtm/methCA/bismark_methylation/dumps/WT_D0_rep1_CA.report.txt.gz",
"/home/rtm/methCA/bismark_methylation/dumps/WT_D0_rep2_CA.report.txt.gz",
"/home/rtm/methCA/bismark_methylation/dumps/WT_D6_rep1_CA.report.txt.gz",
"/home/rtm/methCA/bismark_methylation/dumps/WT_D6_rep3_CA.report.txt.gz",
"/home/rtm/methCA/bismark_methylation/dumps/WT_D6_rep4_CA.report.txt.gz"
 )

CAmyobj=methRead(file.list,
           sample.id=list("D0_1_CA","D0_2_CA","D6_1_CA","D6_3_CA","D6_4_CA"),
           assembly="hg38",
           treatment=c(0,0,1,1,1),
           context="none",
           pipeline="bismarkCytosineReport",
           header=FALSE,
           mincov=5)

CAmyobj_normalized <- normalizeCoverage(CAmyobj,method="median")
rm(CAmyobj,file.list)
CAmeth=unite(CAmyobj_normalized, destrand=FALSE,mc.cores=22,min.per.group=1L)
dim(CAmeth)
rm(CAmyobj_normalized)
CAmeth_pool <- pool(CAmeth,sample.ids=c("D0","D6"))
dim(CAmeth_pool)
saveRDS(CAmeth_pool,"CAmeth_d0d6_normalized_united_pooled.rds")
rm(CAmeth)
CAmyDiff=calculateDiffMeth(CAmeth_pool,num.cores=40)
rm(CAmeth_pool)
saveRDS(CAmyDiff,"D6_vs_D0_CpA_mydiff_fisher_pooled.rds")
############################################################################################
############################################################################################
#pooled CA
library(methylKit)

file.list=list( 
"/home/rtm/methCA/bismark_methylation/dumps/WT_D0_rep1_CG.report.txt.gz",
"/home/rtm/methCA/bismark_methylation/dumps/WT_D0_rep2_CG.report.txt.gz",
"/home/rtm/methCA/bismark_methylation/dumps/WT_D6_rep1_CG.report.txt.gz",
"/home/rtm/methCA/bismark_methylation/dumps/WT_D6_rep3_CG.report.txt.gz",
"/home/rtm/methCA/bismark_methylation/dumps/WT_D6_rep4_CG.report.txt.gz"
 )

CGmyobj=methRead(file.list,
           sample.id=list("D0_1_CG","D0_2_CG","D6_1_CG","D6_3_CG","D6_4_CG"),
           assembly="hg38",
           treatment=c(0,0,1,1,1),
           context="none",
           pipeline="bismarkCytosineReport",
           header=FALSE,
           mincov=5)

CGmyobj_normalized <- normalizeCoverage(CGmyobj,method="median")
rm(CGmyobj,file.list)
CGmeth=unite(CGmyobj_normalized, destrand=TRUE,mc.cores=22,min.per.group=1L)
dim(CGmeth)
rm(CGmyobj_normalized)
CGmeth_pool <- pool(CGmeth,sample.ids=c("D0","D6"))
dim(CGmeth_pool)
saveRDS(CGmeth_pool,"CGmeth_d0d6_normalized_united_pooled.rds")
rm(CGmeth)
CGmyDiff=calculateDiffMeth(CGmeth_pool,num.cores=40)
rm(CGmeth_pool)
saveRDS(CGmyDiff,"D6_vs_D0_CpA_mydiff_fisher_pooled.rds")
###
###
###
dfmydiff<- getData(CAmyDiff)

pdf("meth_change_dist_density_d0_d6.pdf")
plot(density(dfmydiff[dfmydiff$qvalue<=0.05,'meth.diff']))
dev.off()

rm(list = ls())

