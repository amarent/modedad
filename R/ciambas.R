ciambas<-function(rubro,mes,n) {

mydata<-getdata98(rubro,mes,n)
x<-mydata[!is.na(mydata[,1]),]
x<-x[x>quantile(x,.90)]

mydataD<-getdata98Var(rubro)
max<-paste("Maximo:",round(max(x),2))
min<-paste("Minimo:",round(min(x),2))
m3=mean(((x)-mean(x))^3)
asimetria=paste("Asimetria:",round(m3/(sd(x)^3),2))
sd<-paste("Desv. est.:",round(sd(x),2))
promedio<-paste("Media:",round(mean(x),2))
m4=mean((x-mean(x))^4) 
kurtosis=paste("Kurtosis:",round(m4/(sd(x)^4)-3),2)

l<-list(promedio,sd,max,min,asimetria,kurtosis)

h<-hist(x,plot=F)
h$density<-with(h,100*density*diff(breaks)[1])
labs<-paste(round(h$density),"%",sep="")


clean<- function(some_txt)
{
some_txt = gsub("\xed", "í", some_txt)
some_txt = gsub("\xe1", "á", some_txt)
some_txt = gsub("\xfa", "ú", some_txt)
some_txt = gsub("Ã¡", "á", some_txt)
some_txt = gsub("Ãº", "ú", some_txt)
some_txt = gsub("Ã©", "é", some_txt)
}
desc<-clean(as.character(mydataD$DESCRIPCION))

l2<-list(desc)
#layout(matrix(c(1,3,2,3),2,2,byrow=T),widths=c(1,3),heights=c(1,2))
layout(matrix(c(1,2,2,2,2,2,
		1,2,2,2,2,2,
		1,3,3,3,3,3,
		1,3,3,3,3,3,
		1,3,3,3,3,3,
		1,3,3,3,3,3,
		1,3,3,3,3,3,
		1,3,3,3,3,3), 6, 8, byrow = FALSE))
#plot(-2:2,-2:2,type="n",xlab="",ylab="",bty="n",xaxt='n',yaxt='n')
plot(-2:2,-2:2)
text(x=0,y=0,labels=l2,cex=2.5)
plot(-1:1,-1:1,type="n",xlab="",ylab="",bty="n",xaxt='n',yaxt='n')
text(x=-1,y=c(.8,.6,.4,.2,0,2),labels=l,adj=0,cex=2)
plot(h,freq=F,labels=labs,ylim=c(0,1.08*max(h$density)),xlab=colnames(mydata),ylab="(porcentaje)",col="#51C6D9",border="#00517A",main="")

#par(mfrow=c(2,2))
#plot(-1:1,-1:1,type="n",xlab="",ylab="",bty="n",xaxt='n',yaxt='n')
#par(new=T)
#text(x=-1,y=c(.8,.6,.4,.2,0,2),labels=l,adj=0)

#par(bg="white")
#plot(h,freq=F,labels=labs,ylim=c(0,1.08*max(h$density)),xlab=desc,ylab="Frecuencias",col="#51C6D9",border="#00517A",main=paste("Histograma de ",colnames(mydata)))


#l2<-list(desc)
#plot(-1:1,-1:1,type="n",xlab="",ylab="",bty="n",xaxt='n',yaxt='n')
#text(x=-1,y=c(-.5),labels=l2,adj=0)
}
