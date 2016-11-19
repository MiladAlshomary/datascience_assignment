#1.Load test/train data files and merge them into one file
test_subject <- read.csv('test/subject_test.txt', sep = '', header = FALSE)
test_features <- read.csv('test/X_test.txt', sep = '', header = FALSE)
test_label <- read.csv('test/y_test.txt', sep = '', header = FALSE)

train_subject <- read.csv('train/subject_train.txt', sep = '', header = FALSE)
train_features <- read.csv('train/X_train.txt', sep = '', header = FALSE)
train_label <- read.csv('train/y_train.txt', sep = '', header = FALSE)

test  <- cbind(test_subject, test_features, test_label)
train <- cbind(train_subject, train_features, train_label)

all_data <- rbind(test, train)

#2.Select mean and std measurments for body acc columns
# the selected columns are: subject id, tBodyAcc-mean()-X, tBodyAcc-mean()-Y,tBodyAcc-mean()-Z,
# tBodyAcc-std()-X, tBodyAcc-std()-Y, tBodyAcc-std()-Z, y value
all_data <- all_data[,c(1,2,3,4,5,6,7,563)]


#4.Appropriately labels the data set with descriptive variable names.
colnames(all_data) <- c('subject', 'x_body_acc_mean', 'y_body_acc_mean', 'z_body_acc_mean', 
                        'x_body_std_mean', 'y_body_std_mean', 'z_body_std_mean', 'label')

#3.Uses descriptive activity names to name the activities in the data set
all_data$label[all_data$label == 1] <- "WALKING"
all_data$label[all_data$label == 2] <- "WALKING_UPSTAIRS"
all_data$label[all_data$label == 3] <- "WALKING_DOWNSTAIRS"
all_data$label[all_data$label == 4] <- "SITTING"
all_data$label[all_data$label == 5] <- "STANDING"
all_data$label[all_data$label == 6] <- "LAYING"

# save all_data datatable into csv file
write.csv(all_data, './all_data.csv')

#5. create a summary result file by grouping the data by label and subject
# and calculate average of the measurements.
summary_result <- summarise(group_by(all_data,subject, label), mean(x_body_acc_mean), mean(y_body_acc_mean), mean(z_body_acc_mean),
                            mean(x_body_std_mean), mean(y_body_std_mean), mean(z_body_std_mean))

# save summary_result datatable into csv file
write.csv(summary_result, './summary_data.csv')
