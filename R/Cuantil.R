Cuantil=function(rubro,mes,n) {
x<-getdata98(rubro,mes,n)
quantile(x,.25)
}