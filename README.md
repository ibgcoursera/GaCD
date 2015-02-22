######################
###                ###
### run_analysis.R ###
###                ###
######################

--------------------------------------------------------------------
Step 1: Merge the training and the test sets to create one data set.
--------------------------------------------------------------------

First I create one dataset called 'train' from the three train sets. The first
column of the dataset will identify the subject, the second one the activity and
the rest of them the measurements for that subject and activity.

Then I create one dataset called 'test' from the three test sets. The first
column of the dataset will identify the subject, the second one the activity and
the rest of them the measurements for that subject and activity.

Finally I create one dataset called 'data' that merges the train and test datasets.

---------------------------------------------------------------
Step 2: Extract only the measurements on the mean and standard 
        deviation for each measurement.                        
---------------------------------------------------------------

First I read the features file.
Then I store in mean_colums which columns of the 'data' dataset have the word 'mean' in
their name. 
Then I store in std_colums which columns of the 'data' dataset have the word 'std' in 
their name. 
Finally I store in 'data' only the columns of the subject, the activity and those which 
are mean_columns and those which are std_columns.

---------------------------------------------------------------
Step 3: Uses descriptive activity names to name the activities 
        in the data set
---------------------------------------------------------------

First I read the activity labels file into the activity_labels.
Then I change the names of the columns to something cleaner.
Finally I merge the 'data' dataset with the 'activity_labels'. In order to do this,
I use the activity_id column which appears in both datasets.

---------------------------------------------------------------
Step 4: Appropriately labels the data set with descriptive 
        variable names. 
---------------------------------------------------------------

I rename the columns of the 'data' dataset. For the names of the measurements I use
those in the features dataset.

---------------------------------------------------------------
Step 5: From the data set in step 4, creates a second, independent 
        tidy data set with the average of each variable for each 
        activity and each subject. 
---------------------------------------------------------------

First I delete column Activity (the one which stores the ID of the activity) because we 
already have the Activity name and then reorganize the order of columns.
Then I order the dataset by subject and activity name.
Then I compute the mean for each subject, activity and measurement.
Finally I write the tidy dataset in a file.
