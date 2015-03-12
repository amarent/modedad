getdata98Var <- function(rubro)
 {
 
 args <- list(
     variable = rubro
     
      );
  
  myurl <- paste("http://10.225.240.98/edad/descargasvar.php?", 
    paste(names(args), args, sep="=", collapse="&"), sep="");
     
  mydata <- tryCatch(read.csv(myurl), error=function(e){
                 stop("Fallo !!")
  });
#mydata2<-as.data.frame(mydata[1])
#colnames(mydata2)<-colnames(mydata)
return(mydata);
 }
