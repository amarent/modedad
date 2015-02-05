plot13<-function(x,y,k,bd,con){
	#twomode_graph_mov
	library(tm)
	library(rmongodb) 
	library(plyr)
	library(igraph)
	k<-as.numeric(k)
	m <- rs_todos(x,y,bd,con)


	word_freqs <- sort(rowSums(m), decreasing=TRUE) 
	dm <- data.frame(word=names(word_freqs), freq=word_freqs)
	termDocMatrix<-m[dm[1:k,1],]
	termDocMatrix<-termDocMatrix[,colSums(termDocMatrix)>0]	
	termDocMatrix[termDocMatrix>=1] <- 1
	termMatrix <- termDocMatrix %*% t(termDocMatrix)
	g <- graph.adjacency(termMatrix, weighted=T, mode = "undirected")
	nTerms <- nrow(termMatrix)
	nDocs <- ncol(termMatrix)
	idx.terms <- 1:nTerms
	idx.docs <- (nTerms+1):(nTerms+nDocs)
	V(g)$degree <- degree(g)
	V(g)$color[idx.terms] <- rgb(0, 1, 0, .5)
	V(g)$size[idx.terms] <- 6
	V(g)$color[idx.docs] <- rgb(1, 0, 0, .4)
	V(g)$size[idx.docs] <- 4
	V(g)$frame.color <- NA
	V(g)$label <- V(g)$name
	V(g)$label.color <- rgb(0, 0, 0, 0.5)
	V(g)$label.cex <- 1.4*V(g)$degree/max(V(g)$degree) + 1
	E(g)$width <- .3
	E(g)$color <- rgb(.5, .5, 0, .3)
	set.seed(958)
	plot(g, layout=layout.fruchterman.reingold)
	

	return(plot(g, layout=layout1))
	}



































	
