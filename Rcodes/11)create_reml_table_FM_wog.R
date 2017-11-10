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
  "se_h3"
)

### create allFemale_reml
inst.mat <- matrix(rep(NA,16*10),ncol=16,nrow=10)
rownames(inst.mat) = traits 
colnames(inst.mat) = col_desc
for ( i in c(1,2,3,4,5,6,7,8,9,10)){
  if(file.exists(paste("/Users/cuelee/OneDrive/Mint/meta-sex/reml/all/Female/",traits[i],"_wog.hsq",sep="")))  {
    dat <- as.matrix(read.table(paste("/Users/cuelee/OneDrive/Mint/meta-sex/reml/all/Female/",traits[i],"_wog.hsq",sep=""),fill=T,header=T))
    inst.mat[i,c(1,2)] <- as.numeric(dat[1,c(2:3)])
    inst.mat[i,c(3,4)] <- as.numeric(dat[2,c(2:3)])
    inst.mat[i,c(5,6)] <- as.numeric(dat[3,c(2:3)])
    inst.mat[i,c(7,8)] <- as.numeric(dat[4,c(2:3)])
    inst.mat[i,c(9,10)] <- as.numeric(dat[5,c(2:3)])
    inst.mat[i,c(11,12)] <- as.numeric(dat[6,c(2:3)])
    inst.mat[i,c(13,14)] <- as.numeric(dat[7,c(2:3)])
    inst.mat[i,c(15,16)] <- as.numeric(dat[8,c(2:3)])
    }
}
reml <- inst.mat
write.table(reml, "/Users/cuelee/OneDrive/Mint/meta-sex/tables/all/AF_reml_wog.rst", quote=F, row.names = F, col.names = T)
write.table(traits,"/Users/cuelee/OneDrive/Mint/meta-sex/tables/all/AF_traits_wog.list",row.names=F,col.names=F,quote=F)



### create allmale_reml
inst.mat <- matrix(rep(NA,16*10),ncol=16,nrow=10)
rownames(inst.mat) = traits 
colnames(inst.mat) = col_desc
for ( i in c(1,2,3,4,5,6,7,8,9,10)){
  if(file.exists(paste("/Users/cuelee/OneDrive/Mint/meta-sex/reml/all/Male/",traits[i],"_wog.hsq",sep=""))) { 
    dat <- as.matrix(read.table(paste("/Users/cuelee/OneDrive/Mint/meta-sex/reml/all/Male/",traits[i],"_wog.hsq",sep=""),fill=T,header=T)) 
    inst.mat[i,c(1,2)] <- as.numeric(dat[1,c(2:3)])
    inst.mat[i,c(3,4)] <- as.numeric(dat[2,c(2:3)])
    inst.mat[i,c(5,6)] <- as.numeric(dat[3,c(2:3)])
    inst.mat[i,c(7,8)] <- as.numeric(dat[4,c(2:3)])
    inst.mat[i,c(9,10)] <- as.numeric(dat[5,c(2:3)])
    inst.mat[i,c(11,12)] <- as.numeric(dat[6,c(2:3)])
    inst.mat[i,c(13,14)] <- as.numeric(dat[7,c(2:3)])
    inst.mat[i,c(15,16)] <- as.numeric(dat[8,c(2:3)])
    }
}
reml <- inst.mat
write.table(reml, "/Users/cuelee/OneDrive/Mint/meta-sex/tables/all/AM_reml_wog.rst", quote=F, row.names = F, col.names = T)
write.table(traits,"/Users/cuelee/OneDrive/Mint/meta-sex/tables/all/AM_traits_wog.list",row.names=F,col.names=F,quote=F)
