Code Book
========================================================

This file contains the steps taken to process the data available at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

In order to transform it to a tidy data of 180 rows with following attributes:
- combined test and training sets
- mean values for mean and standard deviation of 67 features
- grouping by subject and activity

The script works as follows:

SETUP
- working directory is specified
- required data.table package is installed

FEATURE PROCESSING
- feature data is imported from train and test files
- feature data is combined to create a unique data frame
- feature names are extracted from features.txt
- features which are mean and standard deviation are identified
- names are applied to feature data and undesired features are removed

ACTIVITY PROCESSING
- activity data is imported from train and test files
- activity data is combined to create a unique data frame
- activity names are imported later to avoid issues in combining data

SUBJECT PROCESSING
- subject data is imported from train and test files
- subject data is combined to create a unique data frame

MERGING and RESHAPING
- feature, activity and subject data is combined using cbind
- activity_name is found by importing names and merging with data frame containing all data
- data is grouped by activity_name and subject
- the result is the tidy data set

FINAL STEP
- the data is then written to a txt file using write table






