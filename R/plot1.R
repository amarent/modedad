rs_plot1<-function(x,y,bd,k,con,rt,hr,t){
#cluster_mov	
	library(tm)
	library(rmongodb) 
	library(plyr)
	library(igraph)
	library(networkD3)
	k<-as.numeric(k)
	m <- rs_todos(x,y,bd,con,rt,hr,t)

	word_freqs <- sort(rowSums(m), decreasing=TRUE) 
	dm <- data.frame(word=names(word_freqs), freq=word_freqs)
	termDocMatrix<-m[dm[1:k,1],]
	distMatrix <- dist(scale(termDocMatrix))
	fit <- hclust(distMatrix, method="ward")
	#return(treeNetwork(as.treeNetwork(fit)))
	return(plot(fit, main="Dendograma",xlab="",ylab="distancia"))
	}
