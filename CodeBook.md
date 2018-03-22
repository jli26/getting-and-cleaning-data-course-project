# Code Book

## Overview
The course project for Getting and Cleaning Data involves collecting, working 
with, and cleaning a data set on Human Activity Recognition Using Smartphones.

This code book describes the data, variables, and steps taken to create the 
tidy data set.

## Data and Variables

The data source for this data set is located on the following website:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset includes the following files:

### Main Data Files
The following are the main data files used in this project.
* 'train/X_train.txt': Contains the training data set (7352 observations, 561 variables).
* 'train/y_train.txt': Contains the activity class labels (1-6) for the training data set 
(7352 observations, 1 variable).
* 'train/subject_train.txt': Contains the subject ids (1-30) for the training data set
(7352 observations, 1 variable).
* 'test/X_test.txt': Contains the test data set (2947 observations, 561 variables).
* 'test/y_test.txt': Contains the activity class labels (1-6) for the test data set 
(2947 observations, 1 variable).
* 'test/subject_test.txt': Contains the subject ids (1-30) for the test data set
(2947 observations, 1 variable).

### Supplementary Data Files 
The following are the supplementary data files used in this project.
* 'README.txt': Provides an overview of the data files.
* 'features_info.txt': Provides information about the feature variables in the training 
and test data sets.
* 'features.txt': Provides variable names of all 561 features.
* 'activity_labels.txt': Provides reference data for the 6 activity class labels.

### Other Data Files (Not Used)
The following are other available data files not used in this project. These are available 
for the training and test data; their descriptions are equivalent. 
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the 
smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element 
vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' 
files for the Y and Z axis. 
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by 
subtracting the gravity from the total acceleration. 
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the 
gyroscope for each window sample. The units are radians/second. 

## Steps
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set.
4. Appropriately label the data set with descriptive variable names.
5. From the data set in step 4, create a second, independent tidy data set with the average 
of each variable for each activity and each subject.

