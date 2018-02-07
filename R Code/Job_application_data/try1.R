data1<-read.csv("job_applicant_data.csv", as.is=TRUE)
data1<-read.csv("job_applicant_data.csv")


#Code to remove NULL from experience_in_months
data1$experience_in_months[is.na(data1$experience_in_months)]=0
data1$experience_in_months[data1$experience_in_months=='NULL'] <-0
data1$experience_in_months[data1$experience_in_months==-1] <-0
data1$experience_in_months=as.numeric(data1$experience_in_months)

#Code to remove NULL from salary
data1$salary[is.na(data1$salary)]=0
data1$salary[data1$salary=='NULL'] <-0
data1$salary[data1$salary==-1] <-0
data1$salary=as.numeric(data1$salary)

#Code to remove NULL from Notice Period
data1$noticeperiod[is.na(data1$noticeperiod)]=0
data1$noticeperiod[data1$noticeperiod=='NULL'] <-0
data1$noticeperiod[data1$noticeperiod==-1] <-0
data1$noticeperiod=as.numeric(data1$noticeperiod)

#Code to reoptions(scipen=999)move scientific notation
options(scipen=999)

#Code to output csv file
write.csv(data1,file="jad2.csv")

#code to remve outliers
data2<-read.csv("jad2.csv",as.is=TRUE)
datax<-data2$salary
summary(datax)
boxplot(datax)

bench1 <- 1000000 +1.5*IQR(datax)
bench1
bench2 <- 32500 -1.5*IQR(datax)
bench2

datax <- datax[datax<bench1]
datax <- datax[datax>bench2]
summary(datax)
boxplot(datax)

#Code to do Winsorizing 
write.csv(data1,file="jad2.csv")

data2<-read.csv("jad2.csv",as.is=TRUE)
datax1<-data2$salary
summary(datax1)
boxplot(datax1)

bench1 <- 1000000 +1.5*IQR(datax1)
bench1

datax1[datax1 > bench1]<- bench
summary(datax1)
boxplot(datax1)

#Variable transformation

data2<-read.csv("jad2.csv",as.is=TRUE)
datax2<-data2$salary
summary(datax2)
boxplot(datax2)

datax2_log<-log(datax2)
boxplot(datax2_log)


#kNN imputation
analysis1 <- kNN(data1, variable = c("experience_in_months","salary"), k = 2)
