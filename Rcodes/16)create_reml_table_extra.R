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

### create all_reml
inst.mat <- matrix(rep(NA,8*10),ncol=8,nrow=10)
rownames(inst.mat) = traits 
colnames(inst.mat) = col_desc
for ( i in c(1,2,3,4,5,6,7,8,9,10)){
  dat <- as.matrix(read.table(paste("/Users/cuelee/OneDrive/Mint/meta-sex/reml/extra/",traits[i],".hsq",sep=""),fill=T,header=T))
  inst.mat[i,c(1,2)] <- as.numeric(dat[1,c(2:3)])
  inst.mat[i,c(3,4)] <- as.numeric(dat[2,c(2:3)])
  inst.mat[i,c(5,6)] <- as.numeric(dat[3,c(2:3)])
  inst.mat[i,c(7,8)] <- as.numeric(dat[4,c(2:3)])
}
reml <- inst.mat
write.table(reml, "/Users/cuelee/OneDrive/Mint/meta-sex/tables/extra/reml.rst", quote=F, row.names = F, col.names = T)
write.table(traits,"/Users/cuelee/OneDrive/Mint/meta-sex/tables/extra/traits.list",row.names=F,col.names=F,quote=F)
