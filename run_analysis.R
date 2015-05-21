#setwd("D:/Dropbox/DataScience/JohnHopkins/Modulo3/Project")
library(plyr)

#### 1. Merges the training and the test sets to create one data set.

# Read and merge subject
subject_train_Data <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test_Data <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_Data <- rbind(subject_train_Data, subject_test_Data)

# Read and Merge x
x_train_Data <- read.table("./UCI HAR Dataset/train/X_train.txt")
x_test_Data <- read.table("./UCI HAR Dataset/test/X_test.txt")
x_Data <- rbind(x_train_Data, x_test_Data)

# Read and Merge y
y_train_Data <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_test_Data <- read.table("./UCI HAR Dataset/test/y_test.txt")
y_Data <- rbind(y_train_Data, y_test_Data)

# Read features and activity_labels
features_Data <- read.table("./UCI HAR Dataset/features.txt")
activities_labels_Data <- read.table("./UCI HAR Dataset/activity_labels.txt")

#### 2.Extracts only the measurements on the mean and standard deviation for each measurement. 

# select columns named as mean or std
mean_std_col <- grep("(mean|std)", features_Data[, 2])

# select colums from x_Data with mean or std names
x_mean_std <- x_Data[, mean_std_col]

#### 3.Uses descriptive activity names to name the activities in the data set

# create vector with activity names
y_act <- activities_labels_Data[y_Data[, 1], 2]

#### 4.Appropriately labels the data set with descriptive variable names

# bind 
result <- cbind(x_mean_std, y_act, subject_Data)

# change the result column names from mean_std_col, activity and subject
names(result) <- c(as.vector(features_Data[mean_std_col, 2]), "activity", "subject")

#### 5.From the data set in step 4, creates a second, independent tidy data set with 
#### the average of each variable for each activity and each subject

result_avg <- ddply(result, .(subject, activity), numcolwise(mean))

write.table(result_avg, "result_avg.txt", row.name=FALSE)
