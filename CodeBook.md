CodeBook for Getting and Cleaning Data Course Project:

This  code book explains the data, variables and all  transformations performed to clean up the data.


Data source:

Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


General Information about data sets: 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


Data sets: 

Includes the following files:

'README.txt' - general Information about the data. 

'features_info.txt': Shows information about the variables used on the feature vector.

'features.txt': List of all features. Variable names for X_train and X_test data

'activity_labels.txt': Links the class labels with their activity name.

'train/X_train.txt': Training set.

'train/y_train.txt': Training labels.

'test/X_test.txt': Test set.

'test/y_test.txt': Test labels.


'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Range from 1 to 30.

'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.

'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.



Transformation:  

There are 5 parts:

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive activity names.
5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


run_analysis.R perform the following activities to implements the above steps:

 1) Read : activity labels data - contain activity id and activity label.
 2) Read features data that contains column names for X_test and X_train data
 3) Setup condition to extract only the measurements on the mean and standard deviation for each measurement. 

 4) Read Training data
 5) Add column names for Train data. Second column of features data set is the column names for X_train and X_test  
 6) Extract only the columns that represents mean or Std from xTrain data set.   

 7) Read test data
 8) Add column names for Train data. Second column of features data set is the column names for X_train and X_test  
 9) Extract only the columns that represents mean or Std from xTest data set.   
 
10) Combine all Training data sets

11) Combine all Test data sets
12) Merge train and test  data to a new data set. 
13) Create a new dataset combinedData2 without Activity label,  before performing mean function, since activity label is not numeric. 
 
14) Summarize the combinedData2 to include just the mean of each variable for each activity and each subject
15) Merging the tidyData with activity label to include activity description.

16) Write the tidy data to a tidy_data.txt file.





