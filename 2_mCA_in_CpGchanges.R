library(liftOver)
#system("wget http://hgdownload.cse.ucsc.edu/goldenpath/hg19/liftOver/hg19ToHg38.over.chain.gz")
#system("gunzip hg19ToHg38.over.chain.gz")
dmr <- read.csv("mmc3_DMR.csv")
write.table(dmr,"mmc3_DMR.bed",sep="\t",quote=F,row.names=F,col.names=F)


peaksori = dmr[,1:3]

  peaks <- GRanges(peaksori[,1],IRanges(peaksori[,2], peaksori[,3]))
  ch <- import.chain("hg19ToHg38.over.chain")
  cur19 <- rtracklayer::liftOver(peaks, ch)
  lc19= lapply( cur19, length )

dmr_filtered <- dmr[unlist(lc19)==1,]
peaksori_filtered = dmr_filtered[,1:3]
  peaks <- GRanges(peaksori_filtered[,1],IRanges(peaksori_filtered[,2], peaksori_filtered[,3]))
  cur38 <- rtracklayer::liftOver(peaks, ch)
 # lc38= lapply( cur38, length )

  cur38 <- unlist(cur38)
  cur38_df <- data.frame(cur38)

dmr_filtered[,1] <- cur38_df[,1]
dmr_filtered[,2] <- cur38_df[,2]
dmr_filtered[,3] <- cur38_df[,3]

dmr3<-dmr_filtered[dmr_filtered$diffDMRClusterSmall==3,]

mydiff <- readRDS("~/methCA/bismark_methylation/dumps/D6_vs_D0_CpA_mydiff_fisher_pooled.rds")
mydiff <- getData(mydiff)

ca_united <- readRDS("~/methCA/bismark_methylation/dumps/CAmeth_d0d6_normalized_united_pooled.rds")
ca_united <- getData(ca_united)

library(data.table)
library(rtracklayer)

  ca_united.gr <- ca_united[,1:3]
  ca_united.gr[,3] <- ca_united[,3]+1
  colnames(ca_united.gr) <- c("chr","start","end")
  ca_united.gr <- makeGRangesFromDataFrame(ca_united.gr) 

  dmr3.gr <- dmr3[,1:3]
  colnames(dmr3.gr) <- c("chr","start","end")
  dmr3.gr <- makeGRangesFromDataFrame(dmr3.gr) 

    hits <- findOverlaps(ca_united.gr, dmr3.gr)
    hits.df <- as.data.frame(hits)
#  cpg_cell_merged_ori <- ca_united[unique(hits.df[,1]),]
####
