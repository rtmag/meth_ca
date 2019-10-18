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
###########
# 1st try
zcat /home/rtm/methCA/fastq_cat/rescued/WT_D0_rep1_R2_cat2ndtry.fastq.gz| head -n 515201479| tail -n +515201465

@D151BACXX120918:7:1315:4443:96864/2
CAAACCCTATAAAAAACAATTTAATATCATCTATCAAAATTACAAATACACAAACCATTTAACCCAACAATCCCACATCCAAAAATCTA

zcat /home/rtm/methCA/fastq_cat/WT_D0_rep1_R2.fastq.gz|perl -pe 's/\@D151BACXX120918\:7\:1315\:4443\:96864\/2\nCAAACCCTATAAAAAACAATTTAATATCATCTATCAAAATTACAAATACACAAACCATTTAACCCAACAATCCCACATCCAAAAATCTA//' >  /home/rtm/methCA/fastq_cat/WT_D0_rep1_R2_rescued.fastq 

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc \
-o /home/rtm/methCA/fastq_trim/ \
/home/rtm/methCA/fastq_cat/rescued/WT_D0_rep1_rescued_R1.fastq \
/home/rtm/methCA/fastq_cat/rescued/WT_D0_rep1_rescued_R2.fastq ;
###########
# 2nd try 515201471
cat  /home/rtm/methCA/fastq_cat/WT_D0_rep1_R2_rescued.fastq|head -n 515201481| tail -n +515201461

cat /home/rtm/methCA/fastq_cat/WT_D0_rep1_R2_rescued.fastq|perl -pe 's/\@D151BACXX120918\:7\:1315\:4443\:96864\/2\nCAAACCCTATAAAAAACAATTTAATATCATCTATCAAAATTACAAATACACAAACCATTTAACCCAACAATCCCACATCCAAAAATCTA//' > /home/rtm/methCA/fastq_cat/WT_D0_rep1_R2_rescued_2ndTry.fastq 

perl -pe 's/\@D151BACXX120918\:7\:1315\:4443\:96864\/2\n//' /home/rtm/methCA/fastq_cat/WT_D0_rep1_R2_rescued_2ndTry.fastq  > /home/rtm/methCA/fastq_cat/WT_D0_rep1_R2_rescued_2ndTry_final.fastq

cat  /home/rtm/methCA/fastq_cat/WT_D0_rep1_R2_rescued_2ndTry.fastq|head -n 515201481| tail -n +515201461

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc \
-o /home/rtm/methCA/fastq_trim/ \
/home/rtm/methCA/fastq_cat/rescued/WT_D0_rep1_rescued_R1.fastq \
/home/rtm/methCA/fastq_cat/rescued/WT_D0_rep1_R2_rescued_2ndTry_final.fastq ;
