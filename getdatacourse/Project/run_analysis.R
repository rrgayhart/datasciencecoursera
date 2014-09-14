# Will pull down the samsung data if not already in the file directory and unzip it
if (!file.exists("./data/samsung.zip")) {
  source("pull_samsung_data.R")
}

# Merges the training and the test sets to create one data set.
variable_names <- read.table('./data/UCI HAR Dataset/features.txt', header=FALSE, sep="")
training_dataset <- construct_full_training_dataset(variable_names)
test_dataset <- construct_full_test_dataset(variable_names)
full_data_set <- rbind(training_dataset, test_dataset)


construct_full_training_dataset <- function(variable_names) {
  training_feature_data <- read.table('./data/UCI HAR Dataset/train/X_train.txt', header=FALSE, sep="")
  names(training_feature_data) <- variable_names$V2
  training_subject_data <- read.table('./data/UCI HAR Dataset/train/subject_train.txt', header=FALSE, sep="")
  names(training_subject_data) = 'subject'
  training_label_data <- read.table('./data/UCI HAR Dataset/train/Y_train.txt', header=FALSE, sep="")
  names(training_label_data) = 'label'
  return(cbind(training_feature_data, training_subject_data, training_label_data))
}

construct_full_test_dataset <- function(variable_names) {
  test_feature_data <- read.table('./data/UCI HAR Dataset/test/X_test.txt', header=FALSE, sep="")
  names(test_feature_data) <- variable_names$V2
  test_subject_data <- read.table('./data/UCI HAR Dataset/test/subject_test.txt', header=FALSE, sep="")
  names(test_subject_data) = 'subject'
  test_label_data <- read.table('./data/UCI HAR Dataset/test/Y_test.txt', header=FALSE, sep="")
  names(test_label_data) = 'label'
  return(cbind(test_feature_data, test_subject_data, test_label_data))
}


# Extracts only the measurements on the mean and standard deviation for each measurement. 

# Uses descriptive activity names to name the activities in the data set

# Appropriately labels the data set with descriptive variable names. 

# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

#     write.table(row.name=FALSE)