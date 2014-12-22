maximo=function(rubro,mes,n) {
x<-getdata98(rubro,mes,n)
x<-x[!is.na(x[,1]),]

max<-max(x)

min<-min(x)

m3=mean(((x)-mean(x))^3)
asimetria=m3/(sd(x)^3)

sd<-sd(x)

promedio<-mean(x)

message=(list(c("Maximo: \n", max),c("Minimo: \n", min),c("Asimetria: \n",asimetria),c("Desviacion estandar: \n", sd),c("Promedio: \n", promedio)))
}
