---
title: "GACD Project Codebook"
author: "Robert Strobbe Jr"
date: "November 22, 2015"
---

## Project Description
Project was to create a tidy subset of data from the raw data obtained in a Univerisity of California Irvine experiment using Samsung smartphones. The original experiment took readings from the smartphone's accelerometers during numerous human activities. The Getting and Cleaning Data course project is to retrieve this data, reconstruct the individual files into a complete data set, and summarize specific measurements (those involving mean and standard deviation) for each subject and their activities.

###Collection of the raw data
In the UCI experiments, they "captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz using the embedded accelerometer and gyroscope of the device."

For the GACD proejct, a download link for zipped data was provided:
[UCI HART Dataset.zip] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

##Creating the tidy datafile

###Guide to create the tidy data file
The zipped data should be downloaded using the above link and unzipped. When unzipped, the archive creatse a directory called UCI HAR Dataset, which contains four files and two subdirectories. The working directory in R must be set to the newly created UCI HAR Dataset directory in order to work. Once this has been set, load the script using the source() function, and processing of the raw data will begin.

###Cleaning of the data
The run_analysis.R script loads each of the original data files into R objects and constructs a complete  data set. Each component -- subjects, activities, and measurements -- is given descriptive variable names. Test and Train data, which are separate in the original data set, are rejoined.

From the original 561 measurement variables, only the 66 that calculated the mean() and std() are retained.

Finally, the data is grouped by subject and activity, to result in 180 observations sumarized by the mean for the remaining measurements.

Please see the README.md file for a more detailed description.

##Description of the variables in the tidy_data.txt file
The resulting tidy data set is 180 observations of 68 variables (subject, activity, and 66 acceleromoter readings).

##Variables

subject
activity
TimeBodyAcceleratorMeanX
TimeBodyAcceleratorMeanY
TimeBodyAcceleratorMeanZ
TimeGravityAcceleratorMeanX
TimeGravityAcceleratorMeanY
TimeGravityAcceleratorMeanZ
TimeBodyAcceleratorJerkMeanX
TimeBodyAcceleratorJerkMeanY
TimeBodyAcceleratorJerkMeanZ
TimeBodyGyroscopeMeanX
TimeBodyGyroscopeMeanY
TimeBodyGyroscopeMeanZ
TimeBodyGyroscopeJerkMeanX
TimeBodyGyroscopeJerkMeanY
TimeBodyGyroscopeJerkMeanZ
TimeBodyAcceleratorMagnitudeMean
TimeGravityAcceleratorMagnitudeMean
TimeBodyAcceleratorJerkMagnitudeMean
TimeBodyGyroscopeMagnitudeMean
TimeBodyGyroscopeJerkMagnitudeMean
FreqBodyAcceleratorMeanX
FreqBodyAcceleratorMeanY
FreqBodyAcceleratorMeanZ
FreqBodyAcceleratorJerkMeanX
FreqBodyAcceleratorJerkMeanY
FreqBodyAcceleratorJerkMeanZ
FreqBodyGyroscopeMeanX
FreqBodyGyroscopeMeanY
FreqBodyGyroscopeMeanZ
FreqBodyAcceleratorMagnitudeMean
FreqBodyAcceleratorJerkMagnitudeMean
FreqBodyGyroscopeMagnitudeMean
FreqBodyGyroscopeJerkMagnitudeMean
TimeBodyAcceleratorStdX
TimeBodyAcceleratorStdY
TimeBodyAcceleratorStdZ
TimeGravityAcceleratorStdX
TimeGravityAcceleratorStdY
TimeGravityAcceleratorStdZ
TimeBodyAcceleratorJerkStdX
TimeBodyAcceleratorJerkStdY
TimeBodyAcceleratorJerkStdZ
TimeBodyGyroscopeStdX
TimeBodyGyroscopeStdY
TimeBodyGyroscopeStdZ
TimeBodyGyroscopeJerkStdX
TimeBodyGyroscopeJerkStdY
TimeBodyGyroscopeJerkStdZ
TimeBodyAcceleratorMagnitudeStd
TimeGravityAcceleratorMagnitudeStd
TimeBodyAcceleratorJerkMagnitudeStd
TimeBodyGyroscopeMagnitudeStd
TimeBodyGyroscopeJerkMagnitudeStd
FreqBodyAcceleratorStdX
FreqBodyAcceleratorStdY
FreqBodyAcceleratorStdZ
FreqBodyAcceleratorJerkStdX
FreqBodyAcceleratorJerkStdY
FreqBodyAcceleratorJerkStdZ
FreqBodyGyroscopeStdX
FreqBodyGyroscopeStdY
FreqBodyGyroscopeStdZ
FreqBodyAcceleratorMagnitudeStd
FreqBodyAcceleratorJerkMagnitudeStd
FreqBodyGyroscopeMagnitudeStd
FreqBodyGyroscopeJerkMagnitudeStd