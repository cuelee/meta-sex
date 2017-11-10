dat_allfams<- read.table("/Users/cuelee/OneDrive/Mint/meta-sex/plink_format/NFBC_20091001.fam")

dat_malefams <- dat_allfams[dat_allfams[,5]==1,]
dat_femalefams <- dat_allfams[dat_allfams[,5]==2,]

list_male <- dat_malefams[,c(1,2)]
list_female <- dat_femalefams[,c(1,2)]

write.table(list_male,"/Users/cuelee/OneDrive/Mint/meta-sex/plink_format/lists/keep_male.rst",quote=FALSE, row.names = FALSE, col.names = FALSE)
write.table(list_female,"/Users/cuelee/OneDrive/Mint/meta-sex/plink_format/lists/keep_female.rst",quote=FALSE, row.names = FALSE, col.names = FALSE)

## extract individuals from all data
runPlink <- "/Users/cuelee/OneDrive/softwares/plink/plink1.9/plink"
input_bfile <- "--bfile /Users/cuelee/OneDrive/Mint/meta-sex/plink_format/NFBC_20091001"
extract_male <- ("--keep /Users/cuelee/OneDrive/Mint/meta-sex/plink_format/lists/keep_male.rst")
extract_female <- ("--keep /Users/cuelee/OneDrive/Mint/meta-sex/plink_format/lists/keep_female.rst")
out_male <- ("--make-bed --out /Users/cuelee/OneDrive/Mint/meta-sex/plink_format/male/NFBC_20091001_male")
out_female <- ("--make-bed --out /Users/cuelee/OneDrive/Mint/meta-sex/plink_format/female/NFBC_20091001_female")
system(paste(runPlink, input_bfile, extract_male, out_male))
system(paste(runPlink, input_bfile, extract_female, out_female))


all_phes <- c(
"/Users/cuelee/OneDrive/Mint/meta-sex/phenos/all/bmires_ordered.tab",
"/Users/cuelee/OneDrive/Mint/meta-sex/phenos/all/crpres_ordered.tab",
"/Users/cuelee/OneDrive/Mint/meta-sex/phenos/all/diares_ordered.tab",
"/Users/cuelee/OneDrive/Mint/meta-sex/phenos/all/glures_ordered.tab",
"/Users/cuelee/OneDrive/Mint/meta-sex/phenos/all/hdlres_ordered.tab",
"/Users/cuelee/OneDrive/Mint/meta-sex/phenos/all/height_ordered.tab",
"/Users/cuelee/OneDrive/Mint/meta-sex/phenos/all/insres_ordered.tab",
"/Users/cuelee/OneDrive/Mint/meta-sex/phenos/all/ldlres_ordered.tab",
"/Users/cuelee/OneDrive/Mint/meta-sex/phenos/all/sysres_ordered.tab",
"/Users/cuelee/OneDrive/Mint/meta-sex/phenos/all/tgres_ordered.tab"
)

all_famf <- "/Users/cuelee/OneDrive/Mint/meta-sex/plink_format/NFBC_20091001.fam"

all_fam <- read.table(all_famf, header=F)

for (i in 1: length(all_phes))
{
  cur.data <- read.table(all_phes[i],header=F)
  print(all(all_fam[,c(1,2)]==cur.data[,c(1,2)]))
}


male_phes <- c(
  "/Users/cuelee/OneDrive/Mint/meta-sex/phenos/data_male/bmires_ordered_male.tab",
  "/Users/cuelee/OneDrive/Mint/meta-sex/phenos/data_male/crpres_ordered_male.tab",
  "/Users/cuelee/OneDrive/Mint/meta-sex/phenos/data_male/diares_ordered_male.tab",
  "/Users/cuelee/OneDrive/Mint/meta-sex/phenos/data_male/glures_ordered_male.tab",
  "/Users/cuelee/OneDrive/Mint/meta-sex/phenos/data_male/hdlres_ordered_male.tab",
  "/Users/cuelee/OneDrive/Mint/meta-sex/phenos/data_male/height_ordered_male.tab",
  "/Users/cuelee/OneDrive/Mint/meta-sex/phenos/data_male/insres_ordered_male.tab",
  "/Users/cuelee/OneDrive/Mint/meta-sex/phenos/data_male/ldlres_ordered_male.tab",
  "/Users/cuelee/OneDrive/Mint/meta-sex/phenos/data_male/sysres_ordered_male.tab",
  "/Users/cuelee/OneDrive/Mint/meta-sex/phenos/data_male/tgres_ordered_male.tab"
)

male_famf <- "/Users/cuelee/OneDrive/Mint/meta-sex/plink_format/male/NFBC_20091001_male.fam"

male_fam <- read.table(male_famf, header=F)

for (i in 1: length(male_phes))
{
  cur.data <- read.table(male_phes[i],header=F)
  print(all(male_fam[,c(1,2)]==cur.data[,c(1,2)]))
}


female_phes <- c(
  "/Users/cuelee/OneDrive/Mint/meta-sex/phenos/data_female/bmires_ordered_female.tab",
  "/Users/cuelee/OneDrive/Mint/meta-sex/phenos/data_female/crpres_ordered_female.tab",
  "/Users/cuelee/OneDrive/Mint/meta-sex/phenos/data_female/diares_ordered_female.tab",
  "/Users/cuelee/OneDrive/Mint/meta-sex/phenos/data_female/glures_ordered_female.tab",
  "/Users/cuelee/OneDrive/Mint/meta-sex/phenos/data_female/hdlres_ordered_female.tab",
  "/Users/cuelee/OneDrive/Mint/meta-sex/phenos/data_female/height_ordered_female.tab",
  "/Users/cuelee/OneDrive/Mint/meta-sex/phenos/data_female/insres_ordered_female.tab",
  "/Users/cuelee/OneDrive/Mint/meta-sex/phenos/data_female/ldlres_ordered_female.tab",
  "/Users/cuelee/OneDrive/Mint/meta-sex/phenos/data_female/sysres_ordered_female.tab",
  "/Users/cuelee/OneDrive/Mint/meta-sex/phenos/data_female/tgres_ordered_female.tab"
)

female_famf <- "/Users/cuelee/OneDrive/Mint/meta-sex/plink_format/female/NFBC_20091001_female.fam"

female_fam <- read.table(female_famf, header=F)

for (i in 1: length(female_phes))
{
  cur.data <- read.table(female_phes[i],header=F)
  print(all(female_fam[,c(1,2)]==cur.data[,c(1,2)]))
}