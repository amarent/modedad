kurtosis=function(rubro,mes,n) {
x<-getdata98(rubro,mes,n)
m4=mean((x-mean(x))^4) 
kurt=m4/(sd(x)^4)-3  
}