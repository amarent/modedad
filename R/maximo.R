maximo=function(rubro,mes,n) {
x<-getdata98(rubro,mes,n)
max<-summary(x)
return(list(message=paste("el maximo es", max,"  ")))
}
