ambas<-function(rubro,mes,n) {
mydata<-getdata98(rubro,mes,n)
x<-mydata[!is.na(mydata[,1]),]

max<-paste("Maximo:",round(max(x),2))
min<-paste("Minimo:",round(min(x),2))
m3=mean(((x)-mean(x))^3)
asimetria=paste("Asimetria:",round(m3/(sd(x)^3),2))
sd<-paste("Desviacion estandar:",round(sd(x),2))
promedio<-paste("Promedio:",round(mean(x),2))
m4=mean((x-mean(x))^4) 
kurtosis=paste("Kurtosis:",round(m4/(sd(x)^4)-3),2)

l<-list(max,min,asimetria,sd,promedio,kurtosis)

h<-hist(mydata[,1],plot=F)
h$density<-with(h,100*density*diff(breaks)[1])
labs<-paste(round(h$density),"%",sep="")

par(mfrow=c(1,2))

plot(-1:1,-1:1,type="n",xlab="",ylab="",bty="n",xaxt='n',yaxt='n')
par(new=T)
text(x=-1,y=c(-.9,-.6,-.3,0,.3,.6),labels=l,adj=0)

par(bg="white")
plot(h,freq=F,labels=labs,ylim=c(0,1.08*max(h$density)),xlab=colnames(mydata),ylab="Frecuencias",col="#51C6D9",border="#00517A",main=paste("Histograma de ",colnames(mydata)))
}
