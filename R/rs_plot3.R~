rs_plot3<-function(x,y,k,bd){
#rs_graph_maxcliques_mov

	library(tm)
	library(rmongodb) 
	library(plyr)
	library(wordcloud)
	library(RColorBrewer)
k<-as.numeric(k)
args <- list(
fecha1 = x,
fecha2 = y,
companhia= bd
);
myurl <- paste("http://10.225.190.192/atweets/test.php?",paste(names(args), args, sep="=", collapse="&"), sep="");
    
mydata <- tryCatch(read.table(myurl,sep="\t",quote="\""), error=function(e){
              stop("Fallo !!")
});

mydata<-as.data.frame(mydata[,1])
colnames(mydata)<-c("text")


		fc_stopwords<-function(dbs){
			switch(dbs,
				jr_movistar = c('movistar','movistarmx','mimovistarmx','q','d','rt','hola','gracias', stopwords("es")),
				jr_telcel = c('telcel','serviciotelcel','servicio','rt','hola','gracias', stopwords("es")),
				jr_iusacell = c('iusacell','servicio','q','d','rt','hola','gracias', stopwords("es")))
		}

		stopwords<-fc_stopwords(bd)
	mach_corpus <- Corpus(VectorSource(gids$text))
	tdm <- TermDocumentMatrix(mach_corpus,
   	control = list(removePunctuation = TRUE,
   	stopwords = stopwords,
   	removeNumbers = TRUE, tolower = TRUE,wordLengths=c(1,Inf)))
	m <- as.matrix(tdm)
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
	cl <- maximal.cliques(g)
	colbar <- rainbow(length(cl) + 1)
	for (i in 1:length(cl)) {
	V(g)[cl[[i]]]$color <- colbar[i+1]
	}

	return(	plot(g, mark.groups=cl,vertex.size=.3, vertex.label.cex=1.5, edge.color=rgb(.4,.4,0,.3)))
	}



































	
