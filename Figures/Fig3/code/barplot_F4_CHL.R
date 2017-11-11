setwd("/Users/cuelee/Dropbox/Cue_meta_sex/manuscript/Figures/Fig3/code")

gw <- as.matrix(read.table("gwa_sst.tab"))
re <- as.matrix(read.table("re_sst.tab"))
cv <- as.matrix(read.table("cv_sst.tab"))
sst  <- as.matrix(read.table("sst.tab"))

i = 9
i =10
counts = rbind(re[i,], cv[i,], gw[i,], sst[i,])
inds = c(1,2,3,4,5,6,7,10, 9,11,8)
counts = counts[,inds]

names = c(1, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2.0)

size = 1.7

cols <- c("blue",
          "Red",
          "orange1",
          "purple")  

pdf("power19_cv_res_CHL.pdf", 10, 6, pointsize=8)

par(lwd=0.5)
par(mar = c(5,5,2,0))

barplot(
        counts, 
        beside=TRUE, 
        #main="Power comparision between RE+SST, GWAMA+SST, CV+SST and SST", 
        xlab="Standard deviation ratio between males and females", 
        col=cols, 
        names.arg=names, 
        ylab="Power", 
        cex.axis=size, 
        cex=size, 
        cex.lab=size, 
        space=c(0,0.8), 
        cex.main=size, 
        border=TRUE)



legend("topright", c("RE+SST", "CV+SST", "GWAMA+SST", "SST"), cex=size, fill=cols, bty="n")
dev.off()