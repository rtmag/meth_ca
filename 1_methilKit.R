
library(methylKit)

file.list=list( 
"/home/rtm/methCA/bismark_methylation/WT_D0_rep1_rescued_R1_val_1_bismark_bt2_pe.CX_report.txt.gz"
"/home/rtm/methCA/bismark_methylation/WT_D0_rep2_R1_val_1_bismark_bt2_pe.CX_report.txt.gz",
"/home/rtm/methCA/bismark_methylation/WT_D6_rep1_R1_val_1_bismark_bt2_pe.CX_report.txt.gz",
"/home/rtm/methCA/bismark_methylation/WT_D6_rep3_R1_val_1_bismark_bt2_pe.CX_report.txt.gz",
"/home/rtm/methCA/bismark_methylation/WT_D6_rep4_R1_val_1_bismark_bt2_pe.CX_report.txt.gz"
 )

myobj=methRead(file.list,
           sample.id=list("D0","D0","D6","D6","D6"),
           assembly="hg38",
           treatment=c(0,0,1,1,1),
           context="CpG",
           pipeline="bismarkCytosineReport",
           header=FALSE,
           mincov=3)
           
meth=unite(myobj, destrand=TRUE,mc.cores=22)
myDiff=calculateDiffMeth(meth,num.cores=40)

