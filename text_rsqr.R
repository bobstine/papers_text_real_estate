
source("/Users/bob/C/text/functions.R")



##################################################################################
#  
#   Raw word regression
#
##################################################################################
word.regression <- function () {
	
	path <- "/Users/bob/C/text/text_src/temp/ChicagoOld3/"
	YM <- as.matrix(read.table(paste(path,"lsa_ym.txt",sep=""),header=T,as.is=T))
	W  <- as.matrix(read.table(paste(path,"w5708.txt",sep=""),header=T,as.is=T))

	logPrice  <- YM[,1];
	nTokens   <- YM[,2];
	logTokens <- log(YM[,2])

	colnames(W)[1:10]         	# remove the EOL column, relabel others
	W <- W[,-7]
	colnames(W)[c(1,2,5)] <- c(".period.",".comma.",".exclamation.")
	colnames(W)[1:10]


	
# --- check some fits; 5th degree from C++ with centering gets diff R2

	sr.1000 <- summary(r.1000<-lm(logPrice ~ W[,1:1000])); sr.1000
	predictive.r2(r.1000)
}


##################################################################################
#
#     LSA
#
##################################################################################


lsa.analysis <- function() {

	nProj   <- 500
	weights <- "raw"
	city    <- "ChicagoOld3/"
	path    <- paste("/Users/bob/C/text/text_src/temp/",sep="")
	file    <- paste(path,city,"lsa_",weights,"_", nProj,"_p4.txt",sep="")
	LSA     <- as.matrix(read.table(file, header=TRUE)); dim(LSA)


# --- LSA analysis from matrix W    adj R2=0.6567 with 1000 and log tokens

	p      <- 500
	lsa    <- as.matrix(LSA[,1:p])
	sr.lsa <- summary(regr.lsa <- lm(logPrice ~ poly(nTokens,5) + lsa , x=TRUE, y=TRUE)); sr.lsa
	
	predictive.r2(regr.lsa)


}