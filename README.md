# Get-and-Clean-Data-Assignment
Files for assignment 2 of Getting and Cleaning Data

See the Codebook for an explaination of the variables and methodology.

The R script file for the implementation of the data analysis is below.

Set the working directory if needed, comment out after 1st run
setwd("./R/UCIHARD")

6 activites encoded numerically are read into a data frame
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

activities <- read.table("activity_labels.txt")

The file y_train.txt and y_test.txt contain the activity column for the training and test data respectively
and are read as data frames.  There are 6 activities and we will add a column to identify this as training or test data.

yTrainDF <- read.table("./train/y_train.txt")
yTrainDF$V2 <- "Train"

yTestDF <- read.table("./test/y_test.txt")
yTestDF$V2 <- "Test"

The file x_train.txt and x_test.txt contain the data for the training and test data respectively
and are read as data frames. There are several thousand rows of data in both data frames.

xTrainDF <- read.table("./train/X_train.txt")
xTestDF <- read.table("./test/X_test.txt")

The file subject_train.txt and subject_test.txt contain the subject column for the training and test data respectively
and are read as data frames.  There are 30 training subjects and 24 test subjects

subjectTrainDF <- read.table("./train/subject_train.txt")
subjectTestDF <- read.table("./test/subject_test.txt")

Next we combine the subject and activity data frames and add training identifier and create a data frame of the complied training data for the training and test data sets.

tempTrainDF <- cbind(subjectTrainDF$V1, yTrainDF$V1, yTrainDF$V2)
TrainDF <- cbind(tempTrainDF, xTrainDF)

tempTestDF <- cbind(subjectTestDF$V1, yTestDF$V1, yTestDF$V2)
TestDF <- cbind(tempTestDF, xTestDF)
Finally we combine the 2 data sets by row to create a consolidated dataframe of all training and test data
CombinedDF <- rbind(TestDF, TrainDF)

We will ues features to become the column labels in the combined data frame
features <- read.table("features.txt")
listofNames <-as.character(features[,2])
listofNames <-make.names(listofNames, unique=TRUE)
colnames(CombinedDF) <- c("Subject","Activity", "Condition", listofNames)

Next we write the merged data frame to a csv file, so we will not have to recreate it multiple times.
write.csv(CombinedDF, file="CombinedData.csv")

Next, we create a data frame containing only the columns with mean and std in the column name, and use a custom set of column names for readibility.

MeanDF <- select(CombinedDF,contains("mean"))
StdDF <- select(CombinedDF,contains("std"))
MeanStdDF <- cbind(CombinedDF$Subject, CombinedDF$Activity, CombinedDF$Condition, MeanDF, StdDF)
names(MeanStdDF) <- c("Subject", "Activity", "Condition", "Time.BodyAcc.X.Mean", "Time.BodyAcc.Y.Mean", "Time.BodyAcc.Z.Mean", "Time.GravityAcc.X.Mean", "Time.GravityAcc.Y.Mean", "Time.GravityAcc.Z.Mean", "Time.BodyAccJerk.X.Mean", "Time.BodyAccJerk.Y.Mean", "Time.BodyAccJerk.Z.Mean", "Time.BodyGyro.X.Mean", "Time.BodyGyro.Y.Mean", "Time.BodyGyro.Z.Mean", "Time.BodyGyroJerk.X.Mean", "Time.BodyGyroJerk.Y.Mean", "Time.BodyGyroJerk.Z.Mean", "Time.BodyAcc.Mag.Mean", "Time.GravityAcc.Mag.Mean", "Time.BodyAccJerkMag.Mean", "Time.BodyGyroMag.Mean", "Time.BodyGyroJerkMag.Mean", "FFT.BodyAcc.X.Mean", "FFT.BodyAcc.Y.Mean", "FFT.BodyAcc.Z.Mean", "FFT.BodyAcc.X.Freq.Mean", "FFT.BodyAcc.Y.Freq.Mean", "FFT.BodyAcc.Z.Freq.Mean", "FFT.BodyAcc.Jerk.X.Mean", "FFT.BodyAcc.Jerk.Y.Mean", "FFT.BodyAcc.Jerk.Z.Mean", "FFT.BodyAcc.Jerk.X.Freq.Mean", "FFT.BodyAcc.Jerk.Y.Freq.Mean", "FFT.BodyAcc.Jerk.Z.Freq.Mean", "FFT.BodyGyro.X.Mean", "FFT.BodyGyro.Y.Mean", "FFT.BodyGyro.Z.Mean", "FFT.BodyGyro.X.Freq.Mean", "FFT.BodyGyro.Y.Freq.Mean", "FFT.BodyGyro.Z.Freq.Mean", "FFT.BodyAcc.Mag.Mean", "FFT.BodyAcc.Mag.Freq.Mean", "FFT.BodyAccJerk.Mag.Mean", "FFT.BodyAccJerk.Mag.Freq.Mean", "FFT.BodyGyro.Mag.Mean", "FFT.BodyGyro.Mag.Freq.Mean", "FFT.BodyGyroJerk.Mag.Mean", "FFT.BodyGyroJerk.Mag.Freq.Mean", "Time.BodyAcc.angle.gravity.Mean", "Time.BodyAccJerk.angle.gravity.Mean", "Time.BodyGyro.angle.gravity.Mean", "Time.BodyGyroJerk.angle.gravity.Mean", "Angle.gravity.X.Mean", "Angle.gravity.Y.Mean", "Angle.gravity.Z.Mean", "Time.BodyAcc.X.std", "Time.BodyAcc.Y.std", "Time.BodyAcc.Z.std", "Time.GravityAcc.X.std", "Time.GravityAcc.Y.std", "Time.GravityAcc.Z.std", "Time.BodyAccJerk.X.std", "Time.BodyAccJerk.Y.std", "Time.BodyAccJerk.Z.std", "Time.BodyGyro.X.std", "Time.BodyGyro.Y.std", "Time.BodyGyro.Z.std.Z", "Tinme.BodyGyroJerk.X.std", "Time.BodyGyroJerk.Y.std", "Time.BodyGyroJerk.Z.std", "Time.BodyAccMag.std", "Time.GravityAccMag.std", "Time.BodyAccJerkMag.std", "Time.BodyGyroMag.std", "Time.BodyGyroJerkMag.std", "FFT.BodyAcc.X.std", "FFT.BodyAcc.Y.std", "FFT.BodyAcc.Z.std", "FFT.BodyAccJerk.X.std", "FFT.BodyAccJerk.Y.std", "FFT.BodyAccJerk.Z.std", "FFT.BodyGyro.std", "FFT.BodyGyro.Y.std", "FFT.BodyGyro.Z.std", "FFT.BodyAccMag.std", "FFT.BodyAccJerkMag.std", "FFT.BodyGyroMag.std", "FFT.BodyGyroJerkMag.std")


write.csv(MeanStdDF, file="MeanStDevData.csv")

Again we write out this file as a checkpoint.


We next set activity and subjects as factors for later sorting
activity <- as.factor(MeanStdDF$Activity)
levels(activity) <- activities$V2
subjects <- as.factor(MeanStdDF$Subject)

We now create the tidy data file with the mean and standard deviation information
tinyData <- cbind(subjects, activity, MeanStdDF)
tidyData <- select(tinyData, subjects, activity, Subject, Time.BodyAcc.X.Mean:FFT.BodyGyroJerkMag.std)

Write out the tidy data file for use in later data analysis

write.csv(tidyData, file="TidyData.csv")

Next we use the reshape2 library to reshape and summarise the data by subject and activity

tidyMelt <- melt(tidyData, id.vars=c("subjects", "activity", "Subject"))
tidySummary <- dcast(tidyMelt, subjects + activity + Subject ~ variable, mean)

Finally, we write out the summarised tidy data sorted by subject.
tidySummary <- arrange(tidySummary, as.numeric(tidySummary$subject))
write.table(tidySummary, file="DataSummarySorted.txt" row.name=FALSE, sep=",")
