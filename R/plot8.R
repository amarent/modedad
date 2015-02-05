rs_plot8<-function(x,y,k,bd,con){
#hist2_mov
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

	for (i in 1:k)
		{
		for (j in 1:k)
			{
			 if (i<j)
				 {
					if (i==1 || j==2)					
						{
						a<-termMatrix[i,j]
						b<-paste(colnames(termMatrix)[i],colnames(termMatrix)[j],sep="-")
						}
					else
						{
						a<-rbind(a,termMatrix[i,j])
						b<-rbind(b,paste(colnames(termMatrix)[i],colnames(termMatrix)[j],sep="-"))
				
						}
				 }
			}
		}
	a<-cbind(b,a)
	row.names(a)<-b
	a<-as.data.frame(a)
	a[,2]<- as.numeric(a[,2])
	a<-a[order(-a[,2]),]
	


	g <- graph.adjacency(termMatrix, weighted=T, mode="undirected")
	g <- simplify(g)
	V(g)$label <- V(g)$name
	V(g)$degree <- degree(g)
	set.seed(3952)
	layout1 <- layout.fruchterman.reingold(g)
	spc <- spinglass.community(g, spins=10)

	plot(g, layout=layout1, vertex.size=.3, vertex.label.cex=1.5, edge.color=rgb(.4,.4,0,.3),
	vertex.color=spc$membership+1, vertex.label.color=spc$membership+1, asp=FALSE)
	return(plot(g, layout=layout1, vertex.size=.3, vertex.label.cex=1.5, edge.color=rgb(.4,.4,0,.3),
	vertex.color=spc$membership+1, vertex.label.color=spc$membership+1, asp=FALSE))
	}



































	
