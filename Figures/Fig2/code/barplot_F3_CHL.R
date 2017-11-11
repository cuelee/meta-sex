setwd("/Users/cuelee/Dropbox/meta_sex/Figures/Fig3/code")
library("extrafont")

gw <- as.matrix(read.table("gwa_large.tab"))
re <- as.matrix(read.table("re_large.tab"))
cv <- as.matrix(read.table("cv_large.tab"))
sst  <- as.matrix(read.table("sst_large.tab"))

N = 1000
betas = 1:N/10*2/4/N*50


inds = 1:20*25*N/500
inds = inds[9:16]

#inds = 1:20*25
#sel = 1:10*2
#sel = sel[6:10]
#inds = inds[sel]

base = 320*N/500
#base = 250*N/500

inds = 1:10*base/10


#counts = rbind(mx[base, inds], gw[base, inds], fe[base, inds], re[base, inds], gw1[base, inds])
counts = rbind(re[base, inds], cv[base, inds], gw[base, inds], sst[base, inds])
counts = rbind(re[inds, base], cv[inds, base], gw[inds, base], sst[inds, base])

names = betas[base]/betas[inds]
names = betas[inds]/betas[base]
#names = floor(names*10)/10

#names[3] = 0.2
#names[8] = 0.2

cols <- c("blue",
          "Red",
          "orange1",
          "purple")
size = 1.7
pdf("power19_3_cv_CHL.pdf", 10, 6, pointsize=8)
#barplot(counts, beside=TRUE, main="Power comparision between RE+SST, GWAMA+SST and SST", xlab="Effect size ratio between males and females", col=c("red", "yellow", "blue"), names.arg=c("0", "0.2", "1", "1.2", "1.4", "1.6", "1.8", "2"), ylab="Power", cex.axis=size, cex=size, cex.lab=size, cex.main=size)
#barplot(counts, beside=TRUE, main="Power comparision between RE+SST, GWAMA+SST, CV+SST, SST and GWAMA", xlab="Effect size ratios between male and female studies", col=c("red", "yellow", "green", "blue", "violet"), names.arg=names, ylab="Power", cex.axis=size, cex=size, cex.lab=size, cex.main=size)
par(lwd=0.5)
par(mar = c(5,5,2,0))
barplot(
        height=counts, 
        beside=TRUE, 
        #main="Power comparision between RE+SST, GWAMA+SST, CV+SST and SST", 
        xlab="Effect size ratio between males and females", 
        col=c(cols), 
        names.arg=names, 
        ylab="Power", 
        cex.axis=size, 
        cex=size, 
        cex.lab=size, 
        cex.main=size,
        space=c(0,0.8),
        family="sans",
        border=TRUE)
legend("topleft", c("RE+SST", "CV+SST", "GWAMA+SST",  "SST"), cex=size, fill=c(cols), bty="n")
dev.off()