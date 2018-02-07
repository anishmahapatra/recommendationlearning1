data1<-read.csv("job_data.csv", as.is= TRUE)

#statements to convert NULL to Zero minexp
data1$minexp[is.na(data1$minexp)]=0
data1$minexp[data1$minexp=='NULL'] <-0
data1$minexp=as.numeric(data1$minexp)

#statements to convert NULL to Zero for maxexp
data1$maxexp[is.na(data1$maxexp)]=0
data1$maxexp[data1$maxexp=='NULL'] <-0
data1$maxexp=as.numeric(data1$maxexp)

#statements to convert NULL to Zero for mincompensation
data1$mincompensation[is.na(data1$mincompensation)]=0
data1$mincompensation[data1$mincompensation=='NULL'] <-0
data1$mincompensation[data1$mincompensation==-1] <-0
data1$mincompensation=as.numeric(data1$mincompensation)

#statements to convert NULL to Zero for maxcompensation
data1$maxcompensation[is.na(data1$maxcompensation)]=0
data1$maxcompensation[data1$maxcompensation=='NULL'] <-0
data1$maxcompensation[data1$maxcompensation==-1] <-0
data1$maxcompensation=as.numeric(data1$maxcompensation)
options("scipen"=100, "digits"=4)

#statements to convert NULL to Zero for numberofdays
  data1$numberofdays[is.na(data1$numberofdays)]=0
  data1$numberofdays[data1$numberofdays=='NULL'] <-0
  data1$numberofdays=as.numeric(data1$numberofdays)
  data1$numberofdays[data1$numberofdays==-1] <-0
  
#statements to convert NULL to Zero for additional compensation (kept in string)
  data1$additionalcompensation[data1$additionalcompensation=='NULL'] <-0
  
  write.csv(data1,file="job_data_removedNULL.csv")
