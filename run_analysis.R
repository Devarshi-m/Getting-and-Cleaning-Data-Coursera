setwd("C:/Coursera/Getting and Cleaning Data/Week 4/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")

###################### READ DATA IN ############################

subject_test <- read.table("test/subject_test.txt", 
                           col.names = "subject")
y_test <- read.table("test/y_test.txt", col.names = "code")
subject_train <- read.table("train/subject_train.txt", 
                            col.names = "subject")
y_train <- read.table("train/y_train.txt", col.names = "code")
features <- read.table("features.txt", col.names = 
                         c("n", "functions"))
x_test <- read.table("test/X_test.txt", col.names = features$functions)
x_train <- read.table("train/x_train.txt", col.names =
                        features$functions)
activity_labels <- read.table("activity_labels.txt", col.names = 
                                c("code", "activity"))

###################### MERGE TRAINING AND TEST SETS ######################

X_combo <- rbind(x_train, x_test)
Y_combo <- rbind(y_train, y_test)
Subject_combo <- rbind(subject_train, subject_test)
Combo <- cbind(Subject_combo, X_combo, Y_combo)

####################### TAKE MEAN and STD #######################

tidy <- Combo %>%
  select(subject, code, contains("mean"), contains("std"))

tidy$code <- activity_labels[tidy$code, 2]

####################### LABEL NAMES #############################
names(tidy)[2] = "activity"
names(tidy)<-gsub("Acc", "Accelerometer", names(tidy))
names(tidy)<-gsub("Gyro", "Gyroscope", names(tidy))
names(tidy)<-gsub("BodyBody", "Body", names(tidy))
names(tidy)<-gsub("Mag", "Magnitude", names(tidy))
names(tidy)<-gsub("^t", "Time", names(tidy))
names(tidy)<-gsub("^f", "Frequency", names(tidy))
names(tidy)<-gsub("tBody", "TimeBody", names(tidy))
names(tidy)<-gsub("-mean()", "Mean", names(tidy), ignore.case = TRUE)
names(tidy)<-gsub("-std()", "STD", names(tidy), ignore.case = TRUE)
names(tidy)<-gsub("-freq()", "Frequency", names(tidy), ignore.case = TRUE)

###################### STEP 5 #########################

FD <- tidy %>%
  group_by(subject, activity) %>%
  summarise_all(list(mean))
write.table(FD, "DATA.txt", row.names = FALSE)
