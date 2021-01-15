
### HiGAP GWAS
### QC script
### October 2020
### Emil Uffelmann


require(data.table)
require(qqman)
require(R.utils)
require(tidyverse)

# change manually for the name of the sum_stats file to be cleaned
wheeze <- fread("part_2/raw_data/f.2316.0.0_logistic.EUR.sumstats.MACfilt.txt.gz")

maccut <- 100/min(wheeze$NCHROBS,na.rm=T)
# maccut <- 100/(min(full$totalN,na.rm=T)*2)
maccut
# If HWE not available:
wheeze_clean <- wheeze[MAF > maccut & INFO_UKB > .6,]

head(wheeze_clean)
dim(wheeze)
dim(wheeze_clean)
hist(wheeze_clean$MAF)
hist(wheeze_clean$INFO)

# Remove monomorphic and indels, if included
table(nchar(wheeze_clean$A1)==1)
table(nchar(wheeze_clean$A2)==1)
table(wheeze_clean$A1 == wheeze_clean$A2)

# drop columns that aren't needed
wheeze_clean$ambig <- NULL

# Re-check and save wheeze_clean files
summary(wheeze_clean)
round(table(wheeze_clean$CHR)/sum(table(wheeze_clean$CHR)),3)

outputPrefix <- "part_2/plots/qc/wheeze" # change manually

png(paste0(outputPrefix,"_BETA_Hist.png"),width=30,height=15,units="cm",res=300)
hist(wheeze_clean$OR)
dev.off()

png(paste0(outputPrefix,"_BETA_Box_Chr.png"),width=30,height=15,units="cm",res=300)
boxplot(wheeze_clean$OR ~ wheeze_clean$CHR)
dev.off()

png(paste0(outputPrefix,"_SE_Box_Chr.png"),width=30,height=15,units="cm",res=300)
boxplot(wheeze_clean$SE ~ wheeze_clean$CHR)
dev.off()

png(paste0(outputPrefix,"_SE_Hist.png"),width=30,height=15,units="cm",res=300)
hist(wheeze_clean$SE)
dev.off()

png(paste0(outputPrefix,"_P_Hist.png"),width=30,height=15,units="cm",res=300)
hist(wheeze_clean$P)
dev.off()

png(paste0(outputPrefix,"_MAF_Hist.png"),width=30,height=15,units="cm",res=300)
hist(wheeze_clean$MAF)
dev.off()

png(paste0(outputPrefix,"_INFO_Hist.png"),width=30,height=15,units="cm",res=300)
hist(wheeze_clean$INFO)
dev.off()


# manhattan and qq plots
width <- 30
height <- 20
res <- 1000
cond <- as.logical(wheeze_clean[,"P",with=F][[1]]>0)


png(paste0(outputPrefix, "_mahattan.png"),width=width,height=height,units="cm",res=res)
manhattan(wheeze_clean[cond,], chr="CHR", bp="BP", snp="SNP", p="P", col = c("#C66E4E", "#FFC97F"), 
          annotatePval = F, suggestiveline = F)
dev.off()

png(paste0(outputPrefix, "_qqplot.png"),width=width,height=height,units="cm",res=res)
qq(as.numeric(wheeze_clean[,"P",with=F][[1]]))
dev.off()

fwrite(wheeze_clean,"part_2/clean_data/wheeze_clean.txt",quote=F,row.names=F,sep=" ")

# for FUMA
wheeze_clean_fuma <- wheeze_clean[,c(1,2,3,4,7,8,12,13,14)]
fwrite(wheeze_clean_fuma,"part_2/clean_data/wheeze_clean.txt",quote=F,row.names=F,sep=" ")









