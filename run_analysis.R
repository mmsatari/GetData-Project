setwd("d:/tmp/_down/cs/getdata/hw/project1/GetData-Project")
dataset.dir <- "../UCI HAR Dataset/"

# Read label
feature.lables <- read.table(paste(dataset.dir,"features.txt",sep=""),col.names=c("code","label"))
activity.labels<- read.table(paste(dataset.dir,"activity_labels.txt",sep=""),col.names= c("code","label"))

# Read training set 
activities <- read.table(paste(dataset.dir,"train/y_train.txt",sep=""),colClasses="factor",col.names="code")
subjects <- read.table(paste(dataset.dir,"train/subject_train.txt",sep=""),colClasses="factor",col.names=c("code"))

df.train <- read.table(paste(dataset.dir,"train/X_train.txt",sep=""),
                       col.names=(feature.lables$label),
                       colClasses=rep("numeric",nrow(feature.lables)))

## Make activity names descriptive and add subject to the dataframe
activities <- merge(activities,activity.labels)
df.train <- cbind(subjects$code,activities$label,df.train)
names(df.train) <- c("subject","activity",names(df.train)[3:ncol(df.train)])

# Read test set 
activities <- read.table(paste(dataset.dir,"test/y_test.txt",sep=""),colClasses="factor",col.names="code")
subjects <- read.table(paste(dataset.dir,"test/subject_test.txt",sep=""),colClasses="factor",col.names=c("code"))

df.test <- read.table(paste(dataset.dir,"test/X_test.txt",sep=""),
                      col.names=(feature.lables$label),
                      colClasses=rep("numeric",nrow(feature.lables)))

## Make activity names descriptive and add subject to the dataframe
activities <- merge(activities,activity.labels)
df.test <- cbind(subjects$code,activities$label,df.test)
names(df.test) <- c("subject","activity",names(df.test)[3:ncol(df.test)])

# Merge the two datasets together
df.dataset <- rbind(df.train,df.test)

