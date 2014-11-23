### Introduction

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Source files

The following files have been used from the above dataset:
. activity_labels.txt
. features.txt
. features_info.txt
. test/X_test.txt
. test/y_test.txt
. test/subject_test.txt
. train/X_train.txt
. train/y_train.txt
. train/subject_train.txt

### Data clean up

## Step 1

a. Reading data from the following files
   . X_test.txt
   . y_test.txt
   . subject_test.txt
b. Setting the names of the columns from X_test.txt to the names in the features.txt file
c. Setting the name of the column in y_test.txt to "Activity" and the column in subject_test.txt to "Subject"
d. Merge the columns from the three data sets into one test data set
e. Do the corresponding operation a-d with the files X_train.txt, y_train.txt and subject_train.txt into one train data set
f. Append the rows of the test data set to the training data set

## Step 2

a. Select the columns "Subject", "Activity" and all columns of mean value and standard deviation

## Step 3

a. Convert all the numerical values of "Activity" column into corresponding values from activity_labels.txt

## Step 4

a. Assign descriptive column names in the data set according to descriptions in file features_info.txt

## Step 5

a. Melt the data set with id variables "Subject" and "Activity"
b. Create a tidy data set with the average of each variable from the melted data set
c. Write the tidy data set to file


### Variables

 1. Subject  - The subject performing the activity
 2. Activity - The activity performed

## Time domain signals - Mean value

 3. Time.Body.Acceleration.Mean.X - Body acceleration X direction
 4. Time.Body.Acceleration.Mean.Y - Body acceleration Y direction
 5. Time.Body.Acceleration.Mean.Z - Body acceleration Z direction
 6. Time.Gravity.Acceleration.Mean.X - Gravity acceleration X direction
 7. Time.Gravity.Acceleration.Mean.Y - Gravity acceleration Y direction
 8. Time.Gravity.Acceleration.Mean.Z - Gravity acceleration Z direction
 9. Time.Body.Acceleration.Jerk.Mean.X - Body acceleration jerk X direction
10. Time.Body.Acceleration.Jerk.Mean.Y - Body acceleration jerk Y direction
11. Time.Body.Acceleration.Jerk.Mean.Z - Body acceleration jerk Z direction
12. Time.Body.Gyro.Mean.X - Body gyro X direction
13. Time.Body.Gyro.Mean.Y - Body gyro Y direction
14. Time.Body.Gyro.Mean.Z - Body gyro Z direction
15. Time.Body.Gyro.Jerk.Mean.X - Body gyro jerk X direction
16. Time.Body.Gyro.Jerk.Mean.Y - Body gyro jerk Y direction
17. Time.Body.Gyro.Jerk.Mean.Z - Body gyro jerk Z direction
18. Time.Body.Acceleration.Magnitude.Mean - Body acceleration magnitude from Euclidean norm
19. Time.Gravity.Acceleration.Magnitude.Mean - Gravity acceleration magnitude from Euclidean norm
20. Time.Body.Acceleration.Jerk.Magnitude.Mean - Body acceleration jerk magnitude from Euclidean norm
21. Time.Body.Gyro.Magnitude.Mean - Body gyro magnitude from Euclidean norm
22. Time.Body.Gyro.Jerk.Magnitude.Mean - Body gyro jerk magnitude from Euclidean norm

## Frequency domain signals - Mean value

23. Frequency.Body.Acceleration.Mean.X - Body acceleration X direction
24. Frequency.Body.Acceleration.Mean.Y - Body acceleration Y direction
25. Frequency.Body.Acceleration.Mean.Z - Body acceleration Z direction
26. Frequency.Body.Acceleration.Jerk.Mean.X - Body acceleration jerk X direction
27. Frequency.Body.Acceleration.Jerk.Mean.Y - Body acceleration jerk Y direction
28. Frequency.Body.Acceleration.Jerk.Mean.Z - Body acceleration jerk Z direction
29. Frequency.Body.Gyro.Mean.X - Body gyro X direction
30. Frequency.Body.Gyro.Mean.Y - Body gyro Y direction
31. Frequency.Body.Gyro.Mean.Z - Body gyro Z direction
32. Frequency.Body.Acceleration.Magnitude.Mean - Body acceleration magnitude from Euclidean norm
33. Frequency.Body.Body.Acceleration.Jerk.Magnitude.Mean - Body body acceleration magnitude from Euclidean norm
34. Frequency.Body.Body.Gyro.Magnitude.Mean - Body body gyro magnitude from Euclidean norm
35. Frequency.Body.Body.Gyro.Jerk.Magnitude.Mean - Body body gyro jerk magnitude from Euclidean norm

## Time domain signals - Standard deviation

36. Time.Body.Acceleration.Std.X - Body acceleration X direction
37. Time.Body.Acceleration.Std.Y - Body acceleration Y direction
38. Time.Body.Acceleration.Std.Z - Body acceleration Z direction
39. Time.Gravity.Acceleration.Std.X - Gravity acceleration X direction
40. Time.Gravity.Acceleration.Std.Y - Gravity acceleration Y direction
41. Time.Gravity.Acceleration.Std.Z, - Gravity acceleration Z direction
42. Time.Body.Acceleration.Jerk.Std.X - Body acceleration jerk X direction
43. Time.Body.Acceleration.Jerk.Std.Y - Body acceleration jerk Y direction
44. Time.Body.Acceleration.Jerk.Std.Z - Body acceleration jerk Z direction
45. Time.Body.Gyro.Std.X - Body gyro X direction
46. Time.Body.Gyro.Std.Y - Body gyro Y direction
47. Time.Body.Gyro.Std.Z - Body gyro Z direction
48. Time.Body.Gyro.Jerk.Std.X - Body gyro jerk X direction
49. Time.Body.Gyro.Jerk.Std.Y - Body gyro jerk Y direction
50. Time.Body.Gyro.Jerk.Std.Z - Body gyro jerk Z direction
51. Time.Body.Acceleration.Magnitude.Std - Body acceleration magnitude from Euclidean norm
52. Time.Gravity.Acceleration.Magnitude.Std - Gravity acceleration magnitude from Euclidean norm
53. Time.Body.Acceleration.Jerk.Magnitude.Std - Body acceleration jerk magnitude from Euclidean norm
54. Time.Body.Gyro.Magnitude.Std - Body gyro magnitude from Euclidean norm
55. Time.Body.Gyro.Jerk.Magnitude.Std - Body gyro jerk magnitude from Euclidean norm

## Frequency domain signals - Standard deviation

56. Frequency.Body.Acceleration.Std.X - Body acceleration X direction
57. Frequency.Body.Acceleration.Std.Y - Body acceleration Y direction
58. Frequency.Body.Acceleration.Std.Z - Body acceleration Z direction
59. Frequency.Body.Acceleration.Jerk.Std.X - Body acceleration jerk X direction
60. Frequency.Body.Acceleration.Jerk.Std.Y - Body acceleration jerk Y direction
61. Frequency.Body.Acceleration.Jerk.Std.Z - Body acceleration jerk Z direction
62. Frequency.Body.Gyro.Std.X - Body gyro X direction
63. Frequency.Body.Gyro.Std.Y - Body gyro Y direction
64. Frequency.Body.Gyro.Std.Z - Body gyro Z direction
65. Frequency.Body.Acceleration.Magnitude.Std - Body acceleration magnitude from Euclidean norm
66. Frequency.Body.Body.Acceleration.Jerk.Magnitude.Std - Body body acceleration magnitude from Euclidean norm
67. Frequency.Body.Body.Gyro.Magnitude.Std - Body body gyro magnitude from Euclidean norm
68. Frequency.Body.Body.Gyro.Jerk.Magnitude.Std - Body body gyro jerk magnitude from Euclidean norm
