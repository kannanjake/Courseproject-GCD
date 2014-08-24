url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,"zipfile",method="curl")
dir.create("tmpdir")
unzip("zipfile", exdir = "tmpdir" )
x_train <- read.table("tmpdir/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("tmpdir/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("tmpdir/UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("tmpdir/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("tmpdir/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("tmpdir/UCI HAR Dataset/test/subject_test.txt")
activity <- read.table("tmpdir/UCI HAR Dataset/activity_labels.txt")
features <- read.table("tmpdir/UCI HAR Dataset/features.txt")
unlink("tmpdir",recursive=TRUE)
unlink("zipfile",recursive=TRUE)


#merge x,y and subject files for test and train
x_tt<-rbind(x_train,x_test)
y_tt<-rbind(y_train,y_test)
subject_tt<-rbind(subject_train,subject_test)
#Add column names to subject dataset
colnames(subject_tt)<-"subjectid"
#Add appropriate variable names to the dataset of x using the features dataset - Step 4
colnames(x_tt)<-features[,2]

#Step3 - Add activity names to the dataset
activity_tt<-merge(y_tt,activity,sort=FALSE)

#Merge the variable dataset, activity names and subject names
xy_tt<-cbind(subject_tt,activity_tt[,2],x_tt)
colnames(xy_tt)[2]<-"Activity"

#Look only for columns containing mean and std
colmean<-grep("-mean",colnames(xy_tt))
colstd<-grep("-std",colnames(xy_tt))
colmeanstd<-c(colmean,colstd)

#filter out the variables containing only mean,std and retain the id variables
xy_meanstd<-xy_tt[,c(1,2,colmeanstd)]

#Create a tidy dataset with the average of the values by subject id + Activity
xy_tidy<-aggregate(.~subjectid+Activity,data=xy_meanstd,FUN=function(xy_meanstd) c(mn=mean(xy_meanstd)))

