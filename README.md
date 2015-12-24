Coursera : Getting and Cleaning Data : Project
---------------------------------------------------------------

##Goal

Companies like *FitBit, Nike,* and *Jawbone Up* are racing to develop the most advanced algorithms to attract new users. The data linked are collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained:  

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The data is available at:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The aim of the project is to clean and extract usable data from the above zip file. R script called run_analysis.R that does the following:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In this repository, you find:

- *run_analysis.R* : the code for consuming the data and running the analysis

- *Tidy.txt* : the required extracted and cleaned data from the source device data using the code in *run_analysis.R*

- *CodeBook.md* : the CodeBook for the variables in *Tidy.txt*

- *README.md* : the analysis and explanation of the analysis performed on the data


## Getting Started

### Data Source
- The R code in *run_analysis.R* will look for the file *getdata-projectfiles-UCI HAR Dataset.zip* in the current working directory.
- If not found it will download the zip file available at <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>
- And then the contents will be extracted for usage

### Libraries Used

- `data.table` have been used for handling the large data set
- `dplyr` have been used to aggregate variables to create the tidy data

```{r, message=FALSE}
library(data.table)
library(dplyr)
```


## Read data

### Read metadata

The supporting metadata are read and loaded into variables `featureNames` and `activityLabels`.
```{r}
featureNames <- read.table(file.path(dataPath, "features.txt"), header = FALSE)
activityLabels <- read.table(file.path(dataPath, "activity_labels.txt"), header = FALSE)
```

The training and test data sets are split up into subject, activity and features. They are present in three different files. 

### Read training data
```{r}
subjectTRN <- read.table(file.path(dataPath, "train", "subject_train.txt"), header = FALSE)
activityTRN <- read.table(file.path(dataPath, "train", "y_train.txt"), header = FALSE)
featuresTRN <- read.table(file.path(dataPath, "train", "X_train.txt"), header = FALSE)
```

### Read test data
```{r}
subjectTST <- read.table(file.path(dataPath, "test", "subject_test.txt"), header = FALSE)
activityTST <- read.table(file.path(dataPath, "test", "y_test.txt"), header = FALSE)
featuresTST <- read.table(file.path(dataPath, "test", "X_test.txt"), header = FALSE)
```


## Analysis 

### I - Merge the training and the test data sets
```{r}
subjectALL <- rbind(subjectTRN, subjectTST)
activityALL <- rbind(activityTRN, activityTST)
featuresALL <- rbind(featuresTRN, featuresTST)
```

### II - Naming the columns
The columns in the combined features data set is named from the metadata in `featureNames`
```{r}
colnames(featuresALL) <- t(featureNames[2])
```

### III - Merging the data
The data in `featuresALL`,`activityALL` and `subjectALL` are merged and the complete data is now stored in `theCombinedData`.
```{r}
colnames(activityALL) <- "Activity"
colnames(subjectALL) <- "Subject"
theCombinedData <- cbind(featuresALL, activityALL, subjectALL)
```

### IV - Extracts only the measurements on the mean and standard deviation for each measurement
Extract the column indices that have either mean or std in them.
```{r}
columns_MeanAndSTD <- grep(".*Mean.*|.*Std.*", names(theCombinedData), ignore.case=TRUE)
```

### V - Add activity and subject columns to the list 
```{r}
reqColumns <- c(columns_MeanAndSTD, 562, 563)
```

### VI - Create `reqData` with the selected columns in `reqColumns` 
```{r}
reqData <- theCombinedData[,reqColumns]
```

### VII - Uses descriptive activity names to name the activities in the data set
```{r}
reqData$Activity <- as.character(reqData$Activity)
for (i in 1:6)
    reqData$Activity[reqData$Activity == i] <- as.character(activityLabels[i,2])
```

### VIII - Factoring the `activity` variable, once the activity names are updated
```{r}
reqData$Activity <- as.factor(reqData$Activity)
```

### IX - Adding descriptive column names 
The following acronyms are replaced in `reqData`
- `Acc` can be replaced with Accelerometer
- `Gyro` can be replaced with Gyroscope
- `BodyBody` can be replaced with Body
- `Mag` can be replaced with Magnitude
- Character `f` can be replaced with Frequency
- Character `t` can be replaced with Time

```{r}
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
```

### X - From the previous data set we create a data set with the average of each variable for each activity and each subject
We will use `Subject` as the first factor variable
```{r}
reqData$Subject <- as.factor(reqData$Subject)
reqData <- data.table(reqData)
```

### XI - Creating the final data set
We create the final `tidyData` as a data set with average for each activity and subject. Then, the data is ordered in `tidyData` and we write it to the data file `Tidy.txt` with the final data
```{r}
tidyData <- aggregate(. ~Subject + Activity, reqData, mean)
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]
write.table(tidyData, file = "Tidy.txt", row.names = FALSE)
```
