library(dplyr)
library(plyr)
library(reshape2)

getTestData <- function() {
    print("...Reading test set")
    testSet <- read.fwf("../UCI HAR Dataset/test/X_test.txt", rep(16, times=561))
    names(testSet) <- getFeatures()
    testSet <- tbl_df(testSet)

    print("...Reading test activities")
    testActivity <- read.csv("../UCI HAR Dataset/test/y_test.txt", header=FALSE)
    names(testActivity) <- c("Activity")
    testActivity <- tbl_df(testActivity)

    print("...Reading test subjects")
    testSubject <- read.csv("../UCI HAR Dataset/test/subject_test.txt", header=FALSE)
    names(testSubject) <- c("Subject")
    testSubject <- tbl_df(testSubject)
    
    testData <- testSet
    testData$Activity <- testActivity$Activity
    testData$Subject <- testSubject$Subject
    
    testData
}

getTrainingData <- function() {
    print("...Reading training set")
    setData <- read.fwf("../UCI HAR Dataset/train/X_train.txt", rep(16, times=561))
    names(setData) <- getFeatures()
    setData <- tbl_df(setData)

    print("...Reading training activities")
    activityData <- read.csv("../UCI HAR Dataset/train/y_train.txt", header=FALSE)
    names(activityData) <- c("Activity")
    activityData <- tbl_df(activityData)
    
    print("...Reading training subjects")
    subjectData <- read.csv("../UCI HAR Dataset/train/subject_train.txt", header=FALSE)
    names(subjectData) <- c("Subject")
    subjectData <- tbl_df(subjectData)

    trainingData <- setData
    trainingData$Activity <- activityData$Activity
    trainingData$Subject <- subjectData$Subject
    
    trainingData
}

getFeatures <- function() {
    features <- read.csv("../UCI HAR Dataset/features.txt", sep=" ", header=FALSE)
    make.unique(as.vector(features[,2]))
}

getActivityLabels <- function() {
    activityLabels <- read.csv("../UCI HAR Dataset/activity_labels.txt", sep=" ", header=FALSE)
    names(activityLabels) <- c("Id", "Name")
    
    activityLabels
}

getRawData <- function() {
    trainingData <- getTrainingData()
    testData <- getTestData()
    
    rawData <- rbind(trainingData, testData)
}

getNames <- function() {
    c(
        "Subject", "Activity", ##1,2
        
        ## Time domain signals - Mean value
        "Time.Body.Acceleration.Mean.X", "Time.Body.Acceleration.Mean.Y", "Time.Body.Acceleration.Mean.Z", ##3,4,5
        "Time.Gravity.Acceleration.Mean.X", "Time.Gravity.Acceleration.Mean.Y", "Time.Gravity.Acceleration.Mean.Z", ##6,7,8
        "Time.Body.Acceleration.Jerk.Mean.X", "Time.Body.Acceleration.Jerk.Mean.Y", "Time.Body.Acceleration.Jerk.Mean.Z", ##9,10,11
        "Time.Body.Gyro.Mean.X", "Time.Body.Gyro.Mean.Y", "Time.Body.Gyro.Mean.Z", ##12,13,14
        "Time.Body.Gyro.Jerk.Mean.X", "Time.Body.Gyro.Jerk.Mean.Y", "Time.Body.Gyro.Jerk.Mean.Z", ##15,16,17
        "Time.Body.Acceleration.Magnitude.Mean", "Time.Gravity.Acceleration.Magnitude.Mean", "Time.Body.Acceleration.Jerk.Magnitude.Mean", ##18,19,20
        "Time.Body.Gyro.Magnitude.Mean", "Time.Body.Gyro.Jerk.Magnitude.Mean", ##21,22
        
        ## Frequency domain signals - Mean value
        "Frequency.Body.Acceleration.Mean.X", "Frequency.Body.Acceleration.Mean.Y", "Frequency.Body.Acceleration.Mean.Z", ##23,24,25
        "Frequency.Body.Acceleration.Jerk.Mean.X", "Frequency.Body.Acceleration.Jerk.Mean.Y", "Frequency.Body.Acceleration.Jerk.Mean.Z", ##26,27,28
        "Frequency.Body.Gyro.Mean.X", "Frequency.Body.Gyro.Mean.Y", "Frequency.Body.Gyro.Mean.Z", ##29,30,31
        "Frequency.Body.Acceleration.Magnitude.Mean", "Frequency.Body.Body.Acceleration.Jerk.Magnitude.Mean", ##32,33
        "Frequency.Body.Body.Gyro.Magnitude.Mean", "Frequency.Body.Body.Gyro.Jerk.Magnitude.Mean", ##34,35
        
        ## Time domain signals - Standard deviation
        "Time.Body.Acceleration.Std.X", "Time.Body.Acceleration.Std.Y", "Time.Body.Acceleration.Std.Z", ##36,37,38
        "Time.Gravity.Acceleration.Std.X", "Time.Gravity.Acceleration.Std.Y", "Time.Gravity.Acceleration.Std.Z", ##39,40,41
        "Time.Body.Acceleration.Jerk.Std.X", "Time.Body.Acceleration.Jerk.Std.Y", "Time.Body.Acceleration.Jerk.Std.Z", ##42,43,44
        "Time.Body.Gyro.Std.X", "Time.Body.Gyro.Std.Y", "Time.Body.Gyro.Std.Z", ##45,46,47
        "Time.Body.Gyro.Jerk.Std.X", "Time.Body.Gyro.Jerk.Std.Y", "Time.Body.Gyro.Jerk.Std.Z", ##48,49,50
        "Time.Body.Acceleration.Magnitude.Std", "Time.Gravity.Acceleration.Magnitude.Std", "Time.Body.Acceleration.Jerk.Magnitude.Std", ##51,52,53
        "Time.Body.Gyro.Magnitude.Std", "Time.Body.Gyro.Jerk.Magnitude.Std", ##54,55
        
        ## Frequency domain signals - Standard deviation
        "Frequency.Body.Acceleration.Std.X", "Frequency.Body.Acceleration.Std.Y", "Frequency.Body.Acceleration.Std.Z", ##56,57,58
        "Frequency.Body.Acceleration.Jerk.Std.X", "Frequency.Body.Acceleration.Jerk.Std.Y", "Frequency.Body.Acceleration.Jerk.Std.Z", ##59,60,61
        "Frequency.Body.Gyro.Std.X", "Frequency.Body.Gyro.Std.Y", "Frequency.Body.Gyro.Std.Z", ##62,63,64
        "Frequency.Body.Acceleration.Magnitude.Std", "Frequency.Body.Body.Acceleration.Jerk.Magnitude.Std", ##65,66
        "Frequency.Body.Body.Gyro.Magnitude.Std", "Frequency.Body.Body.Gyro.Jerk.Magnitude.Std" ##67,68
    )
}

step1 <- function() {
    print("Running step1...")
    
    if (!exists("rawData") || is.null(rawData))
        rawData <<- getRawData()
    
    rawData
}

step2 <- function() {
    data <- step1()

    print("Running step2...")
    select(data, Subject, Activity, contains("mean()"), contains("std()"))
}

step3 <- function() {
    selectedData <- step2()

    print("Running step3...")
    activityLabels <- getActivityLabels()
    activities <- selectedData$Activity
    selectedData$Activity <- sapply(activities, function(activity) { as.character(activityLabels[activityLabels$Id == activity,]$Name) })
    
    selectedData
}

step4 <- function() {
    data <- step3()

    print("Running step4...")
    names(data) <- getNames()
    data
}

step5 <- function() {
    tidyData <- step4()

    print("Running step5...")
    dataMelt <- melt(tidyData, id.vars=c("Subject", "Activity"))
    meanData <- ddply(dataMelt, .(Subject, Activity), summarise, Mean=mean(value))
    
    write.table(tidyData, file = "../data/tidy_data.txt", row.names=FALSE)
    write.table(meanData, file = "../data/tidy_mean_data.txt", row.names=FALSE)
}

executeAll <- function(reset=FALSE) {
    if (reset)
        rawData <<- NULL

    step5()
}