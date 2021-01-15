#!/bin/bash

ldsc_munge_h2.sh -f ../clean_data/wheeze_clean.txt.gz -o ../results \
  -t wheeze -m '--N-col NMISS --a2 A2 --snp SNPID_UKB --ignore SNP' \
  -p 0.2 -s 0.2
  