# Getting and Cleaning Data Course Project ReadMe
Robert Strobbe Jr
November 22, 2015


The run_analysis.R script performs the steps necessary to build a complete data set from the individual HCI HAR data files, and from that a tidy data set summarizing a subset of variables by subject and activity.

The original data files include:

1. activity_labels.txt: 6x2 table listing the categories of activity performed in the experiment
2. features.txt: 2x561 table listing the measurements taken in the experiment
3. test/subject_test.txt: The subject id for each of the 2,497 test observations
4. test/X_test.txt: The mesasurement values for each of teh 2,497 test observations
5. test/y_test.txt: The activity id for each of the 2,497 test observations
6. train/subject_train.txt: The subject id for each of the 7,352 train observations
7. train/X_train.txt: The mesasurement values for each of the 7,352 train observations
8. train/y_train.txt: The activity id for each of the 7,352 train observations

Each step of this process is described in the script's comments. They are as follows:

## Step #1: Retrieve source data.

Each of the eight files is loaded into its own R object using the read.table() function. The object with activity labels is given friendly column names to more easily merge it with the main data set later. Column names for the other objects will be adjusted as needed.

## Step #2: Perform initial data merge.

Using the rbind() function, three initial data sets are created from the Test and Train data sets. 1. 1. subs: The subject id for all 10,299 observations
2. acts: The activity id for all 10,299 observations
3. meas: The measurment values for all 10,299 observations

This step removes the need for six of the original eight R objects. These six are removed from the workspace.

## Step #3: Name and select variables.

The meas object is assigned column names from the R object (measnames) that was created from features.txt. The object is subsetted using !duplicated() to remove several duplicate variable names in the original data set. Then the select() function from the dplyr package is used to select only the variables with mean() and std(). Lastly, the gsub() function is used to give these variables cleaner, more descriptive names.

## Step #4: Merge initial raw data set.

The rbind() function is used to combine the columns of the subs, acts, and meas objects, resulting in a 10,299x68 data table: 10,299 observations, each with a subject id, activity id, and 66 measurements.

## Step #5: Create a tidy data set.

The following operations are chained using the %>% operator to create a tidy data set:
1. merge() function to add activiy labels from the activity labels object to the raw data set
2. select() function to remove the now unneeded activity id column
3. group_by function to segment the data by subject and activity
4. summarize_each() function to find the mean for each measure by our grouping

Lastly, all objects other than the raw_data and tidy_data are removed from the workspace.