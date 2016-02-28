# The Samsung data ("UCI HAR Dataset" directory) must be in the same directory
# as this script : load and merge dataset, make its variable names more readable, 
# calculate the mean of the each variable by activity and subject and write the
# result into a meanMotionRecords.txt

# script needs dplyr
library(dplyr)

# load the different files and merge them together.
# RETURN : a single dataset containing test and train data
mergeDataSet <- function() {
  
  # load variable names and activity labels
  variableNames <- read.table(file.path("UCI HAR Dataset","features.txt"), 
                              col.names=c("id","variable"))
  activityLabels <- read.table(file.path("UCI HAR Dataset","activity_labels.txt"), 
                               col.names=c("id","activity"))
  
  # load the train and test records and keep only the mean and std variables.
  trainRecords <- read.table(file.path("UCI HAR Dataset","train","X_train.txt"), 
                             col.names=variableNames$variable)
  trainRecords <- trainRecords[,grep("(mean|std)\\.\\.",names(trainRecords))]
  testRecords <- read.table(file.path("UCI HAR Dataset","test","X_test.txt"),
                            col.names=variableNames$variable)
  testRecords <- testRecords[,grep("(mean|std)\\.\\.",names(testRecords))]
  
  # add activity names to the train and test records
  trainActivities <- read.table(file.path("UCI HAR Dataset","train","y_train.txt"), 
                                col.names=c("id"))
  trainActivities <- left_join(trainActivities, activityLabels) 
  trainRecords <- mutate(trainRecords, activity=trainActivities$activity)
  testActivities <- read.table(file.path("UCI HAR Dataset","test","y_test.txt"), 
                               col.names=c("id"))
  testActivities <- left_join(testActivities, activityLabels) 
  testRecords <- mutate(testRecords, activity=testActivities$activity)
  
  # add subjects to the train and test records
  testSubjects <- read.table(file.path("UCI HAR Dataset","test","subject_test.txt"), 
                             col.names=c("subject"))
  testRecords <- mutate(testRecords, subject=testSubjects$subject)
  trainSubjects <- read.table(file.path("UCI HAR Dataset","train","subject_train.txt"), 
                              col.names=c("subject"))
  trainRecords <- mutate(trainRecords, subject=trainSubjects$subject)
  
  # bind test and train records together
  records <- rbind(trainRecords, testRecords)
  
}

# clean variable names, eg fBodyAcc.mean...X => freqBodyAccMeanX
# INPUT : a vector of variable names
# RETURN : a vector of modified variable names for readability
cleanVarNames <- function(vars) {
  vars <- gsub("\\.+", "", vars)
  vars <- sub("^t", "time", vars)
  vars <- sub("^f", "freq", vars)
  vars <- sub("std", "Std", vars)
  vars <- sub("mean", "Mean", vars)
  vars <- sub("BodyBody", "Body", vars)
}

#cleanVarNames2 <- function(vars) {
#  vars <- gsub("\\.+", "", vars)
#  vars <- sub("^t", "time", vars)
#  vars <- sub("^f", "freq", vars)
#  vars <- sub("BodyBody", "Body", vars)
#  vars <- tolower(vars)
#}

# calculate the mean of each variable by activity and subject
# INPUT : the records data frame
# RETURN : a dataframe  containing the mean of each variable by activity and subject
getMeanPerActivityAndSubject <- function(records) {
  records %>% group_by(activity, subject) %>% summarise_each(funs(mean))
}


# Main script starts here

motionRecords <- mergeDataSet()
colnames(motionRecords)<-cleanVarNames(colnames(motionRecords))
meanMotionRecords <- getMeanPerActivityAndSubject(motionRecords)
write.table(meanMotionRecords, "meanMotionRecords.txt", row.names=FALSE)
