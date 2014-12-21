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


DATA 

Information on the data can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

The following is an extract from this website describing how the data was gathered:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


FEATURE INFORMATION

The features which are processed in this assigment are data obtained during the above mentioned studies.

For each record in the dataset it is provided:
- mean by activity and subject
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- 67 mean and standard deviation subset from a 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

NOTES 

- Features are normalized and bounded within [-1,1].

more information is available if you contact: activityrecognition@smartlab.ws



