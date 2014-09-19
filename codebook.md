---
title: "Codebook for Gathering and Cleaning Data"
author: "Sherry Favors"
date: "Wednesday, September 17, 2014"
output: html_document
---

This dataset was collected from various files taken from the data collected from the accelerometers from the Samsung Galaxy S smartphone.  The original dataset can be found: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Once the files were download, the following files were extracted from the original dataset and renamed, in part to make merging the documents more seemless.  These files were also organized into three different folders as follows:

            originalfile:renamed
headers:    features.txt:columns.txt
            activity_labels.txt:rows.txt
test:       subject_test.txt:2subject.txt
            X_test.txt:1data.txt
            y_test.txt:3activities.txt
train:      subject_train.txt:2subject.txt
            X_train.txt:1data.txt
            y_train.txt:3activities.txt
            
The following variables were used to import the data and merge the train and test datasets.  Before the train and test datasets were merged, each dataset was ordered and merged with the activity_labels (rows.txt) to give the activities a descriptive name.  The column with the activity numbers were removed.  
merge()
list.files()
do.call()
cbind()
rbind()
lapply()
colnames()
sub()
grep()
setwd()
read.table()
order()
return()
aggregate() 

Afterwards, extracted the the mean and standard deviation columns from the dataset.  Used the aggregate variable to group the data.  Once it was grouped, added meaning column names to the dataset and created a text file from the dataset.  The final dataset consist of the following columns:

subject:int
activity:factor
Frequency-of-Body-accelation-jerk-signals-mean-axial-direction-X:num
Frequency-of-Body-accelation-jerk-signals-mean-axial-direction-Y:num
Frequency-of-Body-accelation-jerk-signals-mean-axial-direction-Z:num
Frequency-of-Body-accelation-jerk-signals-standard-deviation-axial-direction-X:num
Frequency-of-Body-accelation-jerk-signals-standard-deviation-axial-direction-Y:num
Frequency-of-Body-accelation-jerk-signals-standard-deviation-axial-direction-Z:num
Frequency-of-Body-accelation-magnitude-mean:num
Frequency-of-Body-accelation-magnitude-standard-deviation:num
Frequency-of-Body-accelation-mean-axial-direction-X:num
Frequency-of-Body-accelation-mean-axial-direction-Y:num
Frequency-of-Body-accelation-mean-axial-direction-Z:num
Frequency-of-Body-accelation-standard-deviation-axial-direction-X:num
Frequency-of-Body-accelation-standard-deviation-axial-direction-Y:num
Frequency-of-Body-accelation-standard-deviation-axial-direction-Z:num
Frequency-of-Body-angular-velocity-mean-axial-direction-X:num
Frequency-of-Body-angular-velocity-mean-axial-direction-Y:num
Frequency-of-Body-angular-velocity-mean-axial-direction-Z:num
Frequency-of-Body-angular-velocity-standard-deviation-axial-direction-X:num
Frequency-of-Body-angular-velocity-standard-deviation-axial-direction-Y:num
Frequency-of-Body-angular-velocity-standard-deviation-axial-direction-Z:num
Frequency-of-Body-Bodyaccelation-jerk-signals-magnitude-mean:num
Frequency-of-Body-Bodyaccelation-jerk-signals-magnitude-standard-deviation:num
Frequency-of-Body-Bodyangular-velocity-jerk-signals-magnitude-mean:num
Frequency-of-Body-Bodyangular-velocity-jerk-signals-magnitude-standard-deviation:num
Frequency-of-Body-Bodyangular-velocity-magnitude-mean:num
Frequency-of-Body-Bodyangular-velocity-magnitude-standard-deviation:num
Time-of-Body-accelation-jerk-signals-magnitude-mean:num
Time-of-Body-accelation-jerk-signals-magnitude-standard-deviation:num
Time-of-Body-accelation-jerk-signals-mean-axial-direction-X:num
Time-of-Body-accelation-jerk-signals-mean-axial-direction-Y:num
Time-of-Body-accelation-jerk-signals-mean-axial-direction-Z:num
Time-of-Body-accelation-jerk-signals-standard-deviation-axial-direction-X:num
Time-of-Body-accelation-jerk-signals-standard-deviation-axial-direction-Y:num
Time-of-Body-accelation-jerk-signals-standard-deviation-axial-direction-Z:num
Time-of-Body-accelation-magnitude-mean:num
Time-of-Body-accelation-magnitude-standard-deviation:num
Time-of-Body-accelation-mean-axial-direction-Z:num
Time-of-Body-accelation-standard-deviation-axial-direction-X:num
Time-of-Body-accelation-standard-deviation-axial-direction-Y:num
Time-of-Body-accelation-standard-deviation-axial-direction-Z:num
Time-of-Body-angular-velocity-jerk-signals-magnitude-mean:num
Time-of-Body-angular-velocity-jerk-signals-magnitude-standard-deviation:num
Time-of-Body-angular-velocity-jerk-signals-mean-axial-direction-X:num
Time-of-Body-angular-velocity-jerk-signals-mean-axial-direction-Y:num
Time-of-Body-angular-velocity-jerk-signals-mean-axial-direction-Z:num
Time-of-Body-angular-velocity-jerk-signals-standard-deviation-axial-direction-X:num
Time-of-Body-angular-velocity-jerk-signals-standard-deviation-axial-direction-Y:num
Time-of-Body-angular-velocity-jerk-signals-standard-deviation-axial-direction-Z:num
Time-of-Body-angular-velocity-magnitude-mean:num
Time-of-Body-angular-velocity-magnitude-standard-deviation:num
Time-of-Body-angular-velocity-mean-axial-direction-X:num
Time-of-Body-angular-velocity-mean-axial-direction-Y:num
Time-of-Body-angular-velocity-mean-axial-direction-Z:num
Time-of-Body-angular-velocity-standard-deviation-axial-direction-X:num
Time-of-Body-angular-velocity-standard-deviation-axial-direction-Y:num
Time-of-Body-angular-velocity-standard-deviation-axial-direction-Z:num
Time-of-Gravity-accelation-magnitude-mean:num
Time-of-Gravity-accelation-magnitude-standard-deviation:num
Time-of-Gravity-accelation-mean-axial-direction-X:num
Time-of-Gravity-accelation-mean-axial-direction-Y:num
Time-of-Gravity-accelation-mean-axial-direction-Z:num
Time-of-Gravity-accelation-standard-deviation-axial-direction-X:num
Time-of-Gravity-accelation-standard-deviation-axial-direction-Y:num
Time-of-Gravity-accelation-standard-deviation-axial-direction-Z:num
