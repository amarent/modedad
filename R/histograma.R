histograma <- function(rubro, mes, n)
{
  mydata<-getdata98(rubro,mes,n)


  h<-hist(mydata[,1],main=paste("Histograma de ",colnames(mydata)), 

h<-hist(mydata,main=paste("Histograma de ",colnames(mydata),plot=F,xlab=colnames(mydata),ylab="Frecuencia",breaks=19,col="green",border="red",freq =TRUE))
h$density<-with(h,100*density*diff(breaks)[1])
labs<-paste(round(h$density),"%",sep="")
plot(h,freq=F,labels=labs,ylim=c(0,1.08*max(h$density)),...)
}
