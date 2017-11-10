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
  "V_f",
  "se_f",
  "V_m",
  "se_m",
  "V_se",
  "se_se",
  "V_e",
  "se_e",
  "V_p",
  "se_p",
  "V_h1",
  "se_h1",
  "V_h2",
  "se_h2",
  "V_h3",
  "se_h3",
  "V_h4",
  "se_h4"
)

### create all_reml
inst.mat <- matrix(rep(NA,20*10),ncol=20,nrow=10)
rownames(inst.mat) = traits 
colnames(inst.mat) = col_desc
for ( i in c(1,2,3,5,6,7,8,9,10)){
  dat <- as.matrix(read.table(paste("/Users/cuelee/OneDrive/Mint/meta-sex/reml/all/",traits[i],".hsq",sep=""),fill=T,header=T))
  inst.mat[i,c(1,2)] <- as.numeric(dat[1,c(2:3)])
  inst.mat[i,c(3,4)] <- as.numeric(dat[2,c(2:3)])
  inst.mat[i,c(5,6)] <- as.numeric(dat[3,c(2:3)])
  inst.mat[i,c(7,8)] <- as.numeric(dat[4,c(2:3)])
  inst.mat[i,c(9,10)] <- as.numeric(dat[5,c(2:3)])
  inst.mat[i,c(11,12)] <- as.numeric(dat[6,c(2:3)])
  inst.mat[i,c(13,14)] <- as.numeric(dat[7,c(2:3)])
  inst.mat[i,c(15,16)] <- as.numeric(dat[8,c(2:3)])
  inst.mat[i,c(17,18)] <- as.numeric(dat[9,c(2:3)])
  inst.mat[i,c(19,20)] <- as.numeric(dat[10,c(2:3)])
}
reml <- inst.mat
write.table(reml, "/Users/cuelee/OneDrive/Mint/meta-sex/tables/all/reml.rst", quote=F, row.names = F, col.names = T)
write.table(traits,"/Users/cuelee/OneDrive/Mint/meta-sex/tables/all/traits.list",row.names=F,col.names=F,quote=F)
