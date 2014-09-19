
##functions to gather and clean a dataset
createTextfile<- function(dataframe,newfilename) {
      ##converts the dataframe into a text file
      setwd("C:/Users/Sherry/Google Drive/R Programming/Getting and Cleaning Data/Project")
      write.table(dataframe,newfilename,row.names=FALSE)
}
readLabels<-function(filepath){
      ## Creates datasets for the row and column labels
      setwd(filepath)
      columnlabels <<-read.table("columns.txt",header=FALSE)
      rowlabels <<-read.table("rows.txt",header=FALSE)
      colnames(rowlabels)<-c("activity","action")
}

cleanTables<-function(filepath){
      ## reads and merges all .txt files from the
      ## working directory, also reads labels and merges with the dataframe
      
      setwd(filepath)
      files<-list.files(pattern=".txt")
      data<- do.call(cbind,lapply(c(files),
                                  function(fn) read.table(fn, header=FALSE))) 
      colnames(data)<- columnlabels[,2]
      data<-data[,c(ncol(data)-1,ncol(data),3:ncol(data))]
      colnames(data)[c(1,2)]<-c("subject","activity")
      data<-data[order(data[,2]),]
      labels<-makeActivityLabels(filepath)
      data<-cbind(labels[,2],data)
      data<-data[,c(2,1,3:ncol(data))]
      colnames(data)[2]<-"activityname"
      return(data)
      
}

makeActivityLabels<- function(filepath) {
      ##merges the activity names with the activities of the dataframe
      setwd(filepath)
      activities<-read.table("3activities.txt",header=FALSE)
      activities<-merge(activities,rowlabels)
      return(activities)
}

mergeDatasets<- function(file1,file2) {
      ##combines rows of two dataframes
      DFMerged<-rbind(file1,file2)
      return(DFMerged)      
}

extractMeanandStd<- function(dataset) {
      #extracts the mean and standard deviation columns
      #from the merged dataset      
      mean<-dataset[,c(2,1,grep("mean\\()",names(dataset)))]
      std<-dataset[,c(2,1,grep("std\\()",names(dataset)))]
      meanstd <- cbind(mean,std[,-(1:2)])
      return(meanstd)
}

##Steps to get and clean data and produce a text file according to specifications.
 
# 1.Merges the training and the test sets to create one data set.
# 3.Uses descriptive activity names to name the activities in the data set
## Step 3 is handled within the cleanTables function during Step 1
      readLabels("C:/Users/Sherry/Google Drive/R Programming/Getting and Cleaning Data/Project/dataset/headers")
      train<-cleanTables("C:/Users/Sherry/Google Drive/R Programming/Getting and Cleaning Data/Project/dataset/train")
      test<-cleanTables("C:/Users/Sherry/Google Drive/R Programming/Getting and Cleaning Data/Project/dataset/test")
      merged<-mergeDatasets(train,test)

# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
      data<-extractMeanandStd(merged)
      data<-aggregate(data[,-c(1,2)],list(data$subject,data$activity),mean)
      colnames(data)[c(1,2)]<-c("subject","activities")

# 4.Appropriately labels the data set with descriptive variable names. 
##Since these steps are specific to the dataset, did not create function for
##these steps.
      colnames(data)[[2]]<-"activity"  #renamed this column to keep dataset uniform
      colnames(data)<-sub("tBody","Time-of-Body-",names(data))
      colnames(data)<-sub("fBody","Frequency-of-Body-",names(data))
      colnames(data)<-sub("tGravity","Time-of-Gravity-",names(data))
      colnames(data)<-sub("Acc","accelation-",names(data))
      colnames(data)<-sub("Gyro","angular-velocity-", names(data))
      colnames(data)<-sub("\\-mean\\()","mean",names(data))
      colnames(data)<-sub("\\-X", "-axial-direction-X",names(data))
      colnames(data)<-sub("\\-Y", "-axial-direction-Y",names(data))
      colnames(data)<-sub("\\-Z", "-axial-direction-Z",names(data))
      colnames(data)<-sub("Jerk","jerk-signals-",names(data))
      colnames(data)<-sub("Mag","magnitude-",names(data))
      colnames(data)<-sub("\\-std\\()","standard-deviation",names(data))

# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
      createTextfile(data,"Project.txt")




