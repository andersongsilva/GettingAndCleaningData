# Steps 1 and 4:
# Merges the training and the test sets to create one data set.
# Appropriately labels the data set with descriptive variable names.

data.train        <- read.table('UCI HAR Dataset/train/X_train.txt')
data.train[, 562] <- read.table('UCI HAR Dataset/train/y_train.txt')
data.train[, 563] <- read.table('UCI HAR Dataset/train/subject_train.txt')

data.test        <- read.table('UCI HAR Dataset/test/X_test.txt')
data.test[, 562] <- read.table('UCI HAR Dataset/test/y_test.txt')
data.test[, 563] <- read.table('UCI HAR Dataset/test/subject_test.txt')

dataset <- rbind(data.train, data.test)
remove(data.train, data.test)

# Step 3:
# Uses descriptive activity names to name the activities in the data set
activities <- read.table('UCI HAR Dataset/activity_labels.txt')[2]
activities[,] <- gsub('_', ' ', tolower(as.character(activities[,])))
dataset[, 562] <- activities[dataset[, 562], 1]

# Step 2:
# Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table('UCI HAR Dataset/features.txt', stringsAsFactors=F)[2]
features[562:563, ] <- c('Activity', 'Subject')

names(dataset) <- features[, 1]

dataset <- dataset[, grepl('(mean|std|Activity|Subject)', names(dataset))]

names(dataset) <- gsub('^t',   'Time-',      names(dataset))
names(dataset) <- gsub('^f',   'Frequency-', names(dataset))
names(dataset) <- gsub('\\()', '',           names(dataset))

# Step 5:
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
dataset <- aggregate(dataset[, 1:(length(dataset) - 2)],
                     by=list(dataset$Activity, dataset$Subject),
                     mean)

names(dataset)[1:2] <- c('Activity', 'Subject')

write.table(dataset, file="UCI HAR Dataset/tidy_data.txt", row.name=F, sep=' ')
