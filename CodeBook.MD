##Overview of run_analysis.R:

-Read the files subject_train.txt and subject_test.txt then bind them into subject_Data
-Read the files X_train.txt and X_test.txt then bind them into x_Data
-Read the files y_train.txt and y_test.txt then bind them into y_Data

-Read the features.txt and activities_labels.txt

-Select the columns from activities_labels that have mean or std strings in name
-Select in the x_Data the columns previsiously selected in activities_label

-Create a vector with names of activities from y_Data

-Create a new data.frame (result) that merges selected colums from x_Data, vector with name os activities from y_Data anda subject_Data

-Change the name of colums from the result data.frame

-Create other data.frame (result.avg) with average for each activity and each subject

##Variables:

-subject_train_Data is the data.frame from file subject_train.txt
-subject_test_Data is the data.frame from file subject_test.txt
-subject_Data is a bind from subject_train_Data and subject_test_Data
-x_train_Data is the data.frame from file X_train.txt
-x_test_Data is the data.frame from file X_test.txt
-x_Data is a bind from x_train_Data and x_test_Data
-y_train_Data is the data.frame from file y_train.txt
-y_test_Data is the data.frame from file y_test.txt
-y_Data is a bind from (y_train_Data and y_test_Data
-features_Data is the data.frame from file features.txt
-activities_labels_Data is the data.frame from file activity_labels.txt
-mean_std_col is a vector with number of colums that have mean or std in the name
-x_mean_std is a data.frame that the colums are selected from mean_std_col
-y_act is a vector with name of activities from y_Data and activities_labels_Data
-result is a bind with x_mean_std, y_act and subject_Data
-result_avg is a data.frame with mean of all colums grouped by activity and subject
