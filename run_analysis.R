#needs dplyr
library(dplyr)

setwd("C:\\Users\\Silvia\\Documents\\Florent\\R\\C3Project\\UCI HAR Dataset")

# TODO : comment function
cleanDataSet <- function() {
  
  # load variable names and activity labels
  variableNames <- read.table("features.txt", col.names=c("id","variable"))
  activityLabels <- read.table("activity_labels.txt", col.names=c("id","activity"))
  
  # load the train and test records and keep only the mean and std variables.
  trainRecords <- read.table("train\\X_train.txt", col.names=variableNames$variable)
  trainRecords <- trainRecords[,grep("(mean|std)\\.\\.",names(trainRecords))]
  testRecords <- read.table("test\\X_test.txt", col.names=variableNames$variable)
  testRecords <- testRecords[,grep("(mean|std)\\.\\.",names(testRecords))]
  
  # add activity names to the train and test records
  trainActivities <- read.table("train\\y_train.txt", col.names=c("id"))
  trainActivities <- left_join(trainActivities, activityLabels) 
  trainRecords <- mutate(trainRecords, activity=trainActivities$activity)
  testActivities <- read.table("test\\y_test.txt", col.names=c("id"))
  testActivities <- left_join(testActivities, activityLabels) 
  testRecords <- mutate(testRecords, activity=testActivities$activity)
  
  # add subjects to the train and test records
  testSubjects <- read.table("test\\subject_test.txt", col.names=c("subject"))
  testRecords <- mutate(testRecords, subject=testSubjects$subject)
  trainSubjects <- read.table("train\\subject_train.txt", col.names=c("subject"))
  trainRecords <- mutate(trainRecords, subject=trainSubjects$subject)
  
  # bind test and train records together
  records <- rbind(trainRecords, testRecords)
  
  # clean variable names, eg fBodyAcc.mean...X => fBodyAccMeanX
  colnames(records) <- gsub("\\.+", "", colnames(records))
  colnames(records) <- sub("std", "Std", colnames(records))
  colnames(records) <- sub("mean", "Mean", colnames(records))
  colnames(records) <- sub("BodyBody", "Body", colnames(records))
  
  # separate between time and frequency variables, finish cleaning variable names
  timeRecords <- records[,grep("^t|^activity|^subject",names(records))]
  colnames(timeRecords) <- sub("^tB", "b", colnames(timeRecords))
  colnames(timeRecords) <- sub("^tG", "g", colnames(timeRecords))
  freqRecords <- records[,grep("^f|^activity|^subject",names(records))]
  colnames(freqRecords) <- sub("^fB", "b", colnames(freqRecords))

  list(time=timeRecords,freq=freqRecords)
  
}

getMeanPerActivityAndSubject <- function(records) {
  records %>% group_by(activity, subject) %>% summarise_each(funs(mean))
}

motionRecords <- cleanDataSet()
meanMotionRecords <- lapply(motionRecords,getMeanPerActivityAndSubject)
