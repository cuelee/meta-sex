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

## load the hsq file data for 10 traits for sex separated samples
female_remlf <- "/home/cuelee/OneDrive/Mint/meta-sex/tables/female/female_reml.rst"
male_remlf <- "/home/cuelee/OneDrive/Mint/meta-sex/tables/male/male_reml.rst"

## save the error variance of female and male samples 
female_reml <- read.table(female_remlf, header = T )$V_e
male_reml <- read.table(male_remlf, header = T )$V_e

## get the which tags of Vef and Vem 
tag_Vef <- which (female_reml > male_reml)
tag_Vem <- which (female_reml < male_reml)

for ( i in tag_Vef){
  input_mgrm <- "--mgrm /home/cuelee/OneDrive/Mint/meta-sex/plink_format/modified_GRM/mgrm_IF.txt"
  phenof <- paste("--pheno /home/cuelee/OneDrive/Mint/meta-sex/phenos/all/",traits[i],"_ordered.tab",sep="")
  outf <- paste("--out /home/cuelee/OneDrive/Mint/meta-sex/reml/all/",traits[i],sep="")
  covf <- "--covar /home/cuelee/OneDrive/Mint/meta-sex/plink_format/covar/NFBC_20091001.covar"
  system(paste(runGCTA, input_mgrm, commands, covf, phenof, outf))
}


for ( i in tag_Vem){
  input_mgrm <- "--mgrm /home/cuelee/OneDrive/Mint/meta-sex/plink_format/modified_GRM/mgrm_IM.txt"
  phenof <- paste("--pheno /home/cuelee/OneDrive/Mint/meta-sex/phenos/all/",traits[i],"_ordered.tab",sep="")
  outf <- paste("--out /home/cuelee/OneDrive/Mint/meta-sex/reml/all/",traits[i],sep="")
  covf <- "--covar /home/cuelee/OneDrive/Mint/meta-sex/plink_format/covar/NFBC_20091001.covar"
  system(paste(runGCTA, input_mgrm, commands, covf, phenof, outf))
}
