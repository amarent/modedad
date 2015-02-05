plot7<-function(x,y,k,con,bd){
#graph_mov2
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
	g <- graph.adjacency(termMatrix, weighted=T, mode="undirected")
	g <- simplify(g)
	V(g)$label <- V(g)$name
	V(g)$degree <- degree(g)
	V(g)$label.cex <- 2.2 * V(g)$degree / max(V(g)$degree)+ .2
	V(g)$label.color <- rgb(0, 0, .2, .8)
	V(g)$frame.color <- NA
	egam <- (log(E(g)$weight)+.4) / max(log(E(g)$weight)+.4)
	E(g)$color <- rgb(.5, .5, 0, egam)
	E(g)$width <- egam
	set.seed(3952)
	layout1 <- layout.fruchterman.reingold(g)
	

	return(plot(g, layout=layout1))
	}



































	
