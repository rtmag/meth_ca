#EDIT biosample from geo
more biosample_result.txt |grep -v "Organism|Accession" -P|perl -pe 's/^\d{1,2}\.\s//g'|perl -pe 's/GSM.+\n/HOLAMUNDO\n/g'| \
perl -pe 's/Identifiers.+SRA\:\s/\t/g'|perl -pe 's/\n//g'|perl -pe 's/; GEO: HOLAMUNDO/\n/g' > biosample_result_edited.txt

#Download
while read line; do
SRA=$(echo $line|cut -f2 -d' ');
echo $SRA;
/home/rtm/myprograms/sratoolkit.2.9.6-1-centos_linux64/bin/fastq-dump --split-files --gzip $SRA;
done < biosample_result_edited.txt
