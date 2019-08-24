#EDIT biosample from geo
more biosample_result.txt |grep -v "Organism|Accession" -P|perl -pe 's/^\d{1,2}\.\s//g'|perl -pe 's/GSM.+\n/HOLAMUNDO\n/g'| \
perl -pe 's/Identifiers.+SRA\:\s/\t/g'|perl -pe 's/\n//g'|perl -pe 's/; GEO: HOLAMUNDO/\n/g' > biosample_result_edited.txt

#Download
while read line; do
SRA=$(echo $line|cut -f2 -d' ');
echo $SRA;
/home/rtm/myprograms/sratoolkit.2.9.6-1-centos_linux64/bin/fastq-dump --split-files --gzip $SRA;
done <  biosample_result_edited.txt


while read line; do
SRA=$(echo $line|cut -f2 -d' ');
echo $SRA;
/home/rtm/myprograms/sratoolkit.2.9.6-1-centos_linux64/bin/fastq-dump --split-files --gzip $SRA;
done < mice_biosample_result_edited.txt

sudo /home/rtm/myprograms/Bismark/bismark_genome_preparation --bowtie2 /home/references/mm10_noScaffold/


/home/rtm/myprograms/Bismark/bismark_genome_preparation --bowtie2 /home/rtm/resources/hg38_bs_quy/

/home/rtm/myprograms/Bismark/bismark_methylation_extractor --multicore 22 --gzip --buffer_size 150G --paired-end --ample_memory --comprehensive --cytosine_report --CX_context --genome_folder /home/rtm/resources/hg38_bs_quy/ /home/rtm/DNA_methylation_and_gene_splicing/WGBS/bismark_alignment/WT_D0/WT_D0.Rep2.read1_bismark_bt2_pe.bam
/home/rtm/myprograms/Bismark/bismark_methylation_extractor --multicore 22 --gzip --buffer_size 150G --paired-end --ample_memory --comprehensive --cytosine_report --CX_context --genome_folder /home/rtm/resources/hg38_bs_quy/ /home/rtm/DNA_methylation_and_gene_splicing/WGBS/bismark_alignment/WT_D14/WT_D14.Rep1.read1_bismark_bt2_pe.bam
/home/rtm/myprograms/Bismark/bismark_methylation_extractor --multicore 22 --gzip --buffer_size 150G --paired-end --ample_memory --comprehensive --cytosine_report --CX_context --genome_folder /home/rtm/resources/hg38_bs_quy/ /home/rtm/DNA_methylation_and_gene_splicing/WGBS/bismark_alignment/WT_D14/WT_D14.Rep3.read1_bismark_bt2_pe.bam
/home/rtm/myprograms/Bismark/bismark_methylation_extractor --multicore 22 --gzip --buffer_size 150G --paired-end --ample_memory --comprehensive --cytosine_report --CX_context --genome_folder /home/rtm/resources/hg38_bs_quy/ /home/rtm/DNA_methylation_and_gene_splicing/WGBS/bismark_alignment/WT_D14/WT_D14.Rep4.read1_bismark_bt2_pe.bam
/home/rtm/myprograms/Bismark/bismark_methylation_extractor --multicore 22 --gzip --buffer_size 150G --paired-end --ample_memory --comprehensive --cytosine_report --CX_context --genome_folder /home/rtm/resources/hg38_bs_quy/ /home/rtm/DNA_methylation_and_gene_splicing/WGBS/bismark_alignment/WT_D6/WT_D6.Rep1.read1_bismark_bt2_pe.bam
/home/rtm/myprograms/Bismark/bismark_methylation_extractor --multicore 22 --gzip --buffer_size 150G --paired-end --ample_memory --comprehensive --cytosine_report --CX_context --genome_folder /home/rtm/resources/hg38_bs_quy/ /home/rtm/DNA_methylation_and_gene_splicing/WGBS/bismark_alignment/WT_D6/WT_D6.Rep3.read1_bismark_bt2_pe.bam
/home/rtm/myprograms/Bismark/bismark_methylation_extractor --multicore 22 --gzip --buffer_size 150G --paired-end --ample_memory --comprehensive --cytosine_report --CX_context --genome_folder /home/rtm/resources/hg38_bs_quy/ /home/rtm/DNA_methylation_and_gene_splicing/WGBS/bismark_alignment/WT_D6/WT_D6.Rep4.read1_bismark_bt2_pe.bam


