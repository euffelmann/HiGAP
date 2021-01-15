# descriptive statistics for 'wheeze and whistle'

#### set-up ####
library(data.table)
library(tidyverse)
library(qqman)

wheeze <- fread("part_2/raw_data/f.2316.0.0_logistic.EUR.sumstats.MACfilt.txt.gz")

#### descriptive statistics ####
head(wheeze)
length(which(wheeze$P < 5e-08))

#### descriptive plots ####
hist(wheeze$P)
hist(wheeze$MAF)
