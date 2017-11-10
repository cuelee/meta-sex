full_ncf<-read.table("/Users/cuelee/OneDrive/Mint/meta-sex/tables/all/AF_reml_nc.rst",header=T)
full_ncm<-read.table("/Users/cuelee/OneDrive/Mint/meta-sex/tables/all/AM_reml_nc.rst",header=T)
full_cf<-read.table("/Users/cuelee/OneDrive/Mint/meta-sex/tables/all/AF_reml.rst",header=T)
full_cm<-read.table("/Users/cuelee/OneDrive/Mint/meta-sex/tables/all/AM_reml.rst",header=T)
SSTf<-read.table("/Users/cuelee/OneDrive/Mint/meta-sex/tables/female/female_reml.rst",header=T)
SSTm<-read.table("/Users/cuelee/OneDrive/Mint/meta-sex/tables/male/male_reml.rst",header=T)
traits <-as.character(as.matrix(read.table("/Users/cuelee/OneDrive/Mint/meta-sex/tables/all/traits.list")))
rownames(full_ncf)=traits
rownames(full_ncm)=traits
rownames(full_cf)=traits
rownames(full_cm)=traits
rownames(SSTf)=traits
rownames(SSTm)=traits

inst.mat <- matrix(rep(NA,20*10),ncol=20,nrow=10)
tag_f<-which(full_ncf$V_se>full_ncm$V_se)
tag_m<-which(full_ncf$V_se<full_ncm$V_se)

rownames(inst.mat) = traits 
colnames(inst.mat) = colnames(full_ncf)
for ( i in tag_f){
  inst.mat[i,] <- as.matrix(full_cf[i,])
}
for ( i in tag_m){
  inst.mat[i,] <- as.matrix(full_cm[i,])
}

reml.mat <- inst.mat 
write.table(reml.mat, "/Users/cuelee/OneDrive/Mint/meta-sex/tables/all/reml.rst", quote=F, row.names=F, col.names=T)
