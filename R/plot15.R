rs_plot15<-function(x,y,bd,k,con,rt,hr,t){
#cluster_mov	
	library(tm)
	library(rmongodb) 
	library(plyr)
	library(igraph)
	k<-as.numeric(k)
	m <- rs_todos(x,y,bd,con,rt,hr,t)

	word_freqs <- sort(rowSums(m), decreasing=TRUE) 
	dm <- data.frame(word=names(word_freqs), freq=word_freqs)
	heatmap(termDocMatrix<-m[dm[1:k,1],])
	}
