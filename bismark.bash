###########
# BIsmark align

for fastq in /home/rtm/methCA/fastq_trim/*R1_val_1.fq.gz;
do ls -lh $fastq; 
fastq2=$(echo $fastqfile|perl -pe "s/R1_val_1/R2_val_2/g") ;
/home/rtm/myprograms/Bismark/bismark --bowtie2 --multicore 22 \
/home/rtm/resources/hg38_bs_quy/ \
-1 $fastq \
-2 $fastq2 \
--output_dir /home/rtm/methCA/bam/ ;
done
