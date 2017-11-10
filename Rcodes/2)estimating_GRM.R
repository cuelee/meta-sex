## run GCTA to get GRM for subsets (female,)
runGCTA <- "/home/cuelee/OneDrive/Mint/GCTA/gcta_1.26.0/gcta64"
commands <- "--autosome --make-grm --thread-num 10"

# ## female GRM runs
# input_bfile_female <- "--bfile /home/cuelee/OneDrive/Mint/meta-sex/plink_format/female/NFBC_20091001_female"
# outf <- paste("--out /home/cuelee/OneDrive/Mint/meta-sex/plink_format/female/NFBC_20091001_female",sep="")
# system(paste(runGCTA, input_bfile_female, commands, outf))
# 
# 
# ## male GRM runs
# input_bfile_male <- "--bfile /home/cuelee/OneDrive/Mint/meta-sex/plink_format/male/NFBC_20091001_male"
# outf <- paste("--out /home/cuelee/OneDrive/Mint/meta-sex/plink_format/male/NFBC_20091001_male",sep="")
# system(paste(runGCTA, input_bfile_male, commands, outf))
# 

## all GRM runs
input_bfile_all <- "--bfile /home/cuelee/OneDrive/Mint/meta-sex/plink_format/NFBC_20091001"
outf <- paste("--out /home/cuelee/OneDrive/Mint/meta-sex/plink_format/NFBC_20091001",sep="")
system(paste(runGCTA, input_bfile_all, commands, outf))
