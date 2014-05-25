# This is the course project / peer assessment associated the Coursera 
# MOOC "Getting and Cleaning Data". This R script, run_analysis.R, takes 
# data collected from the accelerometers from the Samsung Galaxy S smartphone
# then merges, organizes, "cleans" and then produces a final tidy data set 
# that contains the mean of the variables that relate to mean and std dev 
# for each activity and each subject 

# going to use melt and dcast from the 'reshape' library
library(reshape2)

# The data set was downloaded from following URL:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# The data was unzipped into my working directory "/Users/tomesw1" using the default
# directory name "/UCI HAR Dataset". 

#This line sets the working directory

setwd("~/UCI HAR Dataset")

# Read the needed files (X_test.txt,y_test.txt,X_train.txt,y_train.txt,subject_train.txt,
# subject_test.txt,features.txt)

test.x <- read.table('test/X_test.txt') 
test.y <- read.table('test/y_test.txt') #testLabel
train.x <- read.table('train/X_train.txt') 
train.y <- read.table('train/y_train.txt') # trainLabel 
train.subject <- read.table('train/subject_train.txt') 
test.subject <-read.table('test/subject_test.txt') 
features <- read.table('features.txt')
activities <- read.table('activity_labels.txt')

# We need to extract only the measurements  on the mean and standard deviation.
# We grep the feature names that have '-mean' and '-std' in their description into 
# 'mean.std' which we will use as an index after we merge the data

mean.std = grepl("-mean|-std", features$V2)
mean.std

# clean up the variable names
features <- gsub("\\()|-","",features$V2)

# Add the feature names to the two data sets train.x and test.x
names(train.x) <- features 
names(test.x)  <- features 

# use rbind () to merge the data sets 
xData = rbind(train.x, test.x)
dim(xData) # [1] 10299   561
yData = rbind(train.y,test.y)
dim(yData) # [1] 10299     1
subjectData = rbind(train.subject,test.subject)
dim(subjectData) # [1] 10299     1

# use index 'mean.std' to extract only the rows containing mean and std deviation data
xData <- xData[,mean.std]

# Use descriptive activity names to name the activities in the data set
activities[, 2] <- tolower(gsub("_", ".", activities[, 2]))
activities <- activities[yData[, 1], 2]
yData[, 1] <- activities
names(yData) <- "activity"
names(subjectData) <- "subject"

# Merge all 3 data sets to complete the first data set
tidyData1 <- cbind(subjectData,yData,xData)
dim(tidyData1) # [1] 10299    81

# write the first tidy datq set as a text file
write.table(tidyData1, "tidyData1.txt") 

# use melt and dcast functions to create second tidy data set
meltedData <- melt(tidyData1, id = c("subject", "activity"))
tidyData2 <- dcast(meltedData, subject + activity ~ variable, mean)
dim(tidyData2) # [1] 180  81

# write the second tidy data set
write.table(tidyData2, "tidyData2.txt")
