zcat /home/rtm/methCA/fastq_cat/WT_D0_rep1_R2.fastq.gz|perl -pe 's/CAAACCCTATAAAAAACAATTTAATATCATCTATCAAAATTACAAATACACAAACCATTTAACCCAACAATCCCACATCCAAAAATCTA\@D151BACXX120918\:8\:2111\:21075\:14470/CAAACCCTATAAAAAACAATTTAATATCATCTATCAAAATTACAAATACACAAACCATTTAACCCAACAATCCCACATCCAAAAATCTA\n\@D151BACXX120918\:8\:2111\:21075\:14470/g' >  /home/rtm/methCA/fastq_cat/WT_D0_rep1_R2_rescued.fastq  

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc \
-o /home/rtm/methCA/fastq_trim/ \
/home/rtm/methCA/fastq_cat/rescued/WT_D0_rep1_rescued_R1.fastq \
/home/rtm/methCA/fastq_cat/rescued/WT_D0_rep1_rescued_R2.fastq ;

##########
cat WT_D0_R1*_2.fastq.gz > ../fastq_cat/rescued/WT_D0_rep1_R2_cat2ndtry.fastq.gz


/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc \
-o /home/rtm/methCA/fastq_cat/rescued \
/home/rtm/methCA/fastq_cat/WT_D0_rep1_R1.fastq.gz \
/home/rtm/methCA/fastq_cat/rescued/WT_D0_rep1_R2_cat2ndtry.fastq.gz ;

zcat /home/rtm/methCA/fastq_cat/rescued/WT_D0_rep1_R2_cat2ndtry.fastq.gz| head -n 515201479| tail -n +515201465

@D151BACXX120918:7:1315:4443:96864/2
CAAACCCTATAAAAAACAATTTAATATCATCTATCAAAATTACAAATACACAAACCATTTAACCCAACAATCCCACATCCAAAAATCTA

zcat /home/rtm/methCA/fastq_cat/WT_D0_rep1_R2.fastq.gz|perl -pe 's/\@D151BACXX120918\:7\:1315\:4443\:96864\/2\nCAAACCCTATAAAAAACAATTTAATATCATCTATCAAAATTACAAATACACAAACCATTTAACCCAACAATCCCACATCCAAAAATCTA//' >  /home/rtm/methCA/fastq_cat/WT_D0_rep1_R2_rescued.fastq 

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc \
-o /home/rtm/methCA/fastq_trim/ \
/home/rtm/methCA/fastq_cat/rescued/WT_D0_rep1_rescued_R1.fastq \
/home/rtm/methCA/fastq_cat/rescued/WT_D0_rep1_rescued_R2.fastq ;
