#trying to remove unnecessary stuff from the text
data2<-read.csv("job_data.csv")

data3<-read.csv("job_data.csv", as.is= TRUE)
data3$professions<-  gsub('[^a-zA-Z0-9.]', ' ', data3$professions)

b<-a[!grepl("<ul>|<p>|<li>",a)] 

a<-"<ul><li>Bachelor's Degree in any art discipline. Game design/art degree or diploma is a big plus</li><li>2-6 years of gaming industry experience creating game art for high" 
data3$primaryrequirement<- gsub('[^0-9a-zA-Z]+', '', data3$primaryrequirement)
data3$professions<-  gsub('[^a-zA-Z0-9.]', '', data3$professions)

data3$professions<- gsub('$$$', ' ', data3$professions)


