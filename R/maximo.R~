maximo=function(rubro,mes,n) {
x<-getdata98(rubro,mes,n)
x<-x[!is.na(x[,1]),]

max<-max(x)

min<-min(x)

m3=mean(((x)-mean(x))^3)
asimetria=m3/(sd(x)^3)

sd<-sd(x)

promedio<-mean(x)

cat(
"Maximo:","/n", max,
"Minimo:", min,
"Asimetria:", asimetria,
"Desviacion estandar:", sd,
"Promedio:", promedio)
}
