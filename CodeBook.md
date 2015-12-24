CodeBook
---------------------------------------------------------------
This document describes the source and final dataset used by *run_analysis.R* 

## Source Dataset
- This data is obtained from "Human Activity Recognition Using Smartphones Data Set". The data linked are collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.
- The data set used can be downloaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>. 
- The data set contains the following data files
 - `X_train.txt` contains variable features that are intended for training.
 - `y_train.txt` contains the activities corresponding to `X_train.txt`.
 - `subject_train.txt` contains information on the subjects from whom data is collected.
 - `X_test.txt` contains variable features that are intended for testing.
 - `y_test.txt` contains the activities corresponding to `X_test.txt`.
 - `subject_test.txt` contains information on the subjects from whom data is collected.
 - `activity_labels.txt` contains metadata on the different types of activities.
 - `features.txt` contains the name of the features in the data sets.

## Output Dataset
- The output data `Tidy.txt` is a a space-delimited value file 
- The header contains the names of the variables and contains the mean and standard deviation values of the data contained in the input files

### Columns
"Subject" 
"Activity" 
"TimeBodyAccelerometerMean()-X" 
"TimeBodyAccelerometerMean()-Y" 
"TimeBodyAccelerometerMean()-Z" 
"TimeBodyAccelerometerSTD()-X" 
"TimeBodyAccelerometerSTD()-Y" 
"TimeBodyAccelerometerSTD()-Z" 
"TimeGravityAccelerometerMean()-X" 
"TimeGravityAccelerometerMean()-Y" 
"TimeGravityAccelerometerMean()-Z" 
"TimeGravityAccelerometerSTD()-X" 
"TimeGravityAccelerometerSTD()-Y" 
"TimeGravityAccelerometerSTD()-Z" 
"TimeBodyAccelerometerJerkMean()-X" 
"TimeBodyAccelerometerJerkMean()-Y" 
"TimeBodyAccelerometerJerkMean()-Z" 
"TimeBodyAccelerometerJerkSTD()-X" 
"TimeBodyAccelerometerJerkSTD()-Y" 
"TimeBodyAccelerometerJerkSTD()-Z" 
"TimeBodyGyroscopeMean()-X" 
"TimeBodyGyroscopeMean()-Y" 
"TimeBodyGyroscopeMean()-Z" 
"TimeBodyGyroscopeSTD()-X" 
"TimeBodyGyroscopeSTD()-Y" 
"TimeBodyGyroscopeSTD()-Z" 
"TimeBodyGyroscopeJerkMean()-X" 
"TimeBodyGyroscopeJerkMean()-Y" 
"TimeBodyGyroscopeJerkMean()-Z" 
"TimeBodyGyroscopeJerkSTD()-X" 
"TimeBodyGyroscopeJerkSTD()-Y" 
"TimeBodyGyroscopeJerkSTD()-Z" 
"TimeBodyAccelerometerMagnitudeMean()" 
"TimeBodyAccelerometerMagnitudeSTD()" 
"TimeGravityAccelerometerMagnitudeMean()" 
"TimeGravityAccelerometerMagnitudeSTD()" 
"TimeBodyAccelerometerJerkMagnitudeMean()" 
"TimeBodyAccelerometerJerkMagnitudeSTD()" 
"TimeBodyGyroscopeMagnitudeMean()" 
"TimeBodyGyroscopeMagnitudeSTD()" 
"TimeBodyGyroscopeJerkMagnitudeMean()" 
"TimeBodyGyroscopeJerkMagnitudeSTD()" 
"FrequencyBodyAccelerometerMean()-X" 
"FrequencyBodyAccelerometerMean()-Y" 
"FrequencyBodyAccelerometerMean()-Z" 
"FrequencyBodyAccelerometerSTD()-X" 
"FrequencyBodyAccelerometerSTD()-Y" 
"FrequencyBodyAccelerometerSTD()-Z" 
"FrequencyBodyAccelerometerMeanFreq()-X" 
"FrequencyBodyAccelerometerMeanFreq()-Y" 
"FrequencyBodyAccelerometerMeanFreq()-Z" 
"FrequencyBodyAccelerometerJerkMean()-X" 
"FrequencyBodyAccelerometerJerkMean()-Y" 
"FrequencyBodyAccelerometerJerkMean()-Z" 
"FrequencyBodyAccelerometerJerkSTD()-X" 
"FrequencyBodyAccelerometerJerkSTD()-Y" 
"FrequencyBodyAccelerometerJerkSTD()-Z" 
"FrequencyBodyAccelerometerJerkMeanFreq()-X" 
"FrequencyBodyAccelerometerJerkMeanFreq()-Y" 
"FrequencyBodyAccelerometerJerkMeanFreq()-Z" 
"FrequencyBodyGyroscopeMean()-X" 
"FrequencyBodyGyroscopeMean()-Y" 
"FrequencyBodyGyroscopeMean()-Z" 
"FrequencyBodyGyroscopeSTD()-X" 
"FrequencyBodyGyroscopeSTD()-Y" 
"FrequencyBodyGyroscopeSTD()-Z" 
"FrequencyBodyGyroscopeMeanFreq()-X" 
"FrequencyBodyGyroscopeMeanFreq()-Y" 
"FrequencyBodyGyroscopeMeanFreq()-Z" 
"FrequencyBodyAccelerometerMagnitudeMean()" 
"FrequencyBodyAccelerometerMagnitudeSTD()" 
"FrequencyBodyAccelerometerMagnitudeMeanFreq()" 
"FrequencyBodyAccelerometerJerkMagnitudeMean()" 
"FrequencyBodyAccelerometerJerkMagnitudeSTD()" 
"FrequencyBodyAccelerometerJerkMagnitudeMeanFreq()" 
"FrequencyBodyGyroscopeMagnitudeMean()" 
"FrequencyBodyGyroscopeMagnitudeSTD()" 
"FrequencyBodyGyroscopeMagnitudeMeanFreq()" 
"FrequencyBodyGyroscopeJerkMagnitudeMean()" 
"FrequencyBodyGyroscopeJerkMagnitudeSTD()" 
"FrequencyBodyGyroscopeJerkMagnitudeMeanFreq()" 
"Angle(TimeBodyAccelerometerMean,Gravity)" 
"Angle(TimeBodyAccelerometerJerkMean),GravityMean)" 
"Angle(TimeBodyGyroscopeMean,GravityMean)" 
"Angle(TimeBodyGyroscopeJerkMean,GravityMean)" 
"Angle(X,GravityMean)" 
"Angle(Y,GravityMean)" 
"Angle(Z,GravityMean)"