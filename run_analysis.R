#the code uses dplyr library
library(dplyr)

#1.Load test/train data files
test_subject <- read.table('test/subject_test.txt', sep = '', header = FALSE)
test_features <- read.table('test/X_test.txt', sep = '', header = FALSE)
test_label <- read.table('test/y_test.txt', sep = '', header = FALSE)

train_subject <- read.table('train/subject_train.txt', sep = '', header = FALSE)
train_features <- read.table('train/X_train.txt', sep = '', header = FALSE)
train_label <- read.table('train/y_train.txt', sep = '', header = FALSE)


#2.Select mean and std measurments for body acc columns
# the selected columns are: subject id, tBodyAcc-mean()-X, tBodyAcc-mean()-Y,tBodyAcc-mean()-Z,
# tBodyAcc-std()-X, tBodyAcc-std()-Y, tBodyAcc-std()-Z, y value
features_names <- read.table("./features.txt")[,2]
colnames(train_features) <- features_names
colnames(test_features) <- features_names
#select only column with mean/std names
mean_std_features_names <- grepl("mean|std", features_names)

test_features <- test_features[, mean_std_features_names]
train_features <- train_features[, mean_std_features_names]

#merge the files
test  <- cbind(test_subject,test_label, test_features)
train <- cbind(train_subject, train_label, train_features)

#merge training and testing tables
all_data <- rbind(test, train)

#name the first two column
colnames(all_data)[1] <- 'subject'
colnames(all_data)[2] <- 'label'


#3.Uses descriptive activity names to name the activities in the data set
all_data$label[all_data$label == 1] <- "WALKING"
all_data$label[all_data$label == 2] <- "WALKING_UPSTAIRS"
all_data$label[all_data$label == 3] <- "WALKING_DOWNSTAIRS"
all_data$label[all_data$label == 4] <- "SITTING"
all_data$label[all_data$label == 5] <- "STANDING"
all_data$label[all_data$label == 6] <- "LAYING"

# save all_data datatable into csv file
write.table(all_data, './all_data.txt', row.name=FALSE)

#5. create a summary result file by grouping the data by label and subject
# and calculate average of the measurements.
summary_result <- all_data %>% group_by(subject, label) %>% summarise_each(funs(mean))

# save summary_result datatable into csv file
write.table(summary_result, './summary_data.txt', row.name=FALSE)
