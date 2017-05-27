# Getting-and-Cleaning-Data-Project

run_analysis.R

The cleanup script (run_analysis.R) does the following:

Merges the training and the test sets to create one data set.Extracts only the measurements on the mean and standard deviation for each measurement.Uses descriptive activity names to name the activities in the data setAppropriately labels the data set with descriptive activity names.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Running the script
To run the script, source run_analysis.R. After running, you will see the following output as the script works:

[run_analysis.R] Getting and Cleaning Data Project 
[run_analysis.R] Author: William Bowers 
[run_analysis.R] --- 
[run_analysis.R] Starting up. 
[run_analysis.R] Preparing to run analysis. 
[run_analysis.R] Reading datasets. 
[run_analysis.R] Getting dataset: /repos/Getting-and-Cleaning-Data-Project/data/test 
[run_analysis.R]   reading features... 
[run_analysis.R]   reading activities... 
[run_analysis.R]   reading subjects... 
[run_analysis.R] Getting dataset: /repos/Getting-and-Cleaning-Data-Project/data/train 
[run_analysis.R]   reading features... 
[run_analysis.R]   reading activities... 
[run_analysis.R]   reading subjects... 
[run_analysis.R] Joining datasets. 
[run_analysis.R] Melting. 
[run_analysis.R] Dcasting. 
[run_analysis.R] Saving clean data to: /repos/Getting-and-Cleaning-Data-Project/data/cleaned.txt 

Process
For both the test and train datasets, produce an interim dataset:
Extract the mean and standard deviation features (listed in CodeBook.md, section 'Extracted Features'). This is the values table.Get the list of activities.Put the activity labels (not numbers) into the values table.Get the list of subjects.Put the subject IDs into the values table.
Join the test and train interim datasets.Put each variable on its own row.Rejoin the entire table, keying on subject/acitivity pairs, applying
 the mean function to each vector of values in each subject/activity 
pair. This is the clean dataset.Write the clean dataset to disk.

Cleaned Data
The resulting clean dataset is in this repository at: data/cleaned.txt.
 It contains one row for each subject/activity pair and columns for 
subject, activity, and each feature that was a mean or standard 
deviation from the original dataset.

Notes
X_* - feature values (one row of 561 features for a single activity)
Y_* - activity identifiers (for each row in X_)
subject_ - subject identifiers for rows in X_*
