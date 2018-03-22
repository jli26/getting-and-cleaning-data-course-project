# Coursera - Getting and Cleaning Data - Course Project

# 1. Merge the training and the test sets to create one data set.

# Read training and test data into R
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              destfile = "./activity.zip", method = "curl")
unzip("activity.zip")
training.x <- read.table("UCI HAR Dataset/train/X_train.txt")
training.y <- read.table("UCI HAR Dataset/train/y_train.txt")
training.subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
test.x <- read.table("UCI HAR Dataset/test/X_test.txt")
test.y <- read.table("UCI HAR Dataset/test/y_test.txt")
test.subject <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Merge the training and test data from each file (rows)
merged.x <- rbind(training.x, test.x)
merged.y <- rbind(training.y, test.y)
merged.subject <- rbind(training.subject, test.subject)

# Add column names for the merged data
features <- read.table("UCI HAR Dataset/features.txt")
names(merged.x) <- features$V2
names(merged.y) <- "activity"
names(merged.subject) <- "subjectid"

# Merge the different data files (columns)
merged <- cbind(merged.subject, merged.y, merged.x)

# 2. Extract only the measurements on the mean and standard deviation for each measurement

# Use regular expressions to find column names containing mean() or std()
columns <- grepl("mean\\(\\)|std\\(\\)",names(merged))

# Keep the first and second columns (subjectid and activity)
columns[1:2] <- TRUE

# Create a new data frame with the desired columns
merged2 <- merged[,columns]

# 3. Use descriptive activity names to name the activities in the data set

# Convert the activity column from integer to factor
merged2$activity <- factor(merged2$activity, labels = c("Walking", "Walking Upstairs", "Walking Downstairs", 
                                                        "Sitting", "Standing", "Laying"))

# 4. Appropriately label the data set with descriptive variable names

# Clean up the variable name descriptions
names(merged2) <- gsub("^t", "Time", names(merged2))
names(merged2) <- gsub("^f", "Frequency", names(merged2))
names(merged2) <- gsub("mean\\(\\)", "Mean", names(merged2))
names(merged2) <- gsub("std\\(\\)", "StandardDeviation", names(merged2))
names(merged2) <- gsub("-", "", names(merged2))

# 5. From the data set in step 4, create a second, independent tidy data set with the average of each 
# variable for each activity and each subject.

# Reshape the data frame so that the measure variables are melted for each subjectid and activity
library(reshape2)
melted <- melt(merged2, id = c("subjectid","activity"))

# Create a tidy data frame with the average of each variable for each subjectid-activity pair
tidy <- dcast(melted, subjectid + activity ~ variable, mean)
write.table(tidy, "tidy.txt", row.names = FALSE)
