rs_plot12<-function(x,y,k,con,bd){	
#nuage_mov
	library(tm)
	library(rmongodb) 
	library(plyr)
	library(wordcloud)
	library(RColorBrewer)
	k<-as.numeric(k)
	m <- rs_todos(x,y,bd,con)

	word_freqs <- sort(rowSums(m), decreasing=TRUE) 
	dm <- data.frame(word=names(word_freqs), freq=word_freqs)
	return(wordcloud(dm$word, dm$freq, min.freq=k, random.order=FALSE, colors=brewer.pal(8, "Dark2")))
	}



































	
