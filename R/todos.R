x<-"2014-12-01"
y<-"2015-01-25"
bd<-"jr_movistar"

rs_todos<-function(x,y,bd){	
	library(tm)
	args <- list(
		fecha1 = x,
		fecha2 = y,
		companhia= bd
	);
	myurl <- paste("http://10.225.190.192/atweets/test2.php?",paste(names(args), args, sep="=", collapse="&"), sep="");
    
	mydata <- tryCatch(read.table(myurl,sep="\t",quote="\""), error=function(e){
              stop("Fallo !!")
		});

	#mydata<-as.data.frame(mydata[,1])
	colnames(mydata)<-c("text")
	fc_stopwords<-function(dbs){
		switch(dbs,
			jr_movistar = c('movistar','movistarmx','mimovistarmx','q','d','rt','hola','gracias', stopwords("es")),
			jr_telcel = c('telcel','serviciotelcel','servicio','rt','hola','gracias', stopwords("es")),
			jr_iusacell = c('iusacell','iusacell','servicio','q','d','rt','hola','gracias', stopwords("es")))
			}
	stopwords<-fc_stopwords(bd)
	mach_corpus <- Corpus(VectorSource(as.vector(mydata)))
	tdm <- TermDocumentMatrix(mach_corpus,
   	control = list(removePunctuation = TRUE,
   	stopwords = stopwords,
   	removeNumbers = TRUE, tolower = TRUE))
	m <- as.matrix(tdm)
	return(m)
}
