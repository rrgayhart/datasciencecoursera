##Getting and Cleaning Data Project

Working with data collected from the accelerometers from the Samsung Galaxy S smartphone.
[A full description of the data is provided here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
===================
### Contents
- README.md (Instructions on using the run_analysis.R script)
- run_analysis.R (R file containing the main script)
  -> pull_samsung_data.R (R file responsible for dynamically pulling down data)
- project_code_book.md (The code book describing the variables)
- tidy_data_set.txt (A tidy data set resulting from running the run_analysis.R script)

####The Instructions
Run the run_analysis.R script

The following are the steps the script takes
Step 1 - If you do not already have the data downloaded locally, the script calls to the pull_samsung_data.R to create a data directory - download the samsung data (internet connection required) - and unzips the data files.
Step 2 - Column names are taken from the features.txt file and are assigned to the merged test, training, subject and label datasets
Step 3 - The script extracts only the standard deviation and mean per measurement
Step 4 - The activity labels are converted to human readable descriptions
Step 5 - Labels of all collected data are cleaned up for readability
Step 6 - A tidy independant data set is created with the average of each variable for each activity and subject
Step 7 - The script returns the tidy data set and writes tidydata.txt to file