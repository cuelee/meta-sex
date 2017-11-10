## run GCTA to get GRM for subsets (female,)
runGCTA <- "/home/cuelee/OneDrive/Mint/GCTA/gcta_1.26.0/gcta64"
commands <- "--reml --reml-no-lrt --thread-num 10"
# gcta64  ::reml  ::mgrm multi_grm.txt  ::pheno test.phen  ::reml:no:lrt  ::out test_mgrm   

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

for ( i in 1:length(traits)){
  input_mgrm <- "--mgrm /home/cuelee/OneDrive/Mint/meta-sex/plink_format/modified_GRM/mgrm_IF_wog.txt"
  phenof <- paste("--pheno /home/cuelee/OneDrive/Mint/meta-sex/phenos/all/",traits[i],"_ordered.tab",sep="")
  outf <- paste("--out /home/cuelee/OneDrive/Mint/meta-sex/reml/all/Female/",traits[i],"_wog",sep="")
  covf <- "--covar /home/cuelee/OneDrive/Mint/meta-sex/plink_format/covar/NFBC_20091001.covar"
  system(paste(runGCTA, input_mgrm, commands, covf, phenof, outf))
}


for ( i in  1:length(traits)){
  input_mgrm <- "--mgrm /home/cuelee/OneDrive/Mint/meta-sex/plink_format/modified_GRM/mgrm_IM_wog.txt"
  phenof <- paste("--pheno /home/cuelee/OneDrive/Mint/meta-sex/phenos/all/",traits[i],"_ordered.tab",sep="")
  outf <- paste("--out /home/cuelee/OneDrive/Mint/meta-sex/reml/all/Male/",traits[i],"_wog",sep="")
  covf <- "--covar /home/cuelee/OneDrive/Mint/meta-sex/plink_format/covar/NFBC_20091001.covar"
  system(paste(runGCTA, input_mgrm, commands, covf, phenof, outf))
}
