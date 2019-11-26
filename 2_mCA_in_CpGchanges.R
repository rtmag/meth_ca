library(liftOver)
#system("wget http://hgdownload.cse.ucsc.edu/goldenpath/hg19/liftOver/hg19ToHg38.over.chain.gz")
#system("gunzip hg19ToHg38.over.chain.gz")
dmr <- read.csv("mmc3_DMR.csv")

peaksori = dmr[,1:3]

  peaks <- GRanges(peaksori[,1],IRanges(peaksori[,2], peaksori[,3]))
  ch <- import.chain("hg19ToHg38.over.chain")
  cur19 <- rtracklayer::liftOver(peaks, ch)
  cur19 <- unlist(cur19)
  GenomeInfoDb::genome(cur19) <- "hg38"
  cur19_df <- data.frame(cur19)
  dmrhg38 <- cur19_df[,c("seqnames","start","end")]


dmr[,1] <- dmrhg38[,1]
dmr[,2] <- dmrhg38[,2]
dmr[,3] <- dmrhg38[,3]

dmr3<-dmr[dmr$diffDMRClusterSmall==3,]

