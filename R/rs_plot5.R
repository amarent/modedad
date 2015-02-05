rs_plot5<-function(x,y,k,bd,con){
#rs_kmediod_mov	
	library(tm)
	library(rmongodb) 
	library(fpc)
	library(plyr)	
	k<-as.numeric(k)
	m <- rs_todos(x,y,bd,con)

	word_freqs <- sort(rowSums(m), decreasing=TRUE) 
	dm <- data.frame(word=names(word_freqs), freq=word_freqs)

	termDocMatrix<-m[dm[1:k,1],]
	m3 <- t(termDocMatrix)
	pamResult <- pamk(m3, metric="manhattan")
	pamResult <- pamResult$pamobject
	layout(matrix(c(1,2),2,1))

	return(plot(pamResult, color=F, labels=4, lines=0, cex=.8, col.clus=1,col.p=pamResult$clustering))
	}
