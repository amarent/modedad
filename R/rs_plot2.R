rs_plot2<-function(x,y,k,bd){
#rs_graph_largecliques_mov	
	library(tm)
	library(rmongodb) 
	library(plyr)
	library(igraph)
	mongo <- mongo.create()
	DBNS <- paste("twitter.",bd,sep="")
k<-as.numeric(k)
	query <- mongo.bson.buffer.create()
	mongo.bson.buffer.start.object(query, 'created_at')
	mongo.bson.buffer.append.time(query, "$lte", strptime(y,"%Y-%m-%d"))
	mongo.bson.buffer.finish.object(query)
	mongo.bson.buffer.start.object(query, 'created_at')
	mongo.bson.buffer.append.time(query, "$gte", strptime(x,"%Y-%m-%d"))
	mongo.bson.buffer.finish.object(query)
	query <-mongo.bson.from.buffer(query)

	fields <-mongo.bson.buffer.create()
	mongo.bson.buffer.append(fields, "text", 1L)
	mongo.bson.buffer.append(fields, "id", 1L)
	mongo.bson.buffer.append(fields, "_id", 0L)
	fields <- mongo.bson.from.buffer(fields)

	twts <- mongo.find(mongo, ns = DBNS, query = query,
	 fields = fields, limit = 10000L)


	gids <- data.frame(stringsAsFactors = FALSE)
	while (mongo.cursor.next(twts)) {
		tmp <- mongo.bson.to.list(mongo.cursor.value(twts))
		tmp.df <- as.data.frame(t(unlist(tmp)), stringsAsFactors = F)
		gids <- rbind.fill(gids, tmp.df)
		}

	mach_corpus <- Corpus(VectorSource(gids$text))

			fc_stopwords<-function(dbs){
			switch(dbs,
				jr_mov = c('movistar','movistarmx','mimovistarmx','q','d','rt','hola','gracias', stopwords("es")),
				jr_telcel = c('telcel','serviciotelcel','servicio','rt','hola','gracias', stopwords("es")),
				jr_iusacell = c('iusacell','servicio','q','d','rt','hola','gracias', stopwords("es")))
		}

		stopwords<-fc_stopwords(bd)
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
	cl <- largest.cliques(g)
	colbar <- rainbow(length(cl) + 1)
	for (i in 1:length(cl)) {
	V(g)[cl[[i]]]$color <- colbar[i+1]
	}

	return(	plot(g, mark.groups=cl,vertex.size=.3, vertex.label.cex=1.5, edge.color=rgb(.4,.4,0,.3)))
	}



































	
