maximo=function(rubro,mes,n) {
x<-getdata98(rubro,mes,n)
x<-x[!is.na(x[,1]),]

#x<-c(2,4,7,9,4,2,6,8,4,2,42,64,8,23,12)

max<-paste("Maximo:",round(max(x),2))
min<-paste("Minimo:",round(min(x),2))
m3=mean(((x)-mean(x))^3)
asimetria=paste("Asimetria:",round(m3/(sd(x)^3),2))
sd<-paste("Desviacion estandar:",round(sd(x),2))
promedio<-paste("Promedio:",round(mean(x),2))
m4=mean((x-mean(x))^4) 
kurtosis=paste("Kurtosis:",m4/(sd(x)^4)-3)

l<-list(max,min,asimetria,sd,promedio,kurtosis)

plot(-1:1,-1:1,type="n",xlab="",ylab="",bty="n",xaxt='n',yaxt='n')
par(new=T)
text(x=-1,y=c(-.7,-.3,0,.3,.7,.9),labels=l,adj=0)
#par(new=T)
#plot(-1:1,-1:1,type="n",xlab="",ylab="",bty="n",xaxt='n',yaxt='n')
#list(message=paste("Maximo: \n", max,"Minimo: \n", min,"Asimetria:\n",asimetria,"Desviacion estandar: \n", sd,"Promedio: \n", promedio))
}
