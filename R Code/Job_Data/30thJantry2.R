data2<-read.csv("jdtry2.csv", as.is = TRUE)

as.Date(data2$datecreated,format='%m/%d/%Y')

#data2$datecreated <- strptime(data2$datecreated, format="%m/%d/%Y %H:%M:%S")
#class(data2$datecreated)
write.csv(data2, "jdtry3.csv")

data2<-data2[strptime(data2$datecreated, format="%m/%d/%Y %H:%M")]
