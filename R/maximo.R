maximo=function(rubro,mes,n) {
x<-getdata98(rubro,mes,n)
x<-x[!is.na(x[,1]),]
max<-max(x)
return(list(message=paste("el maximo es", max,"  "))
}
