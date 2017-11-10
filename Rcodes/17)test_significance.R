reml_full<-read.table("/Users/cuelee/OneDrive/Hanlab/2017/09/Meta-sex Re/Mint/meta-sex/tables/all/reml.rst",header=T)
SSTm<-read.table("/Users/cuelee/OneDrive/Hanlab/2017/09/Meta-sex Re/Mint/meta-sex/tables/male/male_reml.rst",header=T)
SSTf<-read.table("/Users/cuelee/OneDrive/Hanlab/2017/09/Meta-sex Re/Mint/meta-sex/tables/female/female_reml.rst",header=T)
traits <-as.character(as.matrix(read.table("/Users/cuelee/OneDrive/Hanlab/2017/09/Meta-sex Re/Mint/meta-sex/tables/all/traits.list")))
Titles <- c("BMI", "C-reactive protein", "Diastolic blood pressure", "Glucose", "HDL", "Height", "Insulin", "LDL", "Systolic blood pressure", "Triglyceride") 

chisq_stats_vg <- ((reml_full$V_g-0)/reml_full$se_g)^2
sig_Vg <- paste(Titles[which(pchisq(chisq_stats_vg,ncp=0,df=1,lower.tail=F)<0.005)],collapse =", ")
sig_Vg 
cbind(Titles,pchisq(chisq_stats_vg,ncp=0,df=1,lower.tail=F))

chisq_stats_vgf <- ((reml_full$V_f-0)/reml_full$se_f)^2
sig_vgf <- paste(Titles[which(pchisq(chisq_stats_vgf,ncp=0,df=1,lower.tail=F)<0.05)],collapse =", ")
sig_vgf 
cbind(Titles,pchisq(chisq_stats_vgf,ncp=0,df=1,lower.tail=F))
matrix(pchisq(chisq_stats_vgf,ncp=0,df=1,lower.tail=F),ncol=1)
min(pchisq(chisq_stats_vgf,ncp=0,df=1,lower.tail=F))

chisq_stats_vgm <- ((reml_full$V_m-0)/reml_full$se_m)^2
sig_vgm <- paste(Titles[which(pchisq(chisq_stats_vgm,ncp=0,df=1,lower.tail=F)<0.05)],collapse =", ")
sig_vgm 
cbind(Titles,pchisq(chisq_stats_vgm,ncp=0,df=1,lower.tail=F))
min(pchisq(chisq_stats_vgm,ncp=0,df=1,lower.tail=F))
matrix(pchisq(chisq_stats_vgm,ncp=0,df=1,lower.tail=F),ncol=1)


chisq_stats_vse <- ((reml_full$V_se-0)/reml_full$se_se)^2
sig_Vse <- paste(Titles[which(pchisq(chisq_stats_vse,ncp=0,df=1,lower.tail=F)<0.005)],collapse =", ")
sig_Vse
cbind(Titles,pchisq(chisq_stats_vse,ncp=0,df=1,lower.tail=F))

matrix_vg_vf_vm_vse <- cbind(
  matrix(pchisq(chisq_stats_vg,ncp=0,df=1,lower.tail=F),ncol=1),
  matrix(pchisq(chisq_stats_vgf,ncp=0,df=1,lower.tail=F),ncol=1),
  matrix(pchisq(chisq_stats_vgm,ncp=0,df=1,lower.tail=F),ncol=1),
  matrix(pchisq(chisq_stats_vse,ncp=0,df=1,lower.tail=F),ncol=1)
)

print.matrix <- function(m){
  write.table(format(m, justify="right",digits = 3,scientific = 5),
              row.names=F, col.names=F, quote=F)
}
print.matrix(matrix_vg_vf_vm_vse)
