Getting and Cleaning Data

Course Project 

R script , run_analysis.R does the following:

Step 1:  Merges the training and the test sets to create one data set.

Step 2:  Extracts only the measurements on the mean and standard deviation for each measurement. 

Step 3: Uses descriptive activity names to name the activities in the data set

Sep 4:  Appropriately labels the data set with descriptive variable names. 

Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable  for each activity and each subject.



Steps to run the run_analysis.R script: 

1) Download source data from 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'

2) Open this zip file, which will create a folder 'UCI HAR Dataset' and add data sets to this folder.

3) Put run_analysis.R in UCI HAR Dataset folder, and set it as your working directory using setwd() function.

4) Run "run_analysis.R", which will generate a new file 'tidy_data.txt' in your working directory. 

