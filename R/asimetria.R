asimetria=function(rubro,mes,n) {
x<-getdata98(rubro,mes,n)
m3=mean(((x)-mean(x))^3)
asimetria=m3/(sd(x)^3)
}