maximo=function(rubro,mes,n) {
x<-getdata98(rubro,mes,n)
x<-x[!is.na(x[,1]),]

max<-max(x)

min<-min(x)

m3=mean(((x)-mean(x))^3)
asimetria=m3/(sd(x)^3)

sd<-sd(x)

promedio<-mean(x)

message=(list("Maximo: \n", max,"Minimo: \n", min,"Asimetria: \n",asimetria,"Desviacion estandar: \n", sd,"Promedio: \n", promedio))
}
