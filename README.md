# Getting-and-Cleaning-Data-Course-Project
Course project required for the completion of the course, Getting and Cleaning Data, the third course in the Data Science Specialization at Coursera  

1. run_anlaysis.R reads the data sets - x_test, y_test, subject_test, x_train, y_train, subject_train, features and activity labels - from the directory.  
2. The test and train data are then merged using rbind and cbind, so that every column represents a variable and every row represents an observation i.e. a tidy data.  
3. Only the columns containing the mean and std are kept in the tidy data.  
4. The activity has been labelled accordingly.  
5. The second data set output was achieved by grouping by subject and activity.  
