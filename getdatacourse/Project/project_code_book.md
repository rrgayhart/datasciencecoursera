Working with data collected from the accelerometers from the Samsung Galaxy S smartphone.

[A full description of the data is provided here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[Base Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

###Modifications to the Code Book
The official Samsung data has been condensced to include an average of each variable for each activity and each subject.

###Existing Column Names

***Note: Activity is now human readable***
***Note: Subject relates to the tester***

[1] "Activity"                      "Subject"                      
 [3] "tBodyAcc-std-X"                "tBodyAcc-std-Y"               
 [5] "tBodyAcc-std-Z"                "tGravityAcc-std-X"            
 [7] "tGravityAcc-std-Y"             "tGravityAcc-std-Z"            
 [9] "tBodyAccJerk-std-X"            "tBodyAccJerk-std-Y"           
[11] "tBodyAccJerk-std-Z"            "tBodyGyro-std-X"              
[13] "tBodyGyro-std-Y"               "tBodyGyro-std-Z"              
[15] "tBodyGyroJerk-std-X"           "tBodyGyroJerk-std-Y"          
[17] "tBodyGyroJerk-std-Z"           "tBodyAccMag-std"              
[19] "tGravityAccMag-std"            "tBodyAccJerkMag-std"          
[21] "tBodyGyroMag-std"              "tBodyGyroJerkMag-std"         
[23] "fBodyAcc-std-X"                "fBodyAcc-std-Y"               
[25] "fBodyAcc-std-Z"                "fBodyAccJerk-std-X"           
[27] "fBodyAccJerk-std-Y"            "fBodyAccJerk-std-Z"           
[29] "fBodyGyro-std-X"               "fBodyGyro-std-Y"              
[31] "fBodyGyro-std-Z"               "fBodyAccMag-std"              
[33] "fBodyBodyAccJerkMag-std"       "fBodyBodyGyroMag-std"         
[35] "fBodyBodyGyroJerkMag-std"      "tBodyAcc-mean-X"              
[37] "tBodyAcc-mean-Y"               "tBodyAcc-mean-Z"              
[39] "tGravityAcc-mean-X"            "tGravityAcc-mean-Y"           
[41] "tGravityAcc-mean-Z"            "tBodyAccJerk-mean-X"          
[43] "tBodyAccJerk-mean-Y"           "tBodyAccJerk-mean-Z"          
[45] "tBodyGyro-mean-X"              "tBodyGyro-mean-Y"             
[47] "tBodyGyro-mean-Z"              "tBodyGyroJerk-mean-X"         
[49] "tBodyGyroJerk-mean-Y"          "tBodyGyroJerk-mean-Z"         
[51] "tBodyAccMag-mean"              "tGravityAccMag-mean"          
[53] "tBodyAccJerkMag-mean"          "tBodyGyroMag-mean"            
[55] "tBodyGyroJerkMag-mean"         "fBodyAcc-mean-X"              
[57] "fBodyAcc-mean-Y"               "fBodyAcc-mean-Z"              
[59] "fBodyAcc-meanFreq-X"           "fBodyAcc-meanFreq-Y"          
[61] "fBodyAcc-meanFreq-Z"           "fBodyAccJerk-mean-X"          
[63] "fBodyAccJerk-mean-Y"           "fBodyAccJerk-mean-Z"          
[65] "fBodyAccJerk-meanFreq-X"       "fBodyAccJerk-meanFreq-Y"      
[67] "fBodyAccJerk-meanFreq-Z"       "fBodyGyro-mean-X"             
[69] "fBodyGyro-mean-Y"              "fBodyGyro-mean-Z"             
[71] "fBodyGyro-meanFreq-X"          "fBodyGyro-meanFreq-Y"         
[73] "fBodyGyro-meanFreq-Z"          "fBodyAccMag-mean"             
[75] "fBodyAccMag-meanFreq"          "fBodyBodyAccJerkMag-mean"     
[77] "fBodyBodyAccJerkMag-meanFreq"  "fBodyBodyGyroMag-mean"        
[79] "fBodyBodyGyroMag-meanFreq"     "fBodyBodyGyroJerkMag-mean"    
[81] "fBodyBodyGyroJerkMag-meanFreq"