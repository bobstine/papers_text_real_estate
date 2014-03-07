
source("/Users/bob/C/text/functions.R")



##################################################################################
#  
#   Raw word regression
#
##################################################################################
	
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
	
	cv.1000 <- cross.validate.mse(data, n.reps=10)
	
# --- too slow in the function, so try directly

	y <- logPrice
	X <- W[,1:1000]; rownames(X) <- NULL; colnames(X) <- NULL
	data <- data.frame(y=y,X=X)
	
	n.folds<-10; seed <- 21342; n.reps <- 2
	
	n <- length(y); 
	i <- rep(1:n.folds,ceiling(n/n.folds))
	if (length(i) != n) cat("Note: n is not multiple of # folds.\n");
	i <- i[1:n]
	set.seed(seed)
	mse <- rep(0,n.folds*n.reps)
	
	for(kk in 1:n.reps) {
		ii <- sample(i, n)   # permute fold indices
		for(fold in 1:n.folds) {
			cat(fold,"\n");
			train <- (fold != ii)
			r <- lm(y ~ ., data=data[train,])
			test  <- (fold == ii)
			err <- y[test] - predict(r, newdata=data[test,]);
			mse[fold+(kk-1)*n.folds] <- sum(err^2)/sum(test)
		}}
	mse

	mse.words <- mse
	
	
##################################################################################
#
#     LSA
#
##################################################################################

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
	
		X <- W[,1:1000]; rownames(X) <- NULL; colnames(X) <- NULL
	data <- data.frame(y=y,X=X)
	
	n.folds<-10; seed <- 21342; n.reps <- 2
	
	n <- length(y); 
	i <- rep(1:n.folds,ceiling(n/n.folds))
	if (length(i) != n) cat("Note: n is not multiple of # folds.\n");
	i <- i[1:n]
	set.seed(seed)
	mse <- rep(0,n.folds*n.reps)
	
	for(kk in 1:n.reps) {
		ii <- sample(i, n)   # permute fold indices
		for(fold in 1:n.folds) {
			cat(fold,"\n");
			train <- (fold != ii)
			r <- lm(y ~ ., data=data[train,])
			test  <- (fold == ii)
			err <- y[test] - predict(r, newdata=data[test,]);
			mse[fold+(kk-1)*n.folds] <- sum(err^2)/sum(test)
		}}
	mse

