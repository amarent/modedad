rs_plot15<-function(x,y,k,bd,con){
	
	library(tm)
	library(rmongodb) 
	library(plyr)
	library(igraph)
	k<-as.numeric(k)
	m <- rs_todos(x,y,bd,con)

	word_freqs <- sort(rowSums(m), decreasing=TRUE) 
	dm <- data.frame(word=names(word_freqs), freq=word_freqs)

	termDocMatrix<-m[dm[1:k,1],]
	distMatrix <- dist(scale(termDocMatrix))
	fit <- hclust(distMatrix, method="ward")
	
	return(plot(fit))
	}



































	
