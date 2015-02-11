rs_plot9<-function(x,y,k,bd,con,rt,hr){
	#hist_mov
	library(tm)
	library(rmongodb) 
	library(plyr)
	k<-as.numeric(k)
	m <- rs_todos(x,y,bd,con,rt,hr)


	word_freqs <- sort(rowSums(m), decreasing=TRUE) 
	dm <- data.frame(word=names(word_freqs), freq=word_freqs)
	head(dm,k)
	par(las=2)
	par(mar=c(5,8,4,2))
	return(barplot(dm[1:k,2],horiz=TRUE,names.arg=dm[1:k,1],col="darkblue"))
	}



































	
