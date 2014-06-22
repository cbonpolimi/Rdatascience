

#read all the files 

setwd("C:\\Users\\Carlo\\Documents\\R\\UCI HAR Dataset\\test")
rawtest<-read.table("X_test.txt")
setwd("C:\\Users\\Carlo\\Documents\\R\\UCI HAR Dataset\\train")

rawtrain<-read.table("X_train.txt")
features<-read.table("features.txt")

setwd("C:\\Users\\Carlo\\Documents\\R\\UCI HAR Dataset\\train")
subjecttrain<-read.table("subject_train.txt")
ytrain<-read.table("y_train.txt")

setwd("C:\\Users\\Carlo\\Documents\\R\\UCI HAR Dataset\\test")
ytest<-read.table("y_test.txt")
subjecttest<-read.table("subject_test.txt")
#add a new coulmn for subject data   
rawtest$new.col <- subjecttest
rawtrain$new.col <-subjecttrain
#add a new coulmn for category data( test or train)
rawtest$new1.col <- c("test")
rawtrain$new1.col <- c("train")
#add a new coulmn for activities data( 1:6)

rawtest$new2.col <-ytest
rawtrain$new2.col <-ytrain


#add a new coulmn to features data for labels subject, activity, and category)


newrow = c("subject")
newrow1 = c("activity")
newrow = c("subject")
features[,"V2"] <- as.character(features[,"V2"]) 
features = rbind(features,newrow)
features = rbind(features,newrow1)

#naming of variables based on the features dataframe 

names(rawtest)<-features[,2]
names(rawtrain)<-features[,2]



library(plyr)
new<-rbind(rawtest,rawtrain)

#subsetting dataframe to find only column with mean  

mean<-new[grep("mean()",names(new))]

#it takes also meanFreq() so we have to filter the data 

Freq<-mean[grep("Freq()",names(mean))]

# make a subset of the values different from Freq

meanfinal <- mean[names(mean)[!names(mean) %in% names(Freq)]]


#another dataframe only for standard deviation

std<-new[grep("std()",names(new))]


# to create the new tidy data sets I use the aggregate function
a<-aggregate.data.frame(new,by=list(new$activity,new$subject),mean,simplify=T)

write.table(a, file = "final.txt",quote=T)
