rs_plot4<-function(x,y,k,con,bd,rt,hr){
#graph_largecliques_mov
	library(tm)
	library(rmongodb) 
	library(plyr)
	library(igraph)
	k<-as.numeric(k)
	m <- rs_todos(x,y,bd,con,rt,hr)



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
	set.seed(3952)
	cl <- largest.cliques(g)
	colbar <- rainbow(length(cl) + 1)
	for (i in 1:length(cl)) {
	V(g)[cl[[i]]]$color <- colbar[i+1]
	}

	return(	plot(g, mark.groups=cl,vertex.size=.3, vertex.label.cex=1.5, edge.color=rgb(.4,.4,0,.3)))
	}



































	
