rs_plot12<-function(x,y,k,con,bd,rt,hr,t){	
#nuage_mov
	library(tm)
	library(rmongodb) 
	library(plyr)
	library(wordcloud)
	library(RColorBrewer)
	k<-as.numeric(k)
	m <- rs_todos(x,y,bd,con,rt,hr,t)

	word_freqs <- sort(rowSums(m), decreasing=TRUE) 
	dm <- data.frame(word=names(word_freqs), freq=word_freqs)
	
        par(mfrow=c(1,2))

	wordcloud(dm$word, dm$freq,max.words=k,random.order=FALSE, colors=brewer.pal(8, "Dark2"))
	head(dm,k)
	par(las=2)
	par(mar=c(5,8,4,2))
	barplot(dm[1:17,2],horiz=TRUE,names.arg=dm[1:17,1],col="darkblue")
	}



































	
