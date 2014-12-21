#course project

#set working directory
setwd("~/Documents/r/course project data cleaning")
library(data.table)


### PROCESS FEATURES ###

#find feature lables and filter ones which contain mean / std
features <- read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
desiredFeatures <- grep("-mean\\(\\)|-std\\(\\)",features[,2])

### PROCESS X DATA ####

#combine train and test sets for X data
Xdata <- rbind(
read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE),
read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
)

#filter only the desired features from Xdata
Xdata <- Xdata[,desiredFeatures]

# convert to lower case and remove brackets,dashed and assign names for Xdata
NAMES <- tolower(features$V2[desiredFeatures])
NAMES <- gsub("\\(|\\)","",NAMES)
NAMES <- names(Xdata) <- gsub("\\-","_",NAMES)
names(Xdata) <- NAMES
  

#### PROCESS ACTIVITY DATA ####

ACTIVITYdata <- rbind(
  read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE),
  read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
)

#name the activity number
names(ACTIVITYdata) <- "activity_num"

#### PROCESS SUBJECT DATA ####

#combine train and test sets for subject data
SUBJdata <- rbind(
  read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE),
  read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)
)

names(SUBJdata) <- "subject"


#### COMBINE SUBJECT, ACTIVITY, X DATA TO MAKE FIRST TIDY DATA SET ###
tidy_data <- cbind(ACTIVITYdata,SUBJdata,Xdata)

#merge with acticity name
activity_label <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activity_label) <- c("activity_num","activity_name") 
tidy_data <- merge(tidy_data,activity_label,by="activity_num")

#change tidy data to datatable and do some formatting
tidy_data <- data.table(tidy_data)
tidy_data[,activity_name:=tolower(activity_name)]

#group by
tidy_data <- tidy_data[,lapply(.SD,mean),by="activity_name,subject"]

#write output
write.table(tidy_data, "tidy_data.txt", row.names=FALSE)



