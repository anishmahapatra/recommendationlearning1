mydata1<-read.csv("job_data.csv")
mydata1$minexp[mydata1$minexp=='NULL'] <- 0
write.csv(mydata1,file="v1.csv")

clean1 <-function(ttt){
  as.numeric( gsub('[^a-zA-Z0-9.]', '', ttt))
  ttt[ttt=='null'] <- 0
}

##############################################
clean1()
data1$maxexp[is.na(data1$maxexp)] <-0
data1$maxexp
data1$minexp[data1$minexp=='NULL']<- 0
data1$minexp
##############################################
mydata2<-mydata1(as.numeric(mydata1$jobid))
mydata3<-gsub('[^a-zA-Z0-9.]', '',mydata1)
mydata4<-mydata1
mydata4$minexp[mydata4$minexp=='NULL'] <- 0
#removing NULL values from min and max experirnce(in months) 
#and making the value 0 and writing the value to jobtrial2
mydata4$minexp[mydata4$minexp=='NULL'] <- 0
#mydata4$maxexp[mydata4$maxexp=='NULL'] <- 0
#gsub( ',', '', mydata4$maxexp)
#mydata4$maxexp<-as.numeric(mydata4$maxexp)
#mydata4$maxexp(is.na(mydata4$maxexp)) <- 0
#write.csv(mydata4,file="jobtrial2.csv")
mydata2<-mydata1
mydata2$mincompensation[is.na(mydata2$mincompensation)] <- 0

