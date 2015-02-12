rs_plot10<-function(x,y,k,con,bd,n=8,rt,hr){
#kmeans_mov
	library(tm)
	library(rmongodb) 
	k<-as.numeric(k)
	m <- rs_todos(x,y,bd,con,rt,hr)


	word_freqs <- sort(rowSums(m), decreasing=TRUE) 
	dm <- data.frame(word=names(word_freqs), freq=word_freqs)
	termDocMatrix<-m[dm[1:k,1],]
	m3 <- t(termDocMatrix)
#	set.seed(122)
#	kmeansResult <- kmeans(m3, n)
	
#	return(round(kmeansResult$centers, digits=3)
	#for (i in 1:n) {
#	cat(paste("cluster ", i, ": ", sep=""))
	#s <- sort(kmeansResult$centers[i,], decreasing=T)
#	cat(names(s)[1:3], "\n")
#	 })
	}



































	
