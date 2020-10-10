# Code Description:
This document contains descriptions of the variables, the data, and all transformations.

## Data Source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Description of the dataset from the source website:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Activities of 30 volunteers (aged between 19 – 48 years) were recorded in an experiment with the help of Samsung galaxy s2 smartphone. They performed - Walking, Walking_Upstairs, Walking_Downstairs, Sitting, Standing, Laying. 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were recorded using the phones’ embedded accelerometer and gyroscope sensors and manually labelled through video recording. The observations were randomly partitioned into training and test sets corresponding to 70% and 30 % respectively.

The sensor signals were pre-calibrated and sampled in fixed width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, having gravitational and body motion components, was separated using a Butterworth low-pass filter. The gravitational force was assumed to have only low frequency components and a filter with 0.3 Hz cut-off frequency was used. From each window, vectors of features were obtained by calculating variables from the time and frequency domain.

## Data:
The dataset includes the following files:

* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
*	'features.txt': List of all features.
*	'activity_labels.txt': Links the class labels with their activity name.
*	'train/X_train.txt': Training set.
*	'train/y_train.txt': Training labels.
*	'test/X_test.txt': Test set.
*	'test/y_test.txt': Test labels.

## Files available for the train and test data.
*	_'train/subject_train.txt'_ : Rows show person who performed the activity (range – 1 to 30)
*	_'train/Inertial Signals/total_acc_x_train.txt'_: Acceleration signal from smartphone accelerometer X axis in standard *g* units. Rows show a vector with 128-elements. Similar description for 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axes. 
*	_'train/Inertial Signals/body_acc_x_train.txt'_: Measure of body acceleration signal obtained by subtracting gravity from total acceleration.
*	_'train/Inertial Signals/body_gyro_x_train.txt'_: Angular velocity vector - rads/second.

## Transformation and Source Code run_analysis.R – description:
    
*	Merging training and test sets to create a unified data set after loading both test and train sets, after processing. 
*	Extracts only measurements on the mean and standard deviation for each observation. Source code extracts the mean and standard deviation data into one dataset with appropriate column names.
*	R code loads the descriptive feature and activity labels using descriptive activity names for activities in the data set.
*	Appropriately labels are attached to the data set with descriptive variable names.
*	Finally, an independent, clean (tidy) data set is created having the average of each variable for each activity corresponding to each subject – and stored in "tidydata.txt".
