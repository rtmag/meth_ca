~/myPrograms/Bismark/bismark --bowtie2 --multicore 50 \
/root/resources/hg38_bismark_vanilla/ \
-1 /root/annalisa_wgbs/trimmed/K562_AZA_2uM_48h_1_val_1.fq.gz \
-2 /root/annalisa_wgbs/trimmed/K562_AZA_2uM_48h_2_val_2.fq.gz
#2

for bamfile in /home/rtm/methCA/fastq_trim/*R1_val*fq.gz;
do ls -lh $bamfile; 
name=${bamfile//\/home\/rtm\/vivek\/navi\/wes3\/bam\/} ;
sample=${name//\.recalibrated\.bam} ;
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I $bamfile \
-tumor $sample \
-O /home/rtm/vivek/navi/wes3/vcf_test/all_$sample.vcf.gz
done
