#R script to consolidate data for programming assignmet of getting and cleaning data
#data structure is in associated code book
#set the working directory if needed, comment out after 1st run
#setwd("./R/UCIHARD")
#6 activites encoded numerically
activities <- read.table("activity_labels.txt")
#numerical coding of subject column for the training data frame
subjectTrainDF <- read.table("./train/subject_train.txt")
#normalized data for the training dataframe
xTrainDF <- read.table("./train/X_train.txt")
#numerical coding of the activity for the training dataframe
yTrainDF <- read.table("./train/y_train.txt")
#identify this as training data
yTrainDF$V2 <- "Train"
#numerical coding of subject column for the test data frame
subjectTestDF <- read.table("./test/subject_test.txt")
#normalized data for the test dataframe
xTestDF <- read.table("./test/X_test.txt")
#numerical coding of the activity for the training dataframe
yTestDF <- read.table("./test/y_test.txt")
#identify this as training data
yTestDF$V2 <- "Test"
#Combine the subject and activity data frames and add training identifier
tempTrainDF <- cbind(subjectTrainDF$V1, yTrainDF$V1, yTrainDF$V2)
# Create data frame of training data
TrainDF <- cbind(tempTrainDF, xTrainDF)
#Combine the subject and activity data frames and add test identifier
tempTestDF <- cbind(subjectTestDF$V1, yTestDF$V1, yTestDF$V2)
# Create data frame of test data
TestDF <- cbind(tempTestDF, xTestDF)
#create a combined dataframe of all training and test data
CombinedDF <- rbind(TestDF, TrainDF)
#features will become the column labels in the combined data frame
features <- read.table("features.txt")
listofNames <-as.character(features[,2])
listofNames <-make.names(listofNames, unique=TRUE)
colnames(CombinedDF) <- c("Subject","Activity", "Condition", listofNames)
#write the merged data frame to a csv file
write.csv(CombinedDF, file="CombinedData.csv")
#select only the columns with mean and std in the column name
MeanDF <- select(CombinedDF,contains("mean"))
StdDF <- select(CombinedDF,contains("std"))
MeanStdDF <- cbind(CombinedDF$Subject, CombinedDF$Activity, CombinedDF$Condition, MeanDF, StdDF)
names(MeanStdDF) <- c("Subject", "Activity", "Condition", "Time.BodyAcc.X.Mean", "Time.BodyAcc.Y.Mean", "Time.BodyAcc.Z.Mean", "Time.GravityAcc.X.Mean", "Time.GravityAcc.Y.Mean", "Time.GravityAcc.Z.Mean", "Time.BodyAccJerk.X.Mean", "Time.BodyAccJerk.Y.Mean", "Time.BodyAccJerk.Z.Mean", "Time.BodyGyro.X.Mean", "Time.BodyGyro.Y.Mean", "Time.BodyGyro.Z.Mean", "Time.BodyGyroJerk.X.Mean", "Time.BodyGyroJerk.Y.Mean", "Time.BodyGyroJerk.Z.Mean", "Time.BodyAcc.Mag.Mean", "Time.GravityAcc.Mag.Mean", "Time.BodyAccJerkMag.Mean", "Time.BodyGyroMag.Mean", "Time.BodyGyroJerkMag.Mean", "FFT.BodyAcc.X.Mean", "FFT.BodyAcc.Y.Mean", "FFT.BodyAcc.Z.Mean", "FFT.BodyAcc.X.Freq.Mean", "FFT.BodyAcc.Y.Freq.Mean", "FFT.BodyAcc.Z.Freq.Mean", "FFT.BodyAcc.Jerk.X.Mean", "FFT.BodyAcc.Jerk.Y.Mean", "FFT.BodyAcc.Jerk.Z.Mean", "FFT.BodyAcc.Jerk.X.Freq.Mean", "FFT.BodyAcc.Jerk.Y.Freq.Mean", "FFT.BodyAcc.Jerk.Z.Freq.Mean", "FFT.BodyGyro.X.Mean", "FFT.BodyGyro.Y.Mean", "FFT.BodyGyro.Z.Mean", "FFT.BodyGyro.X.Freq.Mean", "FFT.BodyGyro.Y.Freq.Mean", "FFT.BodyGyro.Z.Freq.Mean", "FFT.BodyAcc.Mag.Mean", "FFT.BodyAcc.Mag.Freq.Mean", "FFT.BodyAccJerk.Mag.Mean", "FFT.BodyAccJerk.Mag.Freq.Mean", "FFT.BodyGyro.Mag.Mean", "FFT.BodyGyro.Mag.Freq.Mean", "FFT.BodyGyroJerk.Mag.Mean", "FFT.BodyGyroJerk.Mag.Freq.Mean", "Time.BodyAcc.angle.gravity.Mean", "Time.BodyAccJerk.angle.gravity.Mean", "Time.BodyGyro.angle.gravity.Mean", "Time.BodyGyroJerk.angle.gravity.Mean", "Angle.gravity.X.Mean", "Angle.gravity.Y.Mean", "Angle.gravity.Z.Mean", "Time.BodyAcc.X.std", "Time.BodyAcc.Y.std", "Time.BodyAcc.Z.std", "Time.GravityAcc.X.std", "Time.GravityAcc.Y.std", "Time.GravityAcc.Z.std", "Time.BodyAccJerk.X.std", "Time.BodyAccJerk.Y.std", "Time.BodyAccJerk.Z.std", "Time.BodyGyro.X.std", "Time.BodyGyro.Y.std", "Time.BodyGyro.Z.std.Z", "Tinme.BodyGyroJerk.X.std", "Time.BodyGyroJerk.Y.std", "Time.BodyGyroJerk.Z.std", "Time.BodyAccMag.std", "Time.GravityAccMag.std", "Time.BodyAccJerkMag.std", "Time.BodyGyroMag.std", "Time.BodyGyroJerkMag.std", "FFT.BodyAcc.X.std", "FFT.BodyAcc.Y.std", "FFT.BodyAcc.Z.std", "FFT.BodyAccJerk.X.std", "FFT.BodyAccJerk.Y.std", "FFT.BodyAccJerk.Z.std", "FFT.BodyGyro.std", "FFT.BodyGyro.Y.std", "FFT.BodyGyro.Z.std", "FFT.BodyAccMag.std", "FFT.BodyAccJerkMag.std", "FFT.BodyGyroMag.std", "FFT.BodyGyroJerkMag.std")
write.csv(MeanStdDF, file="MeanStDevData.csv")
#Set activity and subjects as factors for later sorting
activity <- as.factor(MeanStdDF$Activity)
levels(activity) <- activities$V2
subjects <- as.factor(MeanStdDF$Subject)
#Create tidy data file
tinyData <- cbind(subjects, activity, MeanStdDF)
tidyData <- select(tinyData, subjects, activity, Subject, Time.BodyAcc.X.Mean:FFT.BodyGyroJerkMag.std)
#Write out the tidy data file
write.csv(tidyData, file="TidyData.csv")
#Summarise the data by subject and activity
tidyMelt <- melt(tidyData, id.vars=c("subjects", "activity", "Subject"))
tidySummary <- dcast(tidyMelt, subjects + activity + Subject ~ variable, mean)
#write out the summarised data sorted by subject
tidySummary <- arrange(tidySummary, as.numeric(tidySummary$subject))
write.table(tidySummary, file="DataSummarySorted.txt" row.name=FALSE, sep=",")
