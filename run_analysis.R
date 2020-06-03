library(tidyverse)

#reading the files from directory

x_test <- read.table("./UCI HAR Dataset/test/x_test.txt", header = FALSE)
y_test <- read.csv("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt", header = FALSE)
y_train <- read.csv("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
activity <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)  

#changing column names to avoid duplicate

names(subject_test) <- "subject"
names(subject_train) <- "subject"

names(y_test) <- "activity"
names(y_train) <- "activity"

#naming the data using the data in features

names(x_test) <- features$V2
names(x_train) <- features$V2

#finding the index for elements containing mean and std

index <- grep("mean|std", features$V2)

#comibining test and train datasets

x <- rbind(x_test,x_train)

#keeping only the columns containing mean and std

x <- x[index]

#combining the subject data from test and train datasets

subject <- rbind(subject_test,subject_train)

#combining the activity labels for test and train datasets 

activity_label <- rbind(y_test, y_train)
activity_label$activity <- as.character(activity_label$activity)

#replacing with the actual activity labels

activity_label$activity <- gsub("1","WALKING",activity_label$activity)
activity_label$activity <- gsub("2","WALKING_UPSTAIRS",activity_label$activity)
activity_label$activity <- gsub("3","WALKING_DOWNSTAIRS",activity_label$activity)
activity_label$activity <- gsub("4","SITTING",activity_label$activity)
activity_label$activity <- gsub("5","STANDING",activity_label$activity)
activity_label$activity <- gsub("6","LAYING",activity_label$activity)

#Tidy data required in Step 4

mean_std_data <- cbind(subject,activity_label,x)

#Tidy data required in Step 5

mean_summary_dataset <- mean_std_data %>% group_by(subject, activity) %>% 
        summarise_each(funs = mean)