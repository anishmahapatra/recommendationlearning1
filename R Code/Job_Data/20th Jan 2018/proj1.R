#reading the reviews,csv file
b<-read.csv("reviews.csv")
b[is.na(b)]<-""

table(is.na(b))
rowSums(is.na(b))

#To output the file MyData.csv after updating
install.packages("x")
write.table(mydata, "c:/mydata.txt", sep="\t") 
write.csv(b, file = "MyData.csv")

#Using only those Amazon reviews that have no. of helpful
reducedset1<-function(){
  y <- which (b$HelpfulnessDenominator>=10)
}


#Write more copies out
write.csv(b, file = "MyData1.csv",row.names=FALSE, na="")
write.csv(MyData, file = "MyData.csv",row.names=FALSE, na="")

#Change the fullstops to blanks
a=gsub("[.]","",b)
b$Text <- gsub("[.]","", b$Text)
write.csv(b, file = "MyData1.csv",row.names=FALSE, na="")


library(ggplot2)
Needed <- c("tm", "SnowballCC", "RColorBrewer", "ggplot2", "wordcloud", "biclust", "cluster", "igraph", "fpc")   
install.packages(Needed, dependencies=TRUE)   
install.packages("Rcampdf", repos = "http://datacube.wu.ac.at/", type = "source")   


cname <- file.path("C:", "texts")   
cname   
dir(cname)

library(tm)   
docs <- Corpus(DirSource(cname))   

summary(docs)  
install.packages("NLP")


library(SnowballC)   
b <- tm_map(b, stemDocument)   
b[rowSums(is.na(b)) == 0,]

#NA was removed
LoadData<-read.csv("RemovedNA.csv")
FD1 <- subset(LoadData, HelpfulnessDenominator >= 10)

y<-FD1[FD1$HelpfulnessDenominator >= 10, ]
n<-y[!duplicated(y), ]
