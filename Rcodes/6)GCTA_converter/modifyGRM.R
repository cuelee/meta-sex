source('~/Dropbox/meta_sex/2016-01-05_Cue_Data/Codes/GCTA_converter/readNwriteGRM.R', chdir = TRUE)
malefam <- "~/Dropbox/meta_sex/2016-01-05_Cue_Data/data/male/NFBC_20091001_male.fam"
femalefam <- '~/Dropbox/meta_sex/2016-01-05_Cue_Data/data/female/NFBC_20091001_female.fam'

getID <- function(file, ID = NULL){
	cur.data <- read.table(file, header=F)
	return(cur.data[,2])
}

maleID <- getID(malefam)
femaleID <- getID(femalefam)

data <- read_GRMBin ("~/Dropbox/meta_sex/2016-01-05_Cue_Data/data/GRM/NFBC_20091001") 
cur.grm <- data[[1]]
cur.id <- data[[2]][,2]
cur.N <- data[[3]]

male.ad <- which(cur.id %in% maleID)
female.ad <- which(cur.id %in% femaleID)

addr <- list (male.ad,female.ad)

generateNewgrm = function(cur.mat,cur.set,prefix,N,X=NULL,diag=FALSE){
	for( set.comp in cur.set )	
	{
		for(ind.set1 in addr[set.comp[1]])
		{
			for(ind.set2 in addr[set.comp[2]])
			{
				cur.mat[ind.set1,ind.set2] <- 0
			}
		}
	}
	if(diag != FALSE ) {
		for(ind.set in addr[[diag]]) cur.mat[ind.set,ind.set] <- 1 
	}
	X <- cur.mat
	rownames(X) <- cur.id
	colnames(X) <- cur.id
	write_GRMBin(X,n.snps = N, prefix=prefix)
}

generateNewgrm(cur.mat = cur.grm, cur.set=list(c(2,2),c(1,2),c(2,1)) ,prefix = "~/Dropbox/cue_meta_sex/NFBC_20091001_M",N=cur.N)
generateNewgrm(cur.mat = cur.grm,cur.set=list(c(1,1),c(1,2),c(2,1)) ,prefix = "~/Dropbox/cue_meta_sex/NFBC_20091001_F",N=cur.N)
generateNewgrm(cur.mat = cur.grm,cur.set=list(c(1,1),c(1,2),c(2,1),c(2,2)) ,prefix = "~/Dropbox/meta_sex/2016-01-05_Cue_Data/data/GRM/NFBC_20091001_IF",N=cur.N,diag = 2)
generateNewgrm(cur.mat = cur.grm,cur.set=list(c(1,1),c(1,2),c(2,1),c(2,2)) ,prefix = "~/Dropbox/meta_sex/2016-01-05_Cue_Data/data/GRM/NFBC_20091001_IM",N=cur.N,diag = 1)


read_GRMBin ("~/Dropbox/cue_meta_sex/NFBC_20091001_IF") 