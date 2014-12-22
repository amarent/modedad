maximo=function(rubro,mes,n) {
x<-getdata98(rubro,mes,n)
x<-x[!is.na(x[,1]),]

max<-paste("Maximo:",max(x))

min<-paste("Minimo:",min(x))

m3=mean(((x)-mean(x))^3)
asimetria=paste("Asimetria:",m3/(sd(x)^3))

sd<-paste("Desviacion estandar:",sd(x))

promedio<-paste("Promedio:",mean(x))
plot(-1,1,-1,1,type="n")
l<-list(max,min,asimetria,sd,promedio)

plot(-1:1, -1:1, type = "n", xlab = "Re", ylab = "Im")



#plot(-1:1,-1:1,type=n,xlab="",ylab="")
#text(x=-.8,y=c(-.8,-.4,0,.4,.8),labels=l)
#list(message=paste("Maximo: \n", max,"Minimo: \n", min,"Asimetria:\n",asimetria,"Desviacion estandar: \n", sd,"Promedio: \n", promedio))
}
