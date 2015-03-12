getdata98 <- function(rubro, mes, n)
 {
 
 args <- list(
    n = n,
     variable = rubro,
     cve_mes = mes
     
      );
  
  myurl <- paste("http://10.225.240.98/edad/descargas.php?", 
    paste(names(args), args, sep="=", collapse="&"), sep="");
     
  mydata <- tryCatch(read.csv(myurl), error=function(e){
                 stop("Fallo !!")
  });
 mydata2<-as.data.frame(mydata[,2])
 row.names(mydata2)<-mydata[,1]
 colnames(mydata2)<-colnames(mydata)[2]
return(mydata2);
 }


