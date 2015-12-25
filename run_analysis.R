
createTidyData <- function()
{
  print('STARTED ...')
  library(data.table)
  library(dplyr)
 
  print('Step 1/7 : downloading & unzipping source device data ...')
  dataPath <- downloadAndUnzip()
  if (is.null(dataPath))
    print("*** Error : check downloadAndUnzip()")
  else
  {
    print('Step 2/7 : reading device data ...')
    featureNames <- read.table(file.path(dataPath, "features.txt"), header = FALSE)
    activityLabels <- read.table(file.path(dataPath, "activity_labels.txt"), header = FALSE)
    subjectTRN <- read.table(file.path(dataPath, "train", "subject_train.txt"), header = FALSE)
    activityTRN <- read.table(file.path(dataPath, "train", "y_train.txt"), header = FALSE)
    featuresTRN <- read.table(file.path(dataPath, "train", "X_train.txt"), header = FALSE)
    subjectTST <- read.table(file.path(dataPath, "test", "subject_test.txt"), header = FALSE)
    activityTST <- read.table(file.path(dataPath, "test", "y_test.txt"), header = FALSE)
    featuresTST <- read.table(file.path(dataPath, "test", "X_test.txt"), header = FALSE)
    
    print('Step 3/7 : merging data and defining column names ...')
    subjectALL <- rbind(subjectTRN, subjectTST)
    activityALL <- rbind(activityTRN, activityTST)
    featuresALL <- rbind(featuresTRN, featuresTST)
    
    colnames(featuresALL) <- t(featureNames[2])
    colnames(activityALL) <- "Activity"
    colnames(subjectALL) <- "Subject"
    theCombinedData <- cbind(featuresALL, activityALL, subjectALL)
    
    print('Step 4/7 : extracting the mean and standard deviation fields ...')
    columns_MeanAndSTD <- grep(".*Mean.*|.*Std.*", names(theCombinedData), ignore.case=TRUE)
    reqColumns <- c(columns_MeanAndSTD, 562, 563)
    reqData <- theCombinedData[,reqColumns]
    
    print('Step 5/7 : assigning descriptive activity names ...')
    reqData$Activity <- as.character(reqData$Activity)
    for (i in 1:6)
      reqData$Activity[reqData$Activity == i] <- as.character(activityLabels[i,2])
    reqData$Activity <- as.factor(reqData$Activity)
    
    print('Step 6/7 : adding descriptive column names ...')
    names(reqData)<-gsub("Acc", "Accelerometer", names(reqData))
    names(reqData)<-gsub("Gyro", "Gyroscope", names(reqData))
    names(reqData)<-gsub("BodyBody", "Body", names(reqData))
    names(reqData)<-gsub("Mag", "Magnitude", names(reqData))
    names(reqData)<-gsub("^t", "Time", names(reqData))
    names(reqData)<-gsub("^f", "Frequency", names(reqData))
    names(reqData)<-gsub("tBody", "TimeBody", names(reqData))
    names(reqData)<-gsub("-mean()", "Mean", names(reqData), ignore.case = TRUE)
    names(reqData)<-gsub("-std()", "STD", names(reqData), ignore.case = TRUE)
    names(reqData)<-gsub("-freq()", "Frequency", names(reqData), ignore.case = TRUE)
    names(reqData)<-gsub("angle", "Angle", names(reqData))
    names(reqData)<-gsub("gravity", "Gravity", names(reqData))
    
    print('Step 7/7 : finding average of each variable for each activity and each subject and writing to file ...')
    reqData$Subject <- as.factor(reqData$Subject)
    reqData <- data.table(reqData)
    tidyData <- aggregate(. ~Subject + Activity, reqData, mean)
    tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]
    write.table(tidyData, file = "Tidy.txt", row.names = FALSE)
    
    print('COMPLETED SUCCESSFULLY!')
  }
}

downloadAndUnzip <- function()
{
  if(!file.exists("getdata-projectfiles-UCI HAR Dataset.zip"))  
  {
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, destfile="./getdata-projectfiles-UCI HAR Dataset.zip", method="curl")
  }
  else
  {
    if(!file.exists("./data"))  
      dir.create("./data")
    unzip(zipfile="./getdata-projectfiles-UCI HAR Dataset.zip",exdir="./data")
  }
  
  datapath <- file.path("./data" , "UCI HAR Dataset")
  return (datapath)
}
