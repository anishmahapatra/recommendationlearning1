data1<-read.csv("job_data_removedNULL.csv", as.is = TRUE)

#DateActivated ka change NULL to 0
data1$dateactivated[is.na(data1$dateactivated)]=0
data1$dateactivated[data1$dateactivated=='NULL'] <-0
data1$dateactivated[data1$dateactivated==-1] <-0
#data1$dateactivated=as.numeric(data1$dateactivated)
options("scipen"=100, "digits"=4)

#DateUpdated ka change NULL to 0
data1$dateupdated[is.na(data1$dateupdated)]=0
data1$dateupdated[data1$dateupdated=='NULL'] <-0
data1$dateupdated[data1$dateupdated==-1] <-0
#data1$dateupdated=as.numeric(data1$dateupdated)

#DateCreated ka change NULL to 0
data1$datecreated[is.na(data1$datecreated)]=0
data1$datecreated[data1$datecreated=='NULL'] <-0
data1$datecreated[data1$datecreated==-1] <-0
#data1$datecreated=as.numeric(data1$datecreated)

#ExpiryDate ka change NULL to 0
data1$expirydate[is.na(data1$expirydate)]=0
data1$expirydate[data1$expirydate=='NULL'] <-0
data1$expirydate[data1$expirydate==-1] <-0
#data1$expirydate=as.numeric(data1$expirydate)

write.csv(data1,file="jdtry2.csv")



