clean1()
data1$maxexp[is.na(data1$maxexp)] <-0
data1$minexp
data1$minexp[data1$minexp]<- 0
data1$minexp

clean <-function(ttt){
  as.numeric( gsub('[^a-zA-Z0-9.]', '', ttt))
}

clean2 <-function(sss){
  as.numeric( gsub('[a-zA-Z0-9.]', '', sss))
  sss[is.na(sss)] <-0
  sss[sss=='NULL']<-0
}

clean2 <-function(sss){
  as.numeric( gsub('[^0-9.]', '', data1$maxexp))
  #data1$maxexp[is.na(data1$maxexp] <-0
  data1$minexp[data1$minexp] <- 0
}

data1<-read.csv("job_data.csv")
data1$minexp

data1$maxexp[is.na(data1$maxexp)] <-0
data1$maxexp[data1$maxexp=='NULL']<-0
