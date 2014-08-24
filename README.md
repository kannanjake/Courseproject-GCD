Courseproject-GCD
=================
Script:

The script follows this order:
1. It downloads the files from the link and unzips it
2. The values(x files),variable names(y files), subject names(subject files) are read into R for both test and train 
3. The test and train datasets are merged - step 1
4. Add appropriate variable names to the dataset of x using the features dataset - Step 4 but done earlier since 
this would make it easier to eliminate other variables that does not correspond to mean/std
5.Add activity names to the y dataset using merge function - step 3
6.Search only for variables that contains mean and std
7.Subset dataset with id variables(subject+activity) and variables that contains mean and std - step 2
8.Create a tidy dataset using aggregate function - step 5

Code book:

x_train - values of train dataset (x_file)
y_train - values corresponding to activity names of train (y_file)
subject_train - subject ids for train data set (subject file)

x_test - values of test dataset (x_file)
y_test - values corresponding to activity names of test (y_file)
subject_test - subject ids for test data set (subject file)

activity - activity names with corresponding numbers
features - variable names for the x files

x_tt - Combined x dataset
y_tt - Combined y dataset
subject_tt - Combined subject dataset
activity_tt - activities are merged with y data set y_tt

xy_tt - Combined dataset of x_tt,y_tt,subject_tt and activity_tt
colmean - column indexes that contains the word mean()
colstd - column indexes that contains the word std()
colmeanstd - combination of colmean _ colst
xy_meanstd - xy dataset subset according to colmeanstd indexes
xy_tidy - tidy dataset containing the averages of the mean and std variables


