# Getting and Cleaning Data
if (!require(data.table)) install.packages("data.table"); library(data.table)
if (!require(dplyr)) install.packages("dplyr"); library(dplyr)

# Download, unzip data
f.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
df <- "CourseDataset.zip"
if (!file.exists(df)){
  download.file(f.url, destfile = df, mode='wb')
}
if (!file.exists("./UCI_HAR_Dataset")){
  unzip(df)
}
dnld.date <- date()

# Start reading files
setwd("/cloud/project/UCI HAR Dataset")

# Reading activity
a.test <- read.table("./test/y_test.txt", header = F)
a.train <- read.table("./train/y_train.txt", header = F)

# Reading features
f.test <- read.table("./test/X_test.txt", header = F)
f.train <- read.table("./train/X_train.txt", header = F)

# Reading subject
s.test <- read.table("./test/subject_test.txt", header = F)
s.train <- read.table("./train/subject_train.txt", header = F)

# Reading Activity Lable
a.lable <- read.table("./activity_labels.txt", header = F)

# Read Feature Name
f.name <- read.table("./features.txt", header = F)

# Merge data
f.df <- rbind(f.test, f.train)
s.df <- rbind(s.test, s.train)
a.df <- rbind(a.test, a.train)

# Renaming columns data
names(a.df) <- "ActivityN"
names(a.lable) <- c("ActivityN", "Activity")

# Get Activity names
Activity <- left_join(a.df, a.lable, "ActivityN")[, 2]

# Rename subject columns
names(s.df) <- "Subject"

# Rename f.df columns using columns from f.name
names(f.df) <- f.name$V2

# Create unified Dataset
DataSet <- cbind(s.df, Activity)
DataSet <- cbind(DataSet, f.df)

# Create New dataset by extracting only the measurements on the mean and standard deviation for each measurement
sF.name <- f.name$V2[grep("mean\\(\\)|std\\(\\)", f.name$V2)]
DataNames <- c("Subject", "Activity", as.character(sF.name))
DataSet <- subset(DataSet, select=DataNames)

# Rename the columns with descriptive activity names
names(DataSet)<-gsub("^t", "time", names(DataSet))
names(DataSet)<-gsub("^f", "frequency", names(DataSet))
names(DataSet)<-gsub("Acc", "Accelerometer", names(DataSet))
names(DataSet)<-gsub("Gyro", "Gyroscope", names(DataSet))
names(DataSet)<-gsub("Mag", "Magnitude", names(DataSet))
names(DataSet)<-gsub("BodyBody", "Body", names(DataSet))

# Create independent tidy data
SecondDataSet<-aggregate(. ~Subject + Activity, DataSet, mean)
SecondDataSet<-SecondDataSet[order(SecondDataSet$Subject,SecondDataSet$Activity),]

# Save tidy dataset
write.table(SecondDataSet, file = "tidydata.txt",row.name=FALSE)
