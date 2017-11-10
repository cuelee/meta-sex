## run GCTA to get GRM for subsets (female,)
runGCTA <- "/home/cuelee/OneDrive/Mint/GCTA/gcta_1.26.0/gcta64"
commands <- "--reml --thread-num 10"

traits <- c(
  "bmires",
  "crpres",
  "diares",
  "glures",
  "hdlres",
  "height",
  "insres",
  "ldlres",
  "sysres",
  "tgres"
)


## female GRM runs
input_bfile_female <- "--grm /home/cuelee/OneDrive/Mint/meta-sex/plink_format/female/NFBC_20091001_female"

for (i in 1:length(traits)){
  phenof <- paste("--pheno /home/cuelee/OneDrive/Mint/meta-sex/phenos/data_female/",traits[i],"_ordered_female.tab",sep="")
  outf <- paste("--out /home/cuelee/OneDrive/Mint/meta-sex/reml/female/",traits[i],sep="")

  system(paste(runGCTA, input_bfile_female, commands, phenof, outf))
  
}

## male GRM runs
input_bfile_male <- "--grm /home/cuelee/OneDrive/Mint/meta-sex/plink_format/male/NFBC_20091001_male"

  
for (i in 1:length(traits)){
  
  phenof <- paste("--pheno /home/cuelee/OneDrive/Mint/meta-sex/phenos/data_male/",traits[i],"_ordered_male.tab",sep="")
  outf <- paste("--out /home/cuelee/OneDrive/Mint/meta-sex/reml/male/",traits[i],sep="")
  
  system(paste(runGCTA, input_bfile_male, commands, phenof, outf))
}

# ## all GRM runs
# input_bfile_all <- "--grm /home/cuelee/OneDrive/Mint/meta-sex/plink_format/NFBC_20091001"
# 
# for (i in 1:length(traits)){
#   phenof <- paste("--pheno /home/cuelee/OneDrive/Mint/meta-sex/phenos/all/",traits[i],"_ordered.tab",sep="")
#   outf <- paste("--out /home/cuelee/OneDrive/Mint/meta-sex/reml/all/",traits[i],sep="")
# 
#   system(paste(runGCTA, input_bfile_all, commands, phenof, outf))
# }
