Getting and Cleaning Data Project
========================================================

run_analysis.R

In order to run the script follow these steps:

1) Start R studio and set the working directory to a folder of your choice

2) download data in zip format from folliwing linke and place it in your working directory:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

3) unzip the data, which creates a folder named "UCI HAR Dataset", where the data to be processed by the script is available.

4) Make sure the Package data.table has been installed using "Install Packages"

5) Load the "run_analysis.R" script and run.

The output of the script is a file named "tidy_data.txt" which contains averages for a subset of 180 rows grouped by activity and subject. More information on the data set and processing steps taken to create it are proivded in the CodeBook.md file.

More information on the data set used in this assignment is available at the following link:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones