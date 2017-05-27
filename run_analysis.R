closeAllConnections()
rm(list=ls())

#Reading de data TEST
subject_test <- read.csv("R/UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = "")
X_test <- read.csv("R/UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")
y_test <- read.csv("R/UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "")

#Reading de data TRAIN
subject_train <- read.csv("R/UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = "")
X_train <- read.csv("R/UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")
y_train <- read.csv("R/UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = "")

#Reading de data FEATURES
features <- read.csv("R/UCI HAR Dataset/features.txt", header = FALSE, sep = "")

#Prepering a vector of names do give the data set column names
v_names <- as.character(features[,2])
v_names <- c("subjectid", "activityid", v_names)

#Building the fisrt data set - TEST
dt_1 <- cbind(subject_test, y_test, X_test)

#Building the second data set - TRAIN
dt_2 <- cbind(subject_train, y_train, X_train)

#Building the complete data set TEST + TRAIN
dt_3 <- rbind(dt_1, dt_2)

#Setting up the column names
names(dt_3) <- v_names

#Building new data set with just MEAN and STANDARD
v_aux1 <- paste(c("mean", "std"), collapse = "|") 
v_aux2 <- grepl(pattern = v_aux1, x = v_names)
v_aux2[1] <- TRUE
v_aux2[2] <- TRUE
dt_4 <- dt_3[,v_aux2]

#Reading the activity labels
activity_labels <- read.csv("R/UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE)

#Replacing numbers for the activity labels
dt_4$activityid <- gsub(pattern = activity_labels[1,1], replacement = activity_labels[1,2], x = dt_4$activityid)
dt_4$activityid <- gsub(pattern = activity_labels[2,1], replacement = activity_labels[2,2], x = dt_4$activityid)
dt_4$activityid <- gsub(pattern = activity_labels[3,1], replacement = activity_labels[3,2], x = dt_4$activityid)
dt_4$activityid <- gsub(pattern = activity_labels[4,1], replacement = activity_labels[4,2], x = dt_4$activityid)
dt_4$activityid <- gsub(pattern = activity_labels[5,1], replacement = activity_labels[5,2], x = dt_4$activityid)
dt_4$activityid <- gsub(pattern = activity_labels[6,1], replacement = activity_labels[6,2], x = dt_4$activityid)

#Naming appropriately the labels of the data set with descriptive variable names. 
names(dt_4)<-gsub("std()", "SD", names(dt_4))
names(dt_4)<-gsub("mean()", "MEAN", names(dt_4))
names(dt_4)<-gsub("^t", "time", names(dt_4))
names(dt_4)<-gsub("^f", "frequency", names(dt_4))
names(dt_4)<-gsub("Acc", "Accelerometer", names(dt_4))
names(dt_4)<-gsub("Gyro", "Gyroscope", names(dt_4))
names(dt_4)<-gsub("Mag", "Magnitude", names(dt_4))
names(dt_4)<-gsub("BodyBody", "Body", names(dt_4))

# Creating a second, independent tidy data set with the average of each variable for each activity and each subject.
dt_5 <- aggregate(dt_4[,c(-1,-2)], list(SUBEJCT = dt_4$subjectid, ACTIVITY = dt_4$activityid ), FUN=mean)

write.table(dt_5, file = "tidydata.txt",row.name=FALSE)