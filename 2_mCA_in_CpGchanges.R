library(liftOver)
system("wget http://hgdownload.cse.ucsc.edu/goldenpath/hg19/liftOver/hg19ToHg38.over.chain.gz")
system("gunzip hg19ToHg38.over.chain.gz")
dmr <- read.csv("mmc3_DMR.csv")

hg19Tohg38 <- function(peaks)
{
  peaks <- GRanges(peak_ori[,1],IRanges(peak_ori[,2], peak_ori[,3]))
  ch <- import.chain("hg19ToHg38.over.chain")
  cur19 <- suppressWarnings(rtracklayer::liftOver(peaks, ch))
  cur19 <- unlist(cur19)
  GenomeInfoDb::genome(cur19) <- "hg38"
  cur19_df <- data.frame(cur19)
  return(cur19_df[,c("seqnames","start","end")])
}

dmrhg38<- hg19Tohg38(dmr[,1:3])
dmr[,1] <- dmrhg38[,1]
dmr[,2] <- dmrhg38[,2]
dmr[,3] <- dmrhg38[,3]

dmr3<-dmr[dmr$diffDMRClusterSmall==3,]

