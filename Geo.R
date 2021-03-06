# your floder where all pages are saved
setwd("~/Desktop/Git/CpG/Something_Cool-CpG_Sites-")
#good luck

# DataSet <-read.fasta("DengueVirus1.fasta_pruned.mu.trim05.txt")
source("MeaFreq.R")
# must place your file as a txt takes a few minutes 
DF<-meanFreq('Name of virus')
DF$wtnt<-as.character(DF$wtnt)

source("WTAA.R")
DF<-getWTAA(DF)

source("MUTAA.R")
DF<-getMUTAA(DF)

source("Drastic_AA_Change.R")
DF<-big_aa_change(DF)

source("SynNonSyn.R")
DF<-synFunction(DF)

source("CPG_Function.R")
DF<-CPG_site(DF)

# graphs 
#how to make them into pdf w/ r code - good naming schematic (w/ .pdf at end)
source("Synonymous and nonsynonymous graph.R")
SynNonsynAT(DF)
SynNonsynCG(DF)


source("MakesCPG Graph.R")
CPGNoCPGAT(DF)

source("CPG_Syn_Nonsyn_graph.R")
comparing_CpG_Syn_Nonsyn (DF)

# Wilcox test
source("stats.R")
Wilcox_test(DF)

#########
########


