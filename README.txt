The dataset includes the following files:
=========================================

- 'README.txt'

- 'codebook.txt': Shows information about the files and the variable in it

- 'run_analysis.R' : R code to reconstruct the output files all_data.csv and summary_data.csv

- 'all_data.txt' : A csv file containing the merged data training and testing 

- 'summary_data.txt' : A csv file containing summary from all_data (grouped by label, subject)


The main task:
=========================================
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The run_analysis.R file does the following:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


- To run the code: You need to run the script run_analysis.R
- Please note:
  - the script should in the working directory where you unzip the folder UCI HAR Dataset
  - the script needs dplyr library to be installed