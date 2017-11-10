## load .R file. 
source('~/Dropbox/Cue_meta_sex/Rcodes/6)GCTA_converter/readNwriteGRM.R', echo=FALSE)
## function1 : read_GRMBin = function (prefix, size = 4) 
## function2 : write_GRMBin = function (X, n.snps = 0, prefix, size = 4) 

## set prefix
prefix <- "/Users/cuelee/OneDrive/Mint/meta-sex/plink_format/NFBC_20091001"

## it read all three grm files, and provide three matrix of all entries in three matrices. 
raw_all <- read_GRMBin(prefix)

grm_all <- raw_all[[1]]
id_all <- raw_all[[2]]
N_all <- raw_all[[3]]
n.snps <- N_all 

## load the fam file of all data 
all_fam <- as.matrix(read.table("/Users/cuelee/OneDrive/Mint/meta-sex/plink_format/NFBC_20091001.fam"))
id_fam <- all_fam[,c(1:2)]

if(!all(id_fam == id_all)){stop("id inconsistency")
  } else {

  ## set id's for both sexes 
  tag_male <- which(all_fam[,5]==1)
  tag_female <- which(all_fam[,5]==2)
  
  n_indv<-nrow(id_all)
  null_vec <- rep(0, n_indv)
  diag_one <- diag(n_indv)
  rownames(diag_one) <- rownames(grm_all)
  colnames(diag_one) <- colnames(grm_all)
  
  ## create GRM of UF 
  inst.mat <- grm_all 
  for ( i in 1:length(tag_male) ){
    inst.mat[tag_male[i],] <- null_vec
    }
  for ( i in 1:length(tag_male) ){
    inst.mat[,tag_male[i]] <- null_vec
    }
  inst.mat[c(1:10),c(1:10)]
  grm_UF <- inst.mat
  write_GRMBin(grm_UF, n.snps = n.snps, prefix="/Users/cuelee/OneDrive/Mint/meta-sex/plink_format/modified_GRM/NFBC_20091001_UF", size = 4) 
  
  
  ## create GRM of UM 
  inst.mat <- grm_all 
  for ( i in 1:length(tag_female) ){
    inst.mat[tag_female[i],] <- null_vec
  }
  for ( i in 1:length(tag_female) ){
    inst.mat[,tag_female[i]] <- null_vec
  }
  inst.mat[c(1:10),c(1:10)]
  grm_UM <- inst.mat
  write_GRMBin(grm_UM, n.snps = n.snps, prefix="/Users/cuelee/OneDrive/Mint/meta-sex/plink_format/modified_GRM/NFBC_20091001_UM", size = 4) 
  
  
  ## create GRM of IF 
  inst.mat <- diag_one 
  for ( i in 1:length(tag_male) ){
    inst.mat[tag_male[i],] <- null_vec
  }
  for ( i in 1:length(tag_male) ){
    inst.mat[,tag_male[i]] <- null_vec
  }
  inst.mat[c(1:10),c(1:10)]
  grm_IF <- inst.mat
  write_GRMBin(grm_IF, n.snps = n.snps, prefix="/Users/cuelee/OneDrive/Mint/meta-sex/plink_format/modified_GRM/NFBC_20091001_IF", size = 4) 
  
  ## create GRM of IM 
  inst.mat <- diag_one 
  for ( i in 1:length(tag_female) ){
    inst.mat[tag_female[i],] <- null_vec
  }
  for ( i in 1:length(tag_female) ){
    inst.mat[,tag_female[i]] <- null_vec
  }
  inst.mat[c(1:10),c(1:10)]
  grm_IM <- inst.mat
  write_GRMBin(X=grm_IM, n.snps = n.snps, prefix="/Users/cuelee/OneDrive/Mint/meta-sex/plink_format/modified_GRM/NFBC_20091001_IM", size = 4) 
}