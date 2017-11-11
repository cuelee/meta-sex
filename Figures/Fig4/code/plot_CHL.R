setwd("/Users/cuelee/Dropbox/meta_sex/Figures/Fig5/code")


gwa = as.matrix(read.table("gwa_large.tab"))
cv = as.matrix(read.table("cv_large.tab"))
re = as.matrix(read.table("re_large.tab"))
sst = as.matrix(read.table("sst_large.tab"))



pmat_gw = gwa
pmat_re = re
pmat_cv = cv
pmat_mx = sst

pmat_gw[is.na(pmat_gw)] = 0
pmat_re[is.na(pmat_re)] = 0
pmat_cv[is.na(pmat_cv)] = 0
pmat_mx[is.na(pmat_mx)] = 0


N = 1000

cols <- c("blue",
          "Red",
          "orange1",
          "purple")


pdf('power50_case2_CHL.pdf',height=8, width=8, pointsize=15)
par(mar = c(5,5,2,1))
plot(1, 2, xlim=c(0, N), ylim=c(0, N), col="white", xlab="Male Effect Size", ylab="Female Effect Size", xaxt="n", yaxt="n", cex.lab = 1.4)
axis(1, at=0:5*N/5, labels=0:5/5)
axis(2, at=0:5*N/5, labels=0:5/5)
legend('bottomleft', c("RE2", "CV", "GWAMA", "SST"), pch=19, col=c(cols), bty="n", cex=1.4)


a = 0.496
b = 0.514


a = 0.496
b = 0.504



for (i in 1:N) {
    for (j in 1:N) {
        if (pmat_gw[i, j] > a & pmat_gw[i, j] < b) {
            points(i, j, pch=".", col=cols[3], type="o")
        }
    }
}


for (i in 1:N) {
    for (j in 1:N) {
        if (pmat_cv[i, j] > a & pmat_cv[i, j] < b) {
            points(i, j, pch=".", col=cols[2], type="o")
        }
    }
}





for (i in 1:N) {
    for (j in 1:N) {
        if (pmat_mx[i, j] > a & pmat_mx[i, j] < b) {
            points(i, j, pch=".", col=cols[4], type="o")
        }
    }
}


a = 0.494
b = 0.506

for (i in 1:N) {
    for (j in 1:N) {
        if (pmat_re[i, j] > a & pmat_re[i, j] < b) {
            points(i, j, pch=".", col=cols[1], type="o")
        }
    }
}



x = 1:N
y = 1:N
points(x, y, type="l", lty=2, lwd=2, col='gray')




dev.off()




