mydata4$minexp[mydata4$minexp=='NULL'] <- NA
mydata4$minexp[is.na(mydata4$minexp)] <- 0
mydata4$minexp

as.numeric( gsub('[^0-9.]', '', mydata4$maxexp))
mydata4$maxexp[mydata4$maxexp=='NULL'] <- NA
h<-data1$maxexp
#h[which(is.na(h)==T)] <-0
#h[is.character(h) & h=="<NA>"] <- "0"
#h[is.numeric(h) & is.na(h)] <- 0

data2 <- as.matrix(data1) 
mode(data2)
"character"
x<-data1$maxexp
X[is.character(X) & X=="<NA>"] <- "0"




myDataM=as.data.frame(lapply(x, function(x)if(class(x)=="factor")as.character(x)else x))

b[which(is.na(b) == T)]<-0
mydata4$maxexp[mydata4$maxexp=='NA'] <- 0
mydata4$maxexp
