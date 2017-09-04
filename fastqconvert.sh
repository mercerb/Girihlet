name=$1

gunzip -c ~/Girihlet/${name}.fastq.gz | grep '^[ACGTN]*$' | sort | uniq -c | \
  sort -nr -k 1,1 | sed 's/^ *\([0123456789]*\)/\.\1/' | sed = | \
  sed "N;s/\n//" | sed "s/^\([0123456789]*\)/>ec_rna_L001_R1.\1/" | \
  #sed 's/\([0123456789]\)  *\([ACGTN]\)/\1\n\2/'  > ${name}.fa
  sed -e "s/\([[:digit:]]\) *\([ACGT]\)/\1;\2/" | tr ';' '\n' | > ${name}.fa
