all.fam <- read.table("/Users/cuelee/OneDrive/Mint/meta-sex/plink_format/NFBC_20091001.fam",header=F)
all.ids <- as.matrix(all.fam[,c(1:2)])

pheno.all <- as.matrix(read.table("/Users/cuelee/OneDrive/Mint/meta-sex/phenos/all/bmires_ordered.tab",header=F)[,c(1:2)])
if(all(all.ids[,1] == pheno.all[,1])){
  inst.mat <- all.fam[,c(1,2)]
  cov <- rep(-9,nrow(inst.mat)) 
  male_tag <- which(all.fam[,5]==1)
  female_tag <- which(all.fam[,5]==2)
  
  ## make male = 0 and female = 1 as described in GCTA manual 
  cov[male_tag] = 0
  cov[female_tag] = 1
  
  if(sum((cov == 1)) + sum((cov == 0)) == nrow(all.fam)){
    inst.mat <- cbind(inst.mat,cov)
    write.table(inst.mat,"/Users/cuelee/OneDrive/Mint/meta-sex/plink_format/covar/NFBC_20091001.covar",quote=F,row.names=F, col.names=F)
  }
  
}
