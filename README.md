## Introduction

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit:

1. a tidy data set as described below
2. a link to a Github repository with your script for performing the analysis, and
3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

## Assignment

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Files

### CODEBOOK.md

The projects code book

### run_analysis.R

Script for downloading, merging, cleaning and producing tidy data sets
After sourcing the script file run function executeAll() to perform all steps as described above.

* getTestData() - Retrieves and create one data set from test data
* getTrainingData() - Retrieves and create one data set from training data
* getRawData() - Retrieves and create one data set from test and training data
* getFeatures() - Retrieves original feature names
* getNames() - Returns the descriptive variable names
* getActivityLabels - Retrieves activities and their labels
* step1() - Performs step 1 in assignment and cache the result
* step2() - Performs step 1-2 in assignment
* step3() - Performs step 1-3 in assignment
* step4() - Performs step 1-4 in assignment
* step5() - Performs step 1-5 in assignment
* executeAll(reset=FALSE) - Executes all steps in assignment with the possibility to reset cached data
* resetAll()