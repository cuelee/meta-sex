###########################################
####
#### Buhm's plot modification 9/6/14
####
#### Cue's plot modification 9/18/17
####
###########################################

setwd("/Users/cuelee/Dropbox/Cue_meta_sex/manuscript/Figures/Fig6/Finland-figure")

pval_format <- function(pval) {
log10p <- log10(pval)
## exponent <- floor(log10p)
## front <- 10^(log10p-exponent)
## out <- sprintf("%.0f%%*%%10^%d", front, exponent)
out <- sprintf("10^%d", round(log10p))
}

lmargin <- 6.3
rmargin <- 1.2
umargin <- 4

ptab = as.matrix(read.table("meta_pval.txt"))

rsids = ptab[,1]
pvals = as.numeric(ptab[,2:5])
dim(pvals) <- c(16,4)
log_pvals = -log(pvals)/log(10)
rel_log_pvals <- log_pvals - log_pvals[,2]

EP1= 0.1
EP2=0.01
EP = EP1+EP2
cairo_pdf("result_plot_CHL.pdf", width=7, height=6+EP, pointsize=12,family = "DejaVu Sans")

layout(matrix(c(1,2,3),3,1,byrow=FALSE),heights=c(4+EP1,1.05+EP2,1.05))
## par(oma=c(2,2,2,2))
#par(mfrow = c(2, 1))
par(mar=c(11,lmargin,umargin,rmargin))


N = length(rel_log_pvals[,4])
for (i in 1:N) {
if (rel_log_pvals[i,4] < -4) {
rel_log_pvals[i,4] = -4.02
}
}

plot(rel_log_pvals[,1],  type="o", axes=FALSE, pch=19, ylim=c(-4.2, 4.2), col="blue", xlab="", ylab="")
#lines(rel_log_pvals[,2], type="l", pch=19,  col="black")
lines(rel_log_pvals[,3], type="o", pch=15,  col="red")
lines(rel_log_pvals[,4], type="o", pch=17,  col="orange1")
abline(h = 0)

#legend("topright", c("RE", "GWAMA", "CV", "SST"), cex=0.9, col=c("blue", "red", "green2", "orange1"), pch=19, lty=1 )
legend(x=14.1,y=4.5, c("RE", "GWAMA", "SST"), cex=1.1, col=c("blue", "red", "orange1"), pch=c(19, 15, 17), lty=1)

axis(side = 2)

### Print CV P-value.
text.x.adj=-0.1
cv_pvals = pvals[,2]
cv_pvals_label = sapply(cv_pvals, pval_format)
text(seq(1, 16, by=1)+text.x.adj, par("usr")[3] - 0.8,
labels = parse(text=cv_pvals_label), srt=90,
pos = 1, xpd = TRUE)
text(0, par("usr")[3] - 0.8, labels=expression(paste(italic(P)[CV])), srt=90, pos=1, xpd=TRUE, cex=1)

### Print RSID.
text.x.adj=0.27
text.y.adj=2.4
text(seq(1, 16, by=1)+text.x.adj, par("usr")[3] - text.y.adj, labels = rsids, srt = 90, pos = 2, xpd = TRUE,cex=1)

  ### Print Asciis using label=bquote(.(a))
  #asciis <- c("\u25ca"," ","\u25ca","\u2020","*","\u2022"," "," "," "," "," ","\u2022","\u2021"," "," ","\u25ca")
  #text(seq(1, 16, by=1)+text.x.adj-0.2, par("usr")[3] - text.y.adj - 0.4 *nchar(rsids) + 0.5  , labels = bquote(asciis), srt = 0, pos = 1, xpd = TRUE, cex = 1)
  #text(seq(1, 16, by=1)+text.x.adj-0.17, par("usr")[3] - text.y.adj - 0.39 *nchar(rsids) + 0.8  , labels = asciis, srt = 0, pos = 1, xpd = TRUE, cex = 1.2)

text(0.3, par("usr")[3] - text.y.adj, labels="RSID", srt=90, pos=2, xpd=TRUE, cex=1)

### Y axis labels.
mtext(side = 2, line = 2.2, expression(paste("-log"[10]~"P"~" gain compared to CV")), cex=0.8)

### The top part (phenotypes).
Ns <- c(2,2,6,3,3)
pheno.names <- c("CRP", "Glucose", "HDL", "LDL", "Triglyceride")
tick  <- 1
for (i in 1:5) {
	lines(c(tick - 0.3, tick+Ns[i]-1+0.3), rep(par("usr")[4]+0.4, 2), lwd=2, xpd=T)
	text(tick+(Ns[i]-1)/2, par("usr")[4]+0.4, labels=pheno.names[i], pos=3, xpd=T, cex=1.2)
	tick <- tick+Ns[i]
}
	
### Read variance ratio.
vars = as.matrix(read.table("var_res.txt"))
lps = as.numeric(vars[,2])

### Plot variance ratio.
par(mar=c(0.0,lmargin,00,rmargin))
ylab_name <- "Variance\nF/M ratio" 
plot(lps, type="o", pch=19, col="purple",ylab="", axes=FALSE, xlab="")
abline(h = 1)
axis(side = 2, at=c(0.8, 1.0, 1.2), las=1)
mtext(side = 2, line = 2.3, ylab_name, cex=0.75,padj=-0.4)


### Read effect sizes.
qtab = as.matrix(read.table("effects.txt"))
qps = qtab[,1]/qtab[,2]   # female/male
qps[qps < 0.6] <- 0.6 # bound to a limit (=0.5)

### Plot effect size ratios.
ylab_name <- "Effect size\nF/M ratio" 
par(mar=c(0.8,lmargin,0.0,rmargin))
plot(qps, type="o", pch=19, col="#26a458", axes=FALSE, ylab=NA, xlab="")
abline(h = 1)
axis(side = 2, at=c(0.6, 0.8, 1.0, 1.2), las=1)
mtext(side = 2, line = 2.3, ylab_name, cex=0.75,padj=-0.4)

dev.off()