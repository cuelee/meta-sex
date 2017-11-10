read_GRMBin = function (prefix, size = 4) 
{
    sum_i <- function(i) {
        return(sum(1:i))
    }
    BinFileName <- paste(prefix, ".grm.bin", sep = "")
    NFileName <- paste(prefix, ".grm.N.bin", sep = "")
    IDFileName <- paste(prefix, ".grm.id", sep = "")
    id <- read.table(IDFileName)
    n <- dim(id)[1]
    BinFile <- file(BinFileName, "rb")
    grm <- readBin(BinFile, n = n * (n + 1)/2, what = numeric(0), 
        size = size)
    NFile <- file(NFileName, "rb")
    N <- readBin(NFile, n = 1, what = numeric(0), size = size)
    i <- sapply(1:n, sum_i)
    close(BinFile)
    close(NFile)
    diag.elem <- grm[i]
    off.diag.elem <- grm[-i]
    X <- diag(diag.elem)
    X[lower.tri(X, diag = FALSE)] <- off.diag.elem
    X <- X + t(X) - diag(diag(X))
    rownames(X) <- id$V2
    colnames(X) <- id$V2
    return(list(X,id,N))
}

write_GRMBin = function (X, n.snps = 0, prefix, size = 4) 
{
    sum_i <- function(i) {
        return(sum(1:i))
    }
    NFileName <- paste(prefix, ".grm.N.bin", sep = "")
    IDFileName <- paste(prefix, ".grm.id", sep = "")
    BinFileName <- paste(prefix, ".grm.bin", sep = "")
    id <- rownames(X)
    n <- length(id)
    diag.elem <- diag(X)
    off.diag.elem <- X[lower.tri(X, diag = FALSE)]
    i <- sapply(1:n, sum_i)
    collapsed.grm <- vector(mode = "numeric", length = n * (n + 1)/2)
    collapsed.grm[i] <- diag.elem
    collapsed.grm[-i] <- off.diag.elem
    BinFile <- file(BinFileName, "wb")
    NFile <- file(NFileName, "wb")
    writeBin(con = BinFile, collapsed.grm, size = size)
    writeBin(con = NFile, n.snps, size = size)
    close(BinFile)
    close(NFile)
    # write.table(X,file = paste(prefix,".grm.nobin",sep=""),quote=F,col.names=F,row.names=F)
    # write.table(n.snps,file = paste(prefix,".grm.N.nobin",sep=""),quote=F,col.names=F,row.names=F)
    write.table(cbind(id, id), file = IDFileName, quote=F, col.names=F,row.names=F)
}