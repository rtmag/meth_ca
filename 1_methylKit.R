
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
############################################################################################
############################################################################################
