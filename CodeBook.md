Getting and Cleaning Data Course Project CodeBook
=================================================

Input data for the project (from UCI ML Repository):
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The output data `tidy_data.txt` is a space-delimited value file. The header line contains the names of the variables. It is grouped for the 30 subjects and 6 activities, and contains an average of the mean and standard deviation measurements of the data contained in the input files.

The first two columns represent the subjects and the activities: 
* Activity: Activity Type (laying, sitting, standing, walking, walking downstairs, walking upstairs)
* Subject:  Subject ID (one of the 30 subjects)

The remaining columns identify different kinds of measurements. The naming convention for each measurement variable in the tidy data follows the convention below:
* 1st part of the name is the measurement domain (time or frequency)
* 2nd part of the name is the signal type (body, gravity, magnitude, and jerk signals) and the measurement device (accelerometer or gyroscope)
* 3rd part of the name is the statistical moment (mean or standard deviation)
* 4th part of the name is the directional component in 3 dimensions (x, y, or z)
 
The variables are normalized to a [-1, 1] range, so note that values can be negative for these observations.
