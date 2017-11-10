mgrm_ug_uf_um_if <-
  c(
    "/home/cuelee/OneDrive/Mint/meta-sex/plink_format/NFBC_20091001",
    "/home/cuelee/OneDrive/Mint/meta-sex/plink_format/modified_GRM/NFBC_20091001_UF",
    "/home/cuelee/OneDrive/Mint/meta-sex/plink_format/modified_GRM/NFBC_20091001_UM",
    "/home/cuelee/OneDrive/Mint/meta-sex/plink_format/modified_GRM/NFBC_20091001_IF"
    )

mgrm_ug_uf_um_im<-
  c(
    "/home/cuelee/OneDrive/Mint/meta-sex/plink_format/NFBC_20091001",
    "/home/cuelee/OneDrive/Mint/meta-sex/plink_format/modified_GRM/NFBC_20091001_UF",
    "/home/cuelee/OneDrive/Mint/meta-sex/plink_format/modified_GRM/NFBC_20091001_UM",  
    "/home/cuelee/OneDrive/Mint/meta-sex/plink_format/modified_GRM/NFBC_20091001_IM"
    )

write.table(mgrm_ug_uf_um_if,"/Users/cuelee/OneDrive/Mint/meta-sex/plink_format/modified_GRM/mgrm_IF.txt",quote=F,row.names=F,col.names=F) 
write.table(mgrm_ug_uf_um_im,"/Users/cuelee/OneDrive/Mint/meta-sex/plink_format/modified_GRM/mgrm_IM.txt",quote=F,row.names=F,col.names=F)