##Download and unzip the data
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","Dataset.zip")
unzip("Dataset.zip")
##Merge the data
trainXData<-read.table("./UCI HAR Dataset/train/X_train.txt")
testXData<-read.table("./UCI HAR Dataset/test/X_test.txt")
XData<-rbind(trainXData,testXData)
##Only use the mean and std data
features<-read.table("./UCI HAR Dataset/features.txt")
meanStd<-grep("mean\\(\\)|std\\(\\)",features[,2])
XData<-XData[,meanStd]
##Label the data
labels<-features[meanStd,2]
colnames(XData)<-labels
##Join with activity
activity<-read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activity)<-c("activityNbr","activity")
YTrain<-read.table("./UCI HAR Dataset/train/y_train.txt")
YTest<-read.table("./UCI HAR Dataset/test/y_test.txt")
YData<-rbind(yTrain,yTest)
colnames(YData)<-"activityNbr"
activityYData<-merge(YData,activity,by="activityNbr" )
XData$activity<-activityYData$activity
##Join with subjects
trainSubject<-read.table("./UCI HAR Dataset/train/subject_train.txt")
testSubject<-read.table("./UCI HAR Dataset/test/subject_test.txt")
subject<-rbind(trainSubject,testSubject)
colnames(subject)<-"subject" 
XData$subject<-subject$subject
##Write to file
write.csv(XData,"./tidy_train_test_data.csv",row.names=FALSE)
##Mean values grouped by subject and activity
meanXData<-aggregate(x = XData[,1:66],by = list(activity=XData$activity,subject=XData$subject),FUN = mean)
write.csv(meanXData,"./mean_tidy_train_test_data.csv",row.names=FALSE)