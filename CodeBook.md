CODE BOOK:

The run_analysis.R file contains code to succesfully prepare the data in the fashion instructed in the 
course project description.

1. Data was downloaded from UCI HAR Dataset

2. Data was read into R

x_test = includes test data
y_test = includes test data for code labels
subject_test = includes test data of a fraction of volunteer test subjects
x_train = includes train data
y_train = includes train data for code labels
subject_train = includes train data for the rest of volunteers subjects
features = features come from accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ
activity_labels = includes the activities that were performed when data was taken

3. The data was all merged

4. Extract mean and standard deviation data 

5. Name activities in the data

6. Label the variables in the dataset with better names

7. Create a final dataset (FD) 