
cat WT_D0_R1*_1.fastq.gz > WT_D0_rep1_R1.fastq.gz
cat WT_D0_R1*_2.fastq.gz > WT_D0_rep1_R2.fastq.gz

cat WT_D0_R2*_1.fastq.gz > WT_D0_rep2_R1.fastq.gz
cat WT_D0_R2*_2.fastq.gz > WT_D0_rep2_R2.fastq.gz

mv WT_D6_R1_l1_1.fastq.gz WT_D6_rep1_R1.fastq.gz
mv WT_D6_R1_l1_2.fastq.gz WT_D6_rep1_R2.fastq.gz

cat WT_D6_R3*_1.fastq.gz > WT_D6_rep3_R1.fastq.gz
cat WT_D6_R3*_2.fastq.gz > WT_D6_rep3_R2.fastq.gz

cat WT_D6_R4*_1.fastq.gz > WT_D6_rep4_R1.fastq.gz
cat WT_D6_R4*_2.fastq.gz > WT_D6_rep4_R2.fastq.gz

mv WT_D14_R1_l1_1.fastq.gz WT_D14_rep1_R1.fastq.gz
mv WT_D14_R1_l1_2.fastq.gz WT_D14_rep1_R2.fastq.gz

cat WT_D14_R3*_1.fastq.gz > WT_D14_rep3_R1.fastq.gz
cat WT_D14_R3*_2.fastq.gz > WT_D14_rep3_R2.fastq.gz

cat WT_D14_R4*_1.fastq.gz > WT_D14_rep4_R1.fastq.gz
cat WT_D14_R4*_2.fastq.gz > WT_D14_rep4_R2.fastq.gz

#######
for bamfile in /home/rtm/methCA/fastq_cat/*R1.fastq.gz ;
do echo $bamfile; 
sample2=$(echo $bamfile|perl -pe "s/R1/R2/g") ;
/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/methCA/fastq_trim/ $bamfile $sample2 ;
done
