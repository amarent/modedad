histograma <- function(rubro, mes, n)
{
  mydata<-getdata98(rubro,mes,n)
  hist(mydata[,1],main=paste("Histograma de ",colnames(mydata)), xlab=colnames(mydata),ylab="Frecuencia",breaks=19,col="green", border="red",freq = TRUE)

}
