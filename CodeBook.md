## CodeBook

Data Downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Details regarding the dataset can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

### The Variables

You should create one R script called run_analysis.R that does the following.


### The data
After extracting the zip file a folder named "UCI HAR Dataset" is created
the data is obtained from the following .txt files under that folder

- ``activity labels "/activity_labels.txt"`` 
- ``features        "/features.txt"``
- ``subjecttrain    "/train/subject_train.txt"``
- ``subjecttest     "/test/subject_test.txt"``
- ``xtrain          "/train/X_train.txt"``
- ``xtest           "/test/X_test.txt"``
- ``ytrain          "/train/y_train.txt"``
- ``ytest           "/test/y_test.txt"``

### Transformations

For each one of the cases, test and train the following steps are applied

- Content of the X file is loaded
- Using the data from the Features file the X data have the column names set 
- Load the Y data
- Load the Activity_labels
- X data frame receives a new variable named as Activity using the Y data transformed joined with the activity lables data
- Subject Data is added to X_Train and X_Test by reading the subject_Text and subject_Train files. It's added into a new column, called Subjects.

Now on transformations with both data loaded test and train
- Concatenation of train data and test data occurs
- Then the data is filtered to get only the variables called Activity, Subject or any other containing the strings mean or std in their name
- Using the mel function a new data frame with 4 variables is generated: Subject, Activity, variable and the value for that combination.
- The data is grouped by Activity, Subject and Variable when ddply function generates the mean using the values variable
- The variables names are reset with better names
- A file called output.txt is generated 

