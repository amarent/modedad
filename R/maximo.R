maximo=function(rubro,mes,n) {
x<-getdata98(rubro,mes,n)
x<-x[!is.na(x,2),]
max<-max(x)
return(list(message=paste("el maximo es", max,"  ")))
}
