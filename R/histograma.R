histograma <- function(rubro, mes, n)
{
#  mydata<-getdata98(rubro,mes,n)




mydata<-c(2,3,4,1,3,2,8,4,3)
h<-hist(mydata,plot=F)
h$density<-with(h,100*density*diff(breaks)[1])
labs<-paste(round(h$density),"%",sep="")
plot(h,freq=F,labels=labs,ylim=c(0,1.08*max(h$density)),xlab=colnames(mydata),ylab="Frecuenciasss",col="green",border="red",main=paste("Histograma de ",colnames(mydata)))
}
