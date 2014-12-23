maximo=function(rubro,mes,n) {
#x<-getdata98(rubro,mes,n)
#x<-x[!is.na(x[,1]),]

x<-c(2,4,7,9,4,2,6,8,4,2,42,64,8,23,12)

max<-paste("Maximo:",max(x))

min<-paste("Minimo:",min(x))

m3=mean(((x)-mean(x))^3)
asimetria=paste("Asimetria:",m3/(sd(x)^3))

sd<-paste("Desviacion estandar:",sd(x))

promedio<-paste("Promedio:",mean(x))

l<-list(max,min,asimetria,sd,promedio)


plot(-1:1,-1:1,type="n",xlab="",ylab="",bty="n")
par(new=T)
text(x=-.5,y=c(-.8,-.4,0,.4,.8),labels=l,adj=0)
par(new=T)
plot(-1:1,-1:1,type="n",xlab="",ylab="",bty="n")
#list(message=paste("Maximo: \n", max,"Minimo: \n", min,"Asimetria:\n",asimetria,"Desviacion estandar: \n", sd,"Promedio: \n", promedio))
}
