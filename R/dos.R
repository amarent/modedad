histograma <- function(rubro, mes, n)
{
mydata<-getdata98(rubro,mes,n)
#  mydata<-c(2,3,4,1,3,2,8,4,3)
x<-mydata[!is.na(mydata[,1]),]

max<-paste("Maximo:",round(max(x),2))
min<-paste("Minimo:",round(min(x),2))
m3=mean(((x)-mean(x))^3)
asimetria=paste("Asimetria:",round(m3/(sd(x)^3),2))
sd<-paste("Desviacion estandar:",round(sd(x),2))
promedio<-paste("Promedio:",round(mean(x),2))
m4=mean((x-mean(x))^4) 
kurtosis=m4/(sd(x)^4)-3  

h<-hist(mydata,plot=F,bg="yellow")
h$density<-with(h,100*density*diff(breaks)[1])
labs<-paste(round(h$density),"%",sep="")
par(bg="blue")
plot(h,freq=F,labels=labs,ylim=c(0,1.08*max(h$density)),xlab=colnames(mydata),ylab="Frecuencias",col="#8DC63F",border="#51C6D9",main=paste("Histograma de ",colnames(mydata)))

text(x=-1,y=c(-.7,-.3,0,.3,.7,.9),labels=l,adj=0)
}
