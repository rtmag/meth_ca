zcat /home/rtm/methCA/fastq_cat/WT_D0_rep1_R2.fastq.gz|perl -pe 's/CAAACCCTATAAAAAACAATTTAATATCATCTATCAAAATTACAAATACACAAACCATTTAACCCAACAATCCCACATCCAAAAATCTA\@D151BACXX120918\:8\:2111\:21075\:14470/CAAACCCTATAAAAAACAATTTAATATCATCTATCAAAATTACAAATACACAAACCATTTAACCCAACAATCCCACATCCAAAAATCTA\n\@D151BACXX120918\:8\:2111\:21075\:14470/g' >  /home/rtm/methCA/fastq_cat/WT_D0_rep1_R2_rescued.fastq  
