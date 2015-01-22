rs_plot5<-function(x,y,k,bd){
#rs_kmediod_mov	
	library(tm)
	library(rmongodb) 
	library(fpc)
	library(plyr)	
	k<-as.numeric(k)
	mongo <- mongo.create()
	DBNS <- paste("twitter.",bd,sep="")

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

	stopwords = c("movistar", "movistarmx","mimovistarmx","q","d","rt",'hola','gracias', stopwords("es"))
	tdm <- TermDocumentMatrix(mach_corpus,
   	control = list(removePunctuation = TRUE,
   	stopwords = stopwords,
   	removeNumbers = TRUE, tolower = TRUE,wordLengths=c(1,Inf)))
	m <- as.matrix(tdm)
	word_freqs <- sort(rowSums(m), decreasing=TRUE) 
	dm <- data.frame(word=names(word_freqs), freq=word_freqs)
	termDocMatrix<-m[dm[1:k,1],]
	m3 <- t(termDocMatrix)
	pamResult <- pamk(m3, metric="manhattan")
	pamResult <- pamResult$pamobject
	layout(matrix(c(1,2),2,1))

	return(plot(pamResult, color=F, labels=4, lines=0, cex=.8, col.clus=1,col.p=pamResult$clustering))
	}
