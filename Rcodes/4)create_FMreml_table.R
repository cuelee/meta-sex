## read a hsq
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

col_desc <- c(
  "V_g",
  "se_g",
  "V_e",
  "se_e",
  "V_p",
  "se_p",
  "V_h",
  "se_h"
)

### create female_reml
inst.mat <- matrix(rep(0,8*10),ncol=8,nrow=10)
rownames(inst.mat) = traits 
colnames(inst.mat) = col_desc
for ( i in 1: length(traits)){
  dat <- as.matrix(read.table(paste("/Users/cuelee/OneDrive/Mint/meta-sex/reml/female/",traits[i],".hsq",sep=""),fill=T,header=T))
  inst.mat[i,c(1,2)] <- as.numeric(dat[1,c(2:3)])
  inst.mat[i,c(3,4)] <- as.numeric(dat[2,c(2:3)])
  inst.mat[i,c(5,6)] <- as.numeric(dat[3,c(2:3)])
  inst.mat[i,c(7,8)] <- as.numeric(dat[4,c(2:3)])
}
female_reml <- inst.mat
write.table(female_reml, "/Users/cuelee/OneDrive/Mint/meta-sex/tables/female/female_reml.rst", quote=F, row.names = F, col.names = T)
write.table(traits,"/Users/cuelee/OneDrive/Mint/meta-sex/tables/female/traits.list",row.names=F,col.names=F,quote=F)

### create male_reml
inst.mat <- matrix(rep(0,8*10),ncol=8,nrow=10)
rownames(inst.mat) = traits 
colnames(inst.mat) = col_desc
for ( i in 1: length(traits)){
  dat <- as.matrix(read.table(paste("/Users/cuelee/OneDrive/Mint/meta-sex/reml/male/",traits[i],".hsq",sep=""),fill=T,header=T))
  inst.mat[i,c(1,2)] <- as.numeric(dat[1,c(2:3)])
  inst.mat[i,c(3,4)] <- as.numeric(dat[2,c(2:3)])
  inst.mat[i,c(5,6)] <- as.numeric(dat[3,c(2:3)])
  inst.mat[i,c(7,8)] <- as.numeric(dat[4,c(2:3)])
}
male_reml <- inst.mat
write.table(male_reml, "/Users/cuelee/OneDrive/Mint/meta-sex/tables/male/male_reml.rst", quote=F, row.names = F, col.names = T)
write.table(traits,"/Users/cuelee/OneDrive/Mint/meta-sex/tables/male/traits.list",row.names=F,col.names=F,quote=F)
