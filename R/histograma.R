histograma <- function(rubro, mes, n)
{
  mydata<-getdata98(rubro,mes,n)




mydata<-c(2,3,4,56,3,2,24,8,4,3,23,456,78,64,3,56,89,89)
h<-hist(mydata,main=paste("Histograma de ",colnames(mydata)),plot=F)
h$density<-with(h,100*density*diff(breaks)[1])
labs<-paste(round(h$density),"%",sep="")
plot(h,freq=F,labels=labs,ylim=c(0,1.08*max(h$density),xlab=colnames(mydata),ylab="Frecuencia",breaks=19,col="green",border="red"),...)
}
