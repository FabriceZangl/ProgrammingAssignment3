## Codebook


# Origin of the data
This tidy dataset is a summarized subset of the "Human Activity Recognition Using Smartphones Data Set".<br>
It is available from this link: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Introduction
The code in the run_analysis.r file is part of the Course Project of the Getting and Cleaning data course of the data science specialization.
## Objective
Its objective of this code is to summarize the average mean and standard deviation measures per individual (30 in total) and activity (6 different activities), in a way that we only have 1 set of measurements per activity and individual.

## Description of the script
This is achieved by merging 2 datasets, a training and a test component, each composed of the measurement data itself, as well as the subject and the activity they carried out for each of the measurement was done.
The code assumes that only the lower case mean and standard deviations are to be retained as measures. The datasets are first merged and provided with clean and meaningful column headers, then the irrelevant columns are removed from the dataset. The activity numbers are then being translated into directly readable activities, before the dataset is summarized into the required format (a set of 30 subjects x 6 activities, i.e. 180 rows).
Finally, this code assumes that the files to merge are already unzipped in the working directory.

# Description of the variables and how they are summarized
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

TimeBodyAcc_XYZ
TimeGravityAcc_XYZ
TimeBodyAccJerk_XYZ
TimeBodyGyro_XYZ
TimeBodyGyroJerk_XYZ
TimeBodyAccMag
TimeGravityAccMag
TimeBodyAccJerkMag
TimeBodyGyroMag
TimeBodyGyroJerkMag
FrequencyBodyAcc_XYZ
FrequencyBodyAccJerk_XYZ
FrequencyBodyGyro_XYZ
FrequencyBodyAccMag
FrequencyBodyAccJerkMag
FrequencyBodyGyroMag
FrequencyBodyGyroJerkMag

Each feature ending on '_XYZ' is a set of 3 measures identifying the 3_axial signals in the X, Y and Z directions.

Two variables that were averaged per subject and activity are: 
mean: Mean value
std: Standard deviation