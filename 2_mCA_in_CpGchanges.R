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

dmr1<-dmr_filtered[dmr_filtered$diffDMRClusterSmall==1,]
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

  dmr1.gr <- dmr1[,1:3]
  colnames(dmr1.gr) <- c("chr","start","end")
  dmr1.gr <- makeGRangesFromDataFrame(dmr1.gr) 

  dmr3.gr <- dmr3[,1:3]
  colnames(dmr3.gr) <- c("chr","start","end")
  dmr3.gr <- makeGRangesFromDataFrame(dmr3.gr) 

    hits1 <- findOverlaps(ca_united.gr, dmr1.gr)
    hits1.df <- as.data.frame(hits1)

    hits3 <- findOverlaps(ca_united.gr, dmr3.gr)
    hits3.df <- as.data.frame(hits3)


  ca_united_dmr1 <- ca_united[unique(hits1.df[,1]),]
  dm1_beta_d0<-ca_united_dmr1$numCs1/ca_united_dmr1$coverage1
  dm1_beta_d6<-ca_united_dmr1$numCs2/ca_united_dmr1$coverage2

pdf("dmr1_betaScore_density_mCpA_d0_d6.pdf")
plot(density(dm1_beta_d0),ylim=c(0,180),col="black",lwd=2)
lines(density(dm1_beta_d6),col="red",lwd=2)
legend("topright",legend=c("D0","D6"),fill=c("black","red"),bty = "n")
dev.off()

ca_united_dmr3 <- ca_united[unique(hits3.df[,1]),]
  dm3_beta_d0<-ca_united_dmr3$numCs1/ca_united_dmr3$coverage1
  dm3_beta_d6<-ca_united_dmr3$numCs2/ca_united_dmr3$coverage2

pdf("dmr3_betaScore_density_mCpA_d0_d6.pdf")
plot(density(dm3_beta_d0),ylim=c(0,180),col="black",lwd=2)
lines(density(dm3_beta_d6),col="red",lwd=2)
legend("topright",legend=c("D0","D6"),fill=c("black","red"),bty = "n")
dev.off()

####
table(mydiff$qvalue<=0.05 & mydiff$meth.diff>20)
  


  dmr1.gr <- dmr1[,1:3]
  colnames(dmr1.gr) <- c("chr","start","end")
  dmr1.gr <- makeGRangesFromDataFrame(dmr1.gr) 

  dmr3.gr <- dmr3[,1:3]
  colnames(dmr3.gr) <- c("chr","start","end")
  dmr3.gr <- makeGRangesFromDataFrame(dmr3.gr) 


  ca_united.gr <- mydiff[,1:3]
  ca_united.gr[,3] <- ca_united.gr[,3]+1
  colnames(ca_united.gr) <- c("chr","start","end")
  ca_united.gr <- makeGRangesFromDataFrame(ca_united.gr) 



    hits1 <- findOverlaps(ca_united.gr, dmr1.gr)
    hits1.df <- as.data.frame(hits1)

    hits3 <- findOverlaps(ca_united.gr, dmr3.gr)
    hits3.df <- as.data.frame(hits3)


  ca_united_dmr1 <- mydiff[unique(hits1.df[,1]),]
  dm1_beta_d0<-ca_united_dmr1$meth.diff
  dm1_beta_d6<-ca_united_dmr1$meth.diff

pdf("dmr1_methdiff_density_mCpA_d0_d6.pdf")
plot(density(dm1_beta_d0),ylim=c(0,180),col="black",lwd=2)
lines(density(dm1_beta_d6),col="red",lwd=2)
legend("topright",legend=c("D0","D6"),fill=c("black","red"),bty = "n")
dev.off()

ca_united_dmr3 <- mydiff[unique(hits3.df[,1]),]
  dm3_beta_d0<-ca_united_dmr3$meth.diff
  dm3_beta_d6<-ca_united_dmr3$meth.diff

pdf("dmr3_methdiff_density_mCpA_d0_d6.pdf")
plot(density(dm3_beta_d0),ylim=c(0,180),col="black",lwd=2)
lines(density(dm3_beta_d6),col="red",lwd=2)
legend("topright",legend=c("D0","D6"),fill=c("black","red"),bty = "n")
dev.off()
