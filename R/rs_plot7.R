rs_plot7<-function(x,y,k,bd){
#vertdist_mo
	library(tm)
	library(rmongodb) 
	library(plyr)
	library(igraph)
	k<-as.numeric(k)
	m <- rs_todos(x,y,bd)

	word_freqs <- sort(rowSums(m), decreasing=TRUE) 
	dm <- data.frame(word=names(word_freqs), freq=word_freqs)
	termDocMatrix<-m[dm[1:k,1],]
	termDocMatrix<-termDocMatrix[,colSums(termDocMatrix)>0]	
	termDocMatrix[termDocMatrix>=1] <- 1
	termMatrix <- termDocMatrix %*% t(termDocMatrix)
	g <- graph.adjacency(termMatrix, weighted=T, mode="undirected")
	g <- simplify(g)
	V(g)$label <- V(g)$name
	V(g)$degree <- degree(g)
	V(g)$label.cex <- 1
	V(g)$label.color <- rgb(.4, 0, 0, .7)
	V(g)$size <- 2
	V(g)$frame.color <- NA
	barplot(table(V(g)$degree))

	

	#return(plot(g, layout=layout1))
	}



































	
