# Coursera: Getting and Cleaning Data - Course Project
# Submitted by Gopakumar Thankappan on 01-25-15
# Step 1:  Merges the training and the test sets to create one data set.
# Step 2:  Extracts only the measurements on the mean and standard deviation for each measurement. 
# Step 3: Uses descriptive activity names to name the activities in the data set
# Sep 4:  Appropriately labels the data set with descriptive variable names. 
# Step 5: From the data set in step 4, creates a second, independent tidy data set 
#         with the average of each variable  for each activity and each subject.


#setting up working directory
#setwd("./Coursera/JHU Datascience 2014-015/03 Getting and Cleaning Data/UCI HAR Dataset")


# Read : activity labels data - contain activity id and activity label.
activityLabels <- read.table("./activity_labels.txt", header=FALSE)
names(activityLabels)  = c('activityId','activityLabel');

# Read features data that contains column names for X_test and X_train data
features <- read.table("./features.txt", header=FALSE)

#setup condition to extract only the measurements on the mean and standard deviation for each measurement. 
extractCondition <- ( grepl("mean|std", features[,2]) & !grepl("-meanFreq..",features[,2]))

# Read Training data
subjectTrain <- read.table("./train/subject_train.txt", header=FALSE)
yTrain <- read.table("./train/y_train.txt", header=FALSE)
xTrain <- read.table("./train/X_train.txt", header=FALSE)

# Add column names for Train data. Second column of features data set is the column names for X_train and X_test  
names(subjectTrain)  = "subjectId";
names(yTrain)        = "activityId";
names(xTrain)        = features[,2]; 

# Extract only the columns that represents mean or Std from xTrain data set.   
xTrain = xTrain[,extractCondition]


# Read test data
subjectTest <- read.table("./test/subject_test.txt", header=FALSE)
yTest <- read.table("./test/y_test.txt", header=FALSE)
xTest <- read.table("./test/X_test.txt", header=FALSE)

# Add column names for Train data. Second column of features data set is the column names for X_train and X_test  
names(subjectTest)  = "subjectId";
names(yTest)        = "activityId";
names(xTest)        = features[,2]; 


# Extract only the columns that represents mean or Std from xTest data set.   
xTest = xTest[,extractCondition]

#Combine all Training data sets
trainData <- cbind(yTrain, subjectTrain, xTrain)

# Combine all Test data sets
testData <- cbind(yTest, subjectTest, xTest)

# Merge train and test  data to a new data set. 
combinedData = rbind(trainData, testData)

# Create a new dataset combinedData2 without Activity label,  before performing mean function, 
# since activity label is not numeric. 
combinedData2   = combinedData[,names(combinedData) != 'activityLabel'];

# Summarize the combinedData2 to include just the mean of each variable for each activity and each subject
tidyData    = aggregate(combinedData2[,names(combinedData2) != c('activityId', 'subjectId')], by=list(activityId=combinedData2$activityId, subjectId = combinedData2$subjectId), mean);

# Merging the tidyData with activity label to include activity description.
tidyData    = merge(activityLabels, tidyData, by='activityId', sort=FALSE, all.y=TRUE);

#Write the tidy data to a text file.
write.table(tidyData, "tidy_data.txt", sep="\t")
