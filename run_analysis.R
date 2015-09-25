########### PART 1a - EXTRACTING THE DATASETS ##############
## reading test data set
test_data <- read.table("./UCI HAR Dataset/test/X_test.txt", stringsAsFactors = F)
test_id <- read.table("./UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = F)
test_activity <- read.table("./UCI HAR Dataset/test/y_test.txt", stringsAsFactors = F)
## reading training data set
train_data <- read.table("./UCI HAR Dataset/train/X_train.txt", stringsAsFactors = F)
train_id <- read.table("./UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = F)
train_activity <- read.table("./UCI HAR Dataset/train/y_train.txt", stringsAsFactors = F)

########### PART 2 & 4 - EXTRACT MEASUREMENTS & APPROPRIATE VARIABLE NAMES ##############
## reading columns
features <- read.csv("./UCI HAR Dataset/features.txt", sep = "", stringsAsFactors = F, header = F)
## selecting columns
features <- features[grep("mean|std", features[,2]),]
idx_selected_columns <- as.vector(features[,1])
## renaming columns
features[,2] <- gsub('-|\\,', '_', features[,2])
features[,2] <- gsub('\\(\\)', '', features[,2])
features[,2] <- gsub("^t", "Time", features[,2])
features[,2] <- gsub("^f", "Frequency", features[,2])

########### PART 1b - MERGING THE DATASETS ##############
## merge data sets and remove tables no longer needed to free memory
DS_test <- cbind(test_id,test_activity,test_data[,idx_selected_columns])
rm(test_id,test_activity,test_data)
DS_train <- cbind(train_id,train_activity,train_data[,idx_selected_columns])
rm(train_id,train_activity,train_data)
DS <- rbind(DS_test,DS_train)
rm(DS_test,DS_train)

DS_headers <- c("subject","activity",as.vector(features[,2]))
names(DS) <- DS_headers
rm(features, DS_headers,idx_selected_columns)

########### PART 3 - INSERT MEANINGFUL ACTIVITY NAMES ##############
## Create a data frame with meaningful activity names and their ID
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = F)
DS[,2] <- factor(DS[,2], labels=activity_labels[,2])

########### PART 5 - MAKE TIDY DATA FRAME WITH MEANS FOR EACH VARIABLE ##############
library(reshape2)
melted <- melt(DS,id=c("subject","activity"))
DS_tidy <- dcast(melted, subject + activity ~ variable, mean)
write.table(DS_tidy, "tidy_dataset.txt", row.names = FALSE)
