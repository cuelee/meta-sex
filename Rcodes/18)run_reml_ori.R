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


for ( i in 1:10){
  input_grm <- "--grm /home/cuelee/OneDrive/Mint/meta-sex/plink_format/NFBC_20091001"
  phenof <- paste("--pheno /home/cuelee/OneDrive/Mint/meta-sex/phenos/all/",traits[i],"_ordered.tab",sep="")
  outf <- paste("--out /home/cuelee/OneDrive/Mint/meta-sex/",traits[i],sep="")
  covf <- "--covar /home/cuelee/OneDrive/Mint/meta-sex/plink_format/covar/NFBC_20091001.covar"
  system(paste(runGCTA, input_grm, commands, covf, phenof, outf))
}
