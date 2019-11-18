#### GaCD Week 4 Assignment ####

## Method to collate and produce a tidy data table from the UCI HAR dataset

setwd("C:/Coursera/Data_Science/Getting_Cleaning_Data/UCI HAR Dataset")

#### R version ####
# R 3.6.1
#### Libraries ####
library(dplyr)


########################## Read in data ############################
## feature names
feature_names <- read.table("features.txt")
colnames(feature_names) <- c("colindex", "features")

## test data
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/Y_test.txt")
subject_test <- read.table("test/subject_test.txt")

## training data
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/Y_train.txt")
subject_train <- read.table("train/subject_train.txt")


################ 1. Merge Training and Test data ###################
## Combine test, train and subject by rows
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

## Assign feature names
colnames(x_data) <- feature_names$features
colnames(y_data) <- c("activity")
colnames(subject_data) <- c("subject")

## Combine columns to create full data set
## Note: this step assumes the order of the original data is consistent across all tables
fulldata <- cbind(subject_data, y_data, x_data)


######## 2. Extract Mean and Standard Deviation Measurements ########
fulldata <- fulldata[,grep("subject|activity|mean|std", names(fulldata))]
    # I have chosen to retain 'meanFreq' fields - to remove run the below regex
    # grep("mean\\(\\)|std\\(\\)", names(fulldata))


########### 3. Use Descriptive Names for the Activities #############
## Read activity labels
labels <- read.table("activity_labels.txt", col.names = c("index", "activityname"))

## Apply activity names
fulldata <- fulldata %>% 
    inner_join(labels, by = c("activity" = "index")) %>%
    mutate(activity = activityname)
## Remove the duplicate activityname
fulldata <- fulldata[, -c(82)]


############## 4. Apply descriptive variable names ##################
## Check existing names
unique(names(fulldata))

## Assign new names based on information in the 'features_info.txt' file
names(fulldata)<-gsub("^t", "time", names(fulldata))            #prefix t
names(fulldata)<-gsub("^f", "frequency", names(fulldata))       #prefix f
names(fulldata)<-gsub("Acc", "Accelerometer", names(fulldata))
names(fulldata)<-gsub("Gyro", "Gyroscope", names(fulldata))
names(fulldata)<-gsub("Mag", "Magnitude", names(fulldata))
names(fulldata)<-gsub("BodyBody", "Body", names(fulldata))      #remove duplication


##################### 5. Create tidy data set #######################
## Agregates over subject and activity
tidydata <- aggregate(. ~subject + activity, fulldata, mean)
tidydata <- tidydata[order(tidydata$subject, tidydata$activity),]
write.table(tidydata, file = "tidydata.txt", row.name=FALSE)


###### Make codebook ######
## Uses the dataMaid 
library(dataMaid)
makeCodebook(tidydata)








