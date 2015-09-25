############ DEFAULT DATA DOWNLOADING CODE #############
getwd()
setwd("C:/Users/zangl.f/Documents/My Box Files/private/Coursera/Data Science/Data Scientist Specialization/03 Getting and Cleaning Data")
if(!file.exists("./data")){dir.create("./data")}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile = "./data/assignment3.zip")
unzip("./data/assignment3.zip")

########### PART 1 - MERGING THE DATASETS ##############
## reading test data set
test_data <- read.table("./UCI HAR Dataset/test/X_test.txt", stringsAsFactors = F)
test_id <- read.table("./UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = F)
test_activity <- read.table("./UCI HAR Dataset/test/y_test.txt", stringsAsFactors = F)
## reading training data set
train_data <- read.table("./UCI HAR Dataset/train/X_train.txt", stringsAsFactors = F)
train_id <- read.table("./UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = F)
train_activity <- read.table("./UCI HAR Dataset/train/y_train.txt", stringsAsFactors = F)
## merge data sets and remove tables no longer needed to free memory
DS_test <- cbind(test_id,test_activity,test_data)
rm(test_id,test_activity,test_data)
DS_train <- cbind(train_id,train_activity,train_data)
rm(train_id,train_activity,train_data)
DS <- rbind(DS_test,DS_train)
rm(DS_test,DS_train)
## reading headers and naming columns
features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = F)
## features <- gsub("-","_",features) ==> to replace all instances in a string (stands for 'global')
## sub will only remove the first instance

DS_headers <- c("subject","activity_num",as.vector(features$V2))
class(features)
head(features)
names(DS) <- DS_headers
rm(features, DS_headers)

########### PART 2 - EXTRACT MEASUREMENTS ##############
library(dplyr)
DS_subset <- select(DS, subject, activity_num, contains("mean|std", ignore.case = TRUE))

########### PART 3 - INSERT MEANINGFUL ACTIVITY NAMES ##############
## Create a data frame with meaningful activity names and their ID
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = F)
## add an empty column to insert the activity name in
DS_subset <- mutate(DS_subset,activity_name = "")
## look up the activity name in the data.frame with the labels
for (i in 1:nrow(DS_subset)){
     DS_subset$activity_name[i] <- activity_labels[DS_subset$activity_num[i],2]
}
## try with factor?
## data[,2] <- factor(data[,2], labels=activityLabels[,2])
########### PART 4 - APPROPRIATE VARIABLE NAMES ##############

########### PART 5 - MAKE TIDY DATA FRAME WITH MEANS FOR EACH VARIABLE ##############
## the tbl should have subject & activity as 2 columns and each variable as a further column
