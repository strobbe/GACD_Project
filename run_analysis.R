library(dplyr)

## Retrieve the table of activities and name its columns.
message("Getting variable names...", appendLF = FALSE)
act_labels <- read.table("activity_labels.txt", col.names = c("act_id", "activity"))
act_labels[,"activity"] <- tolower(act_labels[,"activity"])

## Retrieve the table of features (variables). We're only
## interested in the second column, so no need name the columns.
measnames <- read.table("features.txt")
message(" Done.")

## Retrieve test data
message("Getting Test data...", appendLF = FALSE)
sub_test <- read.table("./test/subject_test.txt", col.names = "subject")
act_test <- read.table("./test/y_test.txt", col.names = "act_id")
meas_test <- read.table("./test/X_test.txt")
message(" Done.")

## Retrieve Train data
message("Getting Train data...", appendLF = FALSE)
sub_train <- read.table("./train/subject_train.txt", col.names = "subject")
act_train <- read.table("./train/y_train.txt", col.names = "act_id")
meas_train <- read.table("./train/X_train.txt")
message(" Done.")

## Merge each type of data
message("Merging subjects, activities, and measures...", appendLF = FALSE)
subs <- rbind(sub_test, sub_train)
acts <- rbind(act_test, act_train)
meas <- rbind(meas_test, meas_train)
message(" Done.")

## Intermediary step: Clean up objects no longer needed
rm(sub_test, sub_train, act_test, act_train, meas_test, meas_train)

## Assign variable names
message("Naming and selecting variables...", appendLF = FALSE)
colnames(meas) <- measnames[,2]

## Some of the original, but unneeded, column names are duplicates,
## which will cause the "select" function to error out. So,
## first we drop the offending columns first.
meas <- meas[, !duplicated(colnames(meas))]

## Then restrict the measures to just the Mean and Std columns.
meas <- select(meas, contains("mean()"), contains("std()"))
message(" Done.")

## And clean up the remaining names some
names(meas) <- gsub("^t", "Time", names(meas))
names(meas) <- gsub("^f", "Freq", names(meas))
names(meas) <- gsub("Gyro", "Gyroscope", names(meas))
names(meas) <- gsub("BodyBody", "Body", names(meas))
names(meas) <- gsub("Mag", "Magnitude", names(meas))
names(meas) <- gsub("std\\(\\)", "Std", names(meas))
names(meas) <- gsub("mean\\(\\)", "Mean", names(meas))
names(meas) <- gsub("Acc", "Accelerator", names(meas))
names(meas) <- gsub("-", "", names(meas))

## Finally, create our output by:
##  * Combining the subject, activity, and measures(s) columns
##  * grabbing the activity labels
##  * dropping the original numerica activity value
##  * grouping by subject and (new) activity label
##  * summarizing the groups by their means
message("Creating merged data set and tidy data set...", appendLF = FALSE)

raw_data <- cbind(subs, acts, meas)

tidy_data <- raw_data %>%
  merge(act_labels, by = (("act_id"))) %>%
  select(-act_id) %>%
  group_by(subject, activity) %>%
  summarize_each(funs(mean))
message(" Done.")

## Last clean-up, leaving only our tidy data set.
rm(subs, acts, meas, measnames, act_labels)