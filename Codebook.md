Codebook.md - for 'Getting and Cleaning Data', Johns Hopkins University MOOC via Coursera.
Required for Project 2, peer assessment.

The purpose of this file is to describe the process used to transform multiple data files into a usable ‘tidy’ dataset 
that can be used for analysis.

The data files represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A description of the data and how it was obtained
can be found here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

An R script was created called run_analysis. R to merge, clean and write a tidy data set. Here are the steps used 
in that script:

1. Load the reshape library to use melt and cast functions later, set the working directory to setwd("~/UCI HAR Dataset")

2. Read X_test.txt, y_test.txt and subject_test.txt into variables test.x, test.y and test.subject

3. Read X_train.txt, y_train.txt and subject_train.txt into variables train.x, train.y and train.subject

4. Read features.txt and activity_labels.txt into variables features and activities.

5. Grab all variable names that have to do with mean and std deviation by filtering on ‘-mean’ and ‘-std’

6. Clean up the variable names by getting rid of special characters ( “-“  and “()”) , then update the features variable.

7. Merge the test data sets together by first merging like data sets (train.x with test.x, train.y with test.y, 
   and train.subject with test.subject).

8. Clean up the ‘activities’ variables into something more descriptive. Add the ‘activity’ and ‘subject’ column names
   to their respective data sets.

9. Now merge all datasets together into one table.

10. Write out the first ‘tidy data set’ of the entire merged and cleansed dataset (tidyData1.txt.)

11. Create a second independent ‘tidy data set’ with the average of each variable (mean, std dev) for each activity 
    and subject. Using the ‘melt’ and ‘dcast’ functions to achieve that.

12. Write out final tidy data set (tidyData2.txt)

Extracted and Cleaned Features

"tBodyAccmeanY"                "tBodyAccmeanZ"                "tBodyAccstdX"                
"tBodyAccstdY"                 "tBodyAccstdZ"                 "tGravityAccmeanX"            
"tGravityAccmeanY"             "tGravityAccmeanZ"             "tGravityAccstdX"             
"tGravityAccstdY"              "tGravityAccstdZ"              "tBodyAccJerkmeanX"           
"tBodyAccJerkmeanY"            "tBodyAccJerkmeanZ"            "tBodyAccJerkstdX"            
"tBodyAccJerkstdY"             "tBodyAccJerkstdZ"             "tBodyGyromeanX"              
"tBodyGyromeanY"               "tBodyGyromeanZ"               "tBodyGyrostdX"               
"tBodyGyrostdY"                "tBodyGyrostdZ"                "tBodyGyroJerkmeanX"          
"tBodyGyroJerkmeanY"           "tBodyGyroJerkmeanZ"           "tBodyGyroJerkstdX"           
"tBodyGyroJerkstdY"            "tBodyGyroJerkstdZ"            "tBodyAccMagmean"             
"tBodyAccMagstd"               "tGravityAccMagmean"           "tGravityAccMagstd"           
"tBodyAccJerkMagmean"          "tBodyAccJerkMagstd"           "tBodyGyroMagmean"            
"tBodyGyroMagstd"              "tBodyGyroJerkMagmean"         "tBodyGyroJerkMagstd"         
"fBodyAccmeanX"                "fBodyAccmeanY"                "fBodyAccmeanZ"               
"fBodyAccstdX"                 "fBodyAccstdY"                 "fBodyAccstdZ"                
"fBodyAccmeanFreqX"            "fBodyAccmeanFreqY"            "fBodyAccmeanFreqZ"           
"fBodyAccJerkmeanX"            "fBodyAccJerkmeanY"            "fBodyAccJerkmeanZ"           
"fBodyAccJerkstdX"             "fBodyAccJerkstdY"             "fBodyAccJerkstdZ"            
"fBodyAccJerkmeanFreqX"        "fBodyAccJerkmeanFreqY"        "fBodyAccJerkmeanFreqZ"       
"fBodyGyromeanX"               "fBodyGyromeanY"               "fBodyGyromeanZ"              
"fBodyGyrostdX"                "fBodyGyrostdY"                "fBodyGyrostdZ"               
"fBodyGyromeanFreqX"           "fBodyGyromeanFreqY"           "fBodyGyromeanFreqZ"          
"fBodyAccMagmean"              "fBodyAccMagstd"               "fBodyAccMagmeanFreq"         
"fBodyBodyAccJerkMagmean"      "fBodyBodyAccJerkMagstd"       "fBodyBodyAccJerkMagmeanFreq" 
"fBodyBodyGyroMagmean"         "fBodyBodyGyroMagstd"          "fBodyBodyGyroMagmeanFreq"    
"fBodyBodyGyroJerkMagmean"     "fBodyBodyGyroJerkMagstd"      "fBodyBodyGyroJerkMagmeanFreq"

ID Features

"subject"                      "activity" 
> 
