## Cleaning Data Project - Code book

### Input

The original data comes from the Human Activity Recognition Using Smartphones Data Set. 
From this dataset, the features variables has been taken as input, along with the subjects and the activity labels. Specifically, those following files :
* test/subject_test.txt
* test/X_test.txt
* test/y_test.txt
* train/subject_train.txt
* train/X_train.txt
* train/y_train.txt
* activity_labels.txt

The variables names in features.txt have also been taken as input.

### Transformations applied

* The test and train records have been merged with their subjects, and activity labels have replaced their id.
* Test and train records have been concatenated together to form a unique dataset.
* From the input dataset, only the mean and standard variation variables have been kept, ie the mean() and std() variables (meanFreq() as been taken out as it is not simply a mean).
* The variables names from the input data set have been tidied up to be usable in R (no special characters), but still readable (camel case). "f" and "t" prefixes have been changed to "freq" and "time" to make a clear difference. Some variables containing "BodyBody" have been simplified (just "Body")
* Finaly the mean of each variable, by subject and activity have been calculated 

### Variables description

Two devices produced the initial data, an accelerometer and a gyroscope, in 3 directions, X, Y and Z.
* The "Acc" variables originate from the accelerometer and are expressed in G Units. The values of the effect of gravity and body movements have been isolated in the "Body" and "Gravity" variables.
* The "Gyro" variables originate from the gyroscope and are expressed in radian per second.

Those variables have been derived in time to give the "Jerk" variables. Also the "Mag" variables are the magnitude of the X, Y, Z variables.
All thoses variables are the "time" prefixed variables. They have been fed to a Fourrier Transform to obtain the values in the frequency domain, giving the "freq" prefixed variables.

Only the mean and standard deviation variables of the original data have been kept, denoted by "Mean" and "Std" in their names. 

Finally, the mean by activity and subject have been applied over those variables to give this present data set.

Following is the complete list of variables :
* activity : activity label. Either LAYING,  SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS
* subject : the subject, identified by an integer
* timeBodyAccMeanX : mean of tBodyAcc-mean()-X 
* timeBodyAccMeanY : mean of tBodyAcc-mean()-Y
* timeBodyAccMeanZ : mean of tBodyAcc-mean()-Z
* timeBodyAccStdX : mean of tBodyAcc-std()-X
* timeBodyAccStdY : mean of tBodyAcc-std()-Y
* timeBodyAccStdZ : mean of tBodyAcc-std()-Z
* timeGravityAccMeanX : mean of tGravityAcc-mean()-X
* timeGravityAccMeanY : mean of tGravityAcc-mean()-Y
* timeGravityAccMeanZ : mean of tGravityAcc-mean()-Z
* timeGravityAccStdX : mean of tGravityAcc-std()-X
* timeGravityAccStdY : mean of tGravityAcc-std()-Y
* timeGravityAccStdZ : mean of tGravityAcc-std()-Z
* timeBodyAccJerkMeanX : mean of tBodyAccJerk-mean()-X
* timeBodyAccJerkMeanY : mean of tBodyAccJerk-mean()-Y
* timeBodyAccJerkMeanZ : mean of tBodyAccJerk-mean()-Z
* timeBodyAccJerkStdX : mean of tBodyAccJerk-std()-X
* timeBodyAccJerkStdY : mean of tBodyAccJerk-std()-Y
* timeBodyAccJerkStdZ : mean of tBodyAccJerk-std()-Z
* timeBodyGyroMeanX : mean of tBodyGyro-mean()-X
* timeBodyGyroMeanY : mean of tBodyGyro-mean()-Y
* timeBodyGyroMeanZ : mean of tBodyGyro-mean()-Z
* timeBodyGyroStdX : mean of tBodyGyro-std()-X
* timeBodyGyroStdY : mean of tBodyGyro-std()-Y
* timeBodyGyroStdZ : mean of tBodyGyro-std()-Z
* timeBodyGyroJerkMeanX : mean of tBodyGyroJerk-mean()-X
* timeBodyGyroJerkMeanY : mean of tBodyGyroJerk-mean()-Y
* timeBodyGyroJerkMeanZ : mean of tBodyGyroJerk-mean()-Z
* timeBodyGyroJerkStdX : mean of tBodyGyroJerk-std()-X
* timeBodyGyroJerkStdY : mean of tBodyGyroJerk-std()-Y
* timeBodyGyroJerkStdZ : mean of tBodyGyroJerk-std()-Z
* timeBodyAccMagMean : mean of tBodyAccMag-mean()
* timeBodyAccMagStd : mean of tBodyAccMag-std()
* timeGravityAccMagMean : mean of tGravityAccMag-mean()
* timeGravityAccMagStd : mean of tGravityAccMag-std()
* timeBodyAccJerkMagMean : mean of tBodyAccJerkMag-mean()
* timeBodyAccJerkMagStd : mean of tBodyAccJerkMag-std()
* timeBodyGyroMagMean : mean of tBodyGyroMag-mean()
* timeBodyGyroMagStd : mean of tBodyGyroMag-std()
* timeBodyGyroJerkMagMean : mean of tBodyGyroJerkMag-mean()
* timeBodyGyroJerkMagStd : mean of tBodyGyroJerkMag-std()
* freqBodyAccMeanX : mean of fBodyAcc-mean()-X
* freqBodyAccMeanY : mean of fBodyAcc-mean()-Y
* freqBodyAccMeanZ : mean of fBodyAcc-mean()-Z
* freqBodyAccStdX : mean of fBodyAcc-std()-X
* freqBodyAccStdY : mean of fBodyAcc-std()-Y
* freqBodyAccStdZ : mean of fBodyAcc-std()-Z
* freqBodyAccJerkMeanX : mean of fBodyAccJerk-mean()-X
* freqBodyAccJerkMeanY : mean of fBodyAccJerk-mean()-Y
* freqBodyAccJerkMeanZ : mean of fBodyAccJerk-mean()-Z
* freqBodyAccJerkStdX : mean of fBodyAccJerk-std()-X
* freqBodyAccJerkStdY : mean of fBodyAccJerk-std()-Y
* freqBodyAccJerkStdZ : mean of fBodyAccJerk-std()-Z
* freqBodyGyroMeanX : mean of fBodyGyro-mean()-X
* freqBodyGyroMeanY : mean of fBodyGyro-mean()-Y
* freqBodyGyroMeanZ : mean of fBodyGyro-mean()-Z
* freqBodyGyroStdX : mean of fBodyGyro-std()-X
* freqBodyGyroStdY : mean of fBodyGyro-std()-Y
* freqBodyGyroStdZ : mean of fBodyGyro-std()-Z
* freqBodyAccMagMean : mean of fBodyAccMag-mean()
* freqBodyAccMagStd : mean of fBodyAccMag-std()
* freqBodyAccJerkMagMean : mean of fBodyBodyAccJerkMag-mean()
* freqBodyAccJerkMagStd : mean of fBodyBodyAccJerkMag-std()
* freqBodyGyroMagMean : mean of fBodyBodyGyroMag-mean()
* freqBodyGyroMagStd : mean of fBodyBodyGyroMag-std()
* freqBodyGyroJerkMagMean : mean of fBodyBodyGyroJerkMag-mean()
* freqBodyGyroJerkMagStd : mean of fBodyBodyGyroJerkMag-std()