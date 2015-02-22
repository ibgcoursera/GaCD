####################################################################
### Merge the testing and the test sets to create one data set. ###
####################################################################

# Create dataset from the train sets 

sub_train <- read.table("train/subject_train.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
train <- cbind(sub_train,y_train,x_train)


# Create dataset from the test sets

sub_test <- read.table("test/subject_test.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
test <- cbind(sub_test,y_test,x_test)


# Merge train and test datasets

data <- rbind(train,test)


##############################################################################################
### Extract only the measurements on the mean and standard deviation for each measurement. ###
##############################################################################################

# Read the features file.

features <- read.table("features.txt")


# Extract only the measurements on the mean and standard deviation. 

mean_columns <- grep("mean()",features$V2) + 2 
std_columns <- grep("std()",features$V2) + 2 
data <- data[,sort(c(1,2,mean_columns, std_columns))]


##############################################################################
### Uses descriptive activity names to name the activities in the data set ###
##############################################################################

activity_labels <- read.table("activity_labels.txt")
names(activity_labels) <- c("activity_id","activity_name")
data<- merge(data,activity_labels,by.x="V1.1",by.y="activity_id",all=FALSE)


##########################################################################
### Appropriately labels the data set with descriptive variable names. ###
##########################################################################

names(data) <- c("Activity","Subject",as.character(features$V2[sort(c(mean_columns-2, std_columns-2))]),"Activity Name")


######################################################################################################################################################
### From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. ###
######################################################################################################################################################

# Delete column Activity because we already have the Activity name and then reorganize the order of columns
data <- data[,c(2,82,3:81)]

#Order by subject and activity  name
data <- data[order(data$Subject, data$"Activity Name"),]

# Compute mean for each subject and activity
newdata <- aggregate(data[, 3:81], list(data$Subject,data$"Activity Name"), mean)
names(newdata)[1]<- "Subject"
names(newdata)[2]<- "Activity Name"

# Write the tidy dataset in a file.
write.table(newdata,"tidydataset.txt",row.name=FALSE)




