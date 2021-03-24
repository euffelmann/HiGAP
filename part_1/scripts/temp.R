# script to explore data

library("data.table")
library("dplyr")

pheno <- fread("part_1/raw_data/phenoGenotypeFiles/PhenotypeFiles/phs000607.v3.pht003445.v3.p2.c1.Neurodevelopmental_Genomics_Subject_Phenotypes.GRU-NPU.txt.gz",
              skip = 10)

length(unique(pheno$dbGaP_Subject_ID)) # 9496
pheno_clean <- pheno[!(pheno$INT_NUM == 1 & pheno$SUBJID %in% pheno$SUBJID[duplicated(pheno$SUBJID)])]
# clean file

keep_headers <- c("SUBJID", 
                  "ADD011", "ADD012", "ADD013", "ADD014", "ADD015", "ADD016", "ADD020","ADD021", "ADD022", # attention-deficit-disorder
                  "DEP001", "DEP002", "DEP004", "DEP006", # depression
                  "PSY001", "PSY020", "PSY029", "PSY050", "PSY060", "PSY070", "PSY071") # psychosis phenotype

keep_headers %in% names(pheno_clean) # to check if all to-be-selected variables are present in the data

pheno_clean <- subset(pheno_clean, select = keep_headers)
pheno_clean[pheno_clean == 9] <- NA

pheno_clean <- pheno_clean %>% 
  mutate(ADD_sum = pheno_clean %>% select(starts_with("ADD")) %>% rowSums(na.rm = T),
         DEP_sum = pheno_clean %>% select(starts_with("DEP")) %>% rowSums(na.rm = T),
         PSY_sum = pheno_clean %>% select(starts_with("PSY")) %>% rowSums(na.rm = T))

keep_headers <- c("SUBJID", "ADD_sum", "DEP_sum", "PSY_sum")
pheno_sum <- subset(pheno_clean, select = keep_headers)
summary(pheno_sum) # here I have a sum score for three phenotypes per individual
