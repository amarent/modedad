nuage_hist_mov<-function(k,x,y){	

	library(tm)
	library(rmongodb) 
	library(plyr)
	library(wordcloud)
	library(RColorBrewer)

k<-as.numeric(k)
args <- list(
apariciones = k,
fecha1 = x,
fecha2 = y
#base_datos=bd
);
myurl <- paste("http://10.225.190.192/atweets/test.php?",paste(names(args), args, sep="=", collapse="&"), sep="");
    
mydata <- tryCatch(read.table(myurl,sep="\t",quote="\""), error=function(e){
              stop("Fallo !!")
});

mydata<-as.data.frame(mydata[,1])
colnames(mydata)<-c("text")

	mach_corpus <- Corpus(VectorSource(as.vector(mydata)))
	tdm <- TermDocumentMatrix(mach_corpus,
   	control = list(removePunctuation = TRUE,
   	stopwords = c("movistar", "movistarmx","mimovistarmx","problemas","problema","hola","gracias", stopwords("es")),
   	removeNumbers = TRUE, tolower = TRUE))
	m <- as.matrix(tdm)
	word_freqs <- sort(rowSums(m), decreasing=TRUE) 
	dm <- data.frame(word=names(word_freqs), freq=word_freqs)
	
        #par(mfrow=c(1,2))

	wordcloud(dm$word, dm$freq,max.words=k,random.order=FALSE, colors=brewer.pal(8, "Dark2"))
	#head(dm,k)
	#par(las=2)
	#par(mar=c(5,8,4,2))
	#barplot(dm[1:17,2],horiz=TRUE,names.arg=dm[1:17,1],col="darkblue")
}
