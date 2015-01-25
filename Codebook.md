THe data for this analysis was obtained as part of the programming assignment for Getting and Cleaning Data.

Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data arrived as a training set and a test set, that had been normalised. The data was combined into a 
monolithic data frame and the mean values and standard deviations were extracted and summarized by experimantal 
subject, as outlined in the associated, heavily annotated R script file.

The data headers from the file "features.txt" were converted into the following self-explanatory data headers 
compatible with the R language. The first 3 columns were added to track subject number, 
activity and follow the test/train data set.  An explanation of the data headers can be found in the 
file "features_info.txt", and is not repeated here.

"Subject", "Activity", "Condition", "Time.BodyAcc.X.Mean", "Time.BodyAcc.Y.Mean", "Time.BodyAcc.Z.Mean", 
"Time.GravityAcc.X.Mean", "Time.GravityAcc.Y.Mean", "Time.GravityAcc.Z.Mean", "Time.BodyAccJerk.X.Mean", 
"Time.BodyAccJerk.Y.Mean", "Time.BodyAccJerk.Z.Mean", "Time.BodyGyro.X.Mean", "Time.BodyGyro.Y.Mean", 
"Time.BodyGyro.Z.Mean", "Time.BodyGyroJerk.X.Mean", "Time.BodyGyroJerk.Y.Mean", "Time.BodyGyroJerk.Z.Mean", 
"Time.BodyAcc.Mag.Mean", "Time.GravityAcc.Mag.Mean", "Time.BodyAccJerkMag.Mean", "Time.BodyGyroMag.Mean", 
"Time.BodyGyroJerkMag.Mean", "FFT.BodyAcc.X.Mean", "FFT.BodyAcc.Y.Mean", "FFT.BodyAcc.Z.Mean", 
"FFT.BodyAcc.X.Freq.Mean", "FFT.BodyAcc.Y.Freq.Mean", "FFT.BodyAcc.Z.Freq.Mean", "FFT.BodyAcc.Jerk.X.Mean", 
"FFT.BodyAcc.Jerk.Y.Mean", "FFT.BodyAcc.Jerk.Z.Mean", "FFT.BodyAcc.Jerk.X.Freq.Mean", "FFT.BodyAcc.Jerk.Y.Freq.Mean", 
"FFT.BodyAcc.Jerk.Z.Freq.Mean", "FFT.BodyGyro.X.Mean", "FFT.BodyGyro.Y.Mean", "FFT.BodyGyro.Z.Mean", 
"FFT.BodyGyro.X.Freq.Mean", "FFT.BodyGyro.Y.Freq.Mean", "FFT.BodyGyro.Z.Freq.Mean", "FFT.BodyAcc.Mag.Mean", 
"FFT.BodyAcc.Mag.Freq.Mean", "FFT.BodyAccJerk.Mag.Mean", "FFT.BodyAccJerk.Mag.Freq.Mean", "FFT.BodyGyro.Mag.Mean", 
"FFT.BodyGyro.Mag.Freq.Mean", "FFT.BodyGyroJerk.Mag.Mean", "FFT.BodyGyroJerk.Mag.Freq.Mean", 
"Time.BodyAcc.angle.gravity.Mean", "Time.BodyAccJerk.angle.gravity.Mean", "Time.BodyGyro.angle.gravity.Mean", 
"Time.BodyGyroJerk.angle.gravity.Mean", "Angle.gravity.X.Mean", "Angle.gravity.Y.Mean", "Angle.gravity.Z.Mean", 
"Time.BodyAcc.X.std", "Time.BodyAcc.Y.std", "Time.BodyAcc.Z.std", "Time.GravityAcc.X.std", "Time.GravityAcc.Y.std", 
"Time.GravityAcc.Z.std", "Time.BodyAccJerk.X.std", "Time.BodyAccJerk.Y.std", "Time.BodyAccJerk.Z.std", 
"Time.BodyGyro.X.std", "Time.BodyGyro.Y.std", "Time.BodyGyro.Z.std.Z", "Tinme.BodyGyroJerk.X.std", 
"Time.BodyGyroJerk.Y.std", "Time.BodyGyroJerk.Z.std", "Time.BodyAccMag.std", "Time.GravityAccMag.std", 
"Time.BodyAccJerkMag.std", "Time.BodyGyroMag.std", "Time.BodyGyroJerkMag.std", "FFT.BodyAcc.X.std", 
"FFT.BodyAcc.Y.std", "FFT.BodyAcc.Z.std", "FFT.BodyAccJerk.X.std", "FFT.BodyAccJerk.Y.std", "FFT.BodyAccJerk.Z.std", 
"FFT.BodyGyro.std", "FFT.BodyGyro.Y.std", "FFT.BodyGyro.Z.std", "FFT.BodyAccMag.std", "FFT.BodyAccJerkMag.std", 
"FFT.BodyGyroMag.std", "FFT.BodyGyroJerkMag.std"

From the original study authors:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we 
captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments 
have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two 
sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled 
in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal,
which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body 
acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a 
filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating 
variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

Use of this dataset is acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity 
Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International 
Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the 
authors or their institutions for its use or misuse. Any commercial use is prohibited.
