# script to extract emails from PubMed based on PMIDs from GWAS catalog
# useful blog-post: http://www.biotechworld.it/bioinf/2016/01/05/querying-pubmed-via-the-easypubmed-package-in-r/

library(data.table)
library(tidyverse)
library(lubridate)
library(easyPubMed)


my_pmids <- fread("recruitment/gwasCatalogStudies13012021.tsv")
my_pmids <- my_pmids[order(as.Date(my_pmids$DATE)),] # sort by date
my_pmids$DATE <- as.Date(my_pmids$DATE)

# filter for GWASs from the last 3 years that were successful in finding associations
my_pmids1 <- my_pmids %>%
  filter(DATE >= ymd("2015-01-01") & DATE < ymd("2016-01-01") & `ASSOCIATION COUNT` >= 10) # association count as a (bad) proxy for sufficient sample size / large GWAS
my_pmids1 <- my_pmids1$`PUBMED ID`

pmid_data1 <- fetch_PMID_data(pmids = my_pmids1)

all_data1 <- table_articles_byAuth(pubmed_data = pmid_data1, included_authors = "last",
                                getKeywords = F, autofill = F, max_chars = 1)
emails1 <- all_data1$email
clean_emails1 <- emails1[!is.na(emails1)]
clean_emails1 <- unique(clean_emails1)
write.table(t(clean_emails1), file ="recruitment/gwasEmails_2015.csv", sep=",", 
            row.names=FALSE, col.names =FALSE, quote = FALSE)
.rs.restartR()


my_pmids <- fread("recruitment/gwasCatalogStudies13012021.tsv")
my_pmids <- my_pmids[order(as.Date(my_pmids$DATE)),] # sort by date
my_pmids$DATE <- as.Date(my_pmids$DATE)
my_pmids2 <- my_pmids %>%
  filter(DATE >= ymd("2016-01-01") & DATE < ymd("2017-01-01") & `ASSOCIATION COUNT` >= 10) # association count as a (bad) proxy for sufficient sample size / large GWAS

my_pmids2 <- my_pmids2$`PUBMED ID`

pmid_data2 <- fetch_PMID_data(pmids = my_pmids2)

all_data2 <- table_articles_byAuth(pubmed_data = pmid_data2, included_authors = "last",
                                   getKeywords = F, autofill = F, max_chars = 1)
emails2 <- all_data2$email
clean_emails2 <- emails2[!is.na(emails2)]
clean_emails2 <- unique(clean_emails2)
write.table(t(clean_emails2), file ="recruitment/gwasEmails_2016.csv", sep=",", 
            row.names=FALSE, col.names =FALSE, quote = FALSE)
.rs.restartR()
rm(list = ls())


my_pmids <- fread("recruitment/gwasCatalogStudies13012021.tsv")
my_pmids <- my_pmids[order(as.Date(my_pmids$DATE)),] # sort by date
my_pmids$DATE <- as.Date(my_pmids$DATE)
my_pmids3 <- my_pmids %>%
  filter(DATE >= ymd("2017-01-01") & DATE < ymd("2018-01-01") & `ASSOCIATION COUNT` >= 100) # association count as a (bad) proxy for sufficient sample size / large GWAS

my_pmids3 <- my_pmids3$`PUBMED ID`

pmid_data3 <- fetch_PMID_data(pmids = my_pmids3)

all_data3 <- table_articles_byAuth(pubmed_data = pmid_data3, included_authors = "last",
                                   getKeywords = F, autofill = F, max_chars = 1)
emails3 <- all_data3$email
clean_emails3 <- emails3[!is.na(emails3)]
clean_emails3 <- unique(clean_emails3)
write.table(t(clean_emails3), file ="recruitment/gwasEmails_2017.csv", sep=",", 
            row.names=FALSE, col.names =FALSE, quote = FALSE)
.rs.restartR()
rm(list = ls())


my_pmids <- fread("recruitment/gwasCatalogStudies13012021.tsv")
my_pmids <- my_pmids[order(as.Date(my_pmids$DATE)),] # sort by date
my_pmids$DATE <- as.Date(my_pmids$DATE)
my_pmids4 <- my_pmids %>%
  filter(DATE >= ymd("2018-01-01") & DATE < ymd("2019-01-01") & `ASSOCIATION COUNT` >= 50) # association count as a (bad) proxy for sufficient sample size / large GWAS

my_pmids4 <- my_pmids4$`PUBMED ID`

pmid_data4 <- fetch_PMID_data(pmids = my_pmids4)

all_data4 <- table_articles_byAuth(pubmed_data = pmid_data4, included_authors = "last",
                                   getKeywords = F, autofill = F, max_chars = 1)
emails4 <- all_data4$email
clean_emails4 <- emails4[!is.na(emails4)]
clean_emails4 <- unique(clean_emails4)
write.table(t(clean_emails4), file ="recruitment/gwasEmails_2018.csv", sep=",", 
            row.names=FALSE, col.names =FALSE, quote = FALSE)
.rs.restartR()
rm(list = ls())


my_pmids <- fread("recruitment/gwasCatalogStudies13012021.tsv")
my_pmids <- my_pmids[order(as.Date(my_pmids$DATE)),] # sort by date
my_pmids$DATE <- as.Date(my_pmids$DATE)
my_pmids5 <- my_pmids %>%
  filter(DATE >= ymd("2019-01-01") & DATE < ymd("2020-01-01") & `ASSOCIATION COUNT` >= 50) # association count as a (bad) proxy for sufficient sample size / large GWAS

my_pmids5 <- my_pmids5$`PUBMED ID`

pmid_data5 <- fetch_PMID_data(pmids = my_pmids5)

all_data5 <- table_articles_byAuth(pubmed_data = pmid_data5, included_authors = "last",
                                   getKeywords = F, autofill = F, max_chars = 1)
emails5 <- all_data5$email
clean_emails5 <- emails5[!is.na(emails5)]
clean_emails5 <- unique(clean_emails5)
write.table(t(clean_emails5), file ="recruitment/gwasEmails_2019.csv", sep=",", 
            row.names=FALSE, col.names =FALSE, quote = FALSE)
.rs.restartR()
rm(list = ls())


my_pmids <- fread("recruitment/gwasCatalogStudies13012021.tsv")
my_pmids <- my_pmids[order(as.Date(my_pmids$DATE)),] # sort by date
my_pmids$DATE <- as.Date(my_pmids$DATE)
my_pmids6 <- my_pmids %>%
  filter(DATE >= ymd("2020-01-01") & `ASSOCIATION COUNT` >= 10) # association count as a (bad) proxy for sufficient sample size / large GWAS

my_pmids6 <- my_pmids6$`PUBMED ID`

pmid_data6 <- fetch_PMID_data(pmids = my_pmids6)

all_data6 <- table_articles_byAuth(pubmed_data = pmid_data6, included_authors = "last",
                                   getKeywords = F, autofill = F, max_chars = 1)
emails6 <- all_data6$email
clean_emails6 <- emails6[!is.na(emails6)]
clean_emails6 <- unique(clean_emails6)
write.table(t(clean_emails6), file ="recruitment/gwasEmails_2020to2021.csv", sep=",", 
            row.names=FALSE, col.names =FALSE, quote = FALSE)
.rs.restartR()
rm(list = ls())

#laod data
emails_2015 <- scan("recruitment/gwasEmails_2015.csv", character(), sep = ",")
emails_2016 <- scan("recruitment/gwasEmails_2016.csv", character(), sep = ",")
emails_2017 <- scan("recruitment/gwasEmails_2017.csv", character(), sep = ",")
emails_2018 <- scan("recruitment/gwasEmails_2018.csv", character(), sep = ",")
emails_2019 <- scan("recruitment/gwasEmails_2019.csv", character(), sep = ",")
emails_2020to2021 <- scan("recruitment/gwasEmails_2020to2021.csv", character(), sep = ",")

emails_2015t02021 <- c(emails_2015, emails_2016, emails_2017, emails_2018,
                       emails_2019, emails_2020to2021)
emails_2015t02021 <- unique(emails_2015t02021)
write.table(t(emails_2015t02021), file ="recruitment/gwasEmails_2015t02021.csv", sep=",", 
            row.names=FALSE, col.names =FALSE, quote = FALSE)
