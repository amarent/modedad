rs_plot11<-function(x,y,k,con,bd,rt,hr,t){
	#kmediod_mov
	library(tm)
	library(rmongodb) 
	library(plyr)
	library(fpc)
	k<-as.numeric(k)
	m <- rs_todos(x,y,bd,con,rt,hr,t)


	word_freqs <- sort(rowSums(m), decreasing=TRUE) 
	dm <- data.frame(word=names(word_freqs), freq=word_freqs)
	termDocMatrix<-m[dm[1:k,1],]
	m3 <- t(termDocMatrix)
	pamResult <- pamk(m3, metric="manhattan")
	pamResult <- pamResult$pamobject
	layout(matrix(c(1,2),2,1))

	return(plot(pamResult, color=F, labels=4, lines=0, cex=.8, col.clus=1,col.p=pamResult$clustering))
	}



































	
