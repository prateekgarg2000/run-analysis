library(stringr)
# function to extract the list of 561 values from x_test and x_train
createlist<-function(x,i)
{
  #splitting whenever a space comes
  xlist<-strsplit(x=x[i,1]," ")
  #there where places with mre than one space thus creating empty entries like this "". thus removing them 
  xlist<-xlist[[1]][xlist[[1]]!=""]
  #returning final list
  xlist
}
create_test_data<-function()
{
  # in my device the testing data is stored in dataset/UCI HAR Dataset/test 
  # you can edit it according to the path to your training set
  setwd("./data cleaning")
  setwd("./UCI HAR Dataset")
  setwd("./test")
  #first creating the dataframe from the data of x_test
  x_test<-read.delim("x_test.txt")
  #empty dataframe with 561 entries because each row of x dataset contains 561 entries
  test_data<-data.frame(c(1:561))
  
  for (i in 1:length(x_test[,1]))
  {
    #each entry in x_test is send to extract a list of 561 values, the returned list is added in the dataframe
    test_data[,i]<-createlist(x_test,i)
  }
  #inverting the dataset to get a dataframe with 561 variables and then naming them according to features
  test_data<-t(test_data)
  colnames(test_data)<-features[,1]
  #mean_std_cols returns a boolian vector to find which columns contains mean and std
  mean_std_cols<-grep("((m|M)ean)|(s|S)td",colnames(test_data))
  #keeping only the variables with mean and std
  test_data<-test_data[,mean_std_cols]
  #reading subject and y and then adding them to the test_data(our final tidy testing data)
  test_subject<-read.delim("subject_test.txt")
  colnames(test_subject)<-"subject"
  y_test<-read.delim("y_test.txt")
  colnames(y_test)<-"y"
  test_data<-cbind(test_data,data.frame(test_subject,y_test))
  setwd(dirname(getwd()))
  setwd(dirname(getwd()))
  setwd(dirname(getwd()))
  #returning the tidy testing data
  test_data
}

#everything is same as done in create_test_data
create_train_data<-function()
{
  setwd("./data cleaning")
  setwd("./UCI HAR Dataset")
  setwd("./train")
  x_train<-read.delim("X_train.txt")
  train_data<-data.frame(c(1:561))
  for (i in 1:length(x_train[,1]))
  {
    train_data[,i]<-createlist(x_train,i)
  }
  train_data<-t(train_data)
  colnames(train_data)<-features[,1]
  mean_std_cols<-grep("((m|M)ean)|(s|S)td",colnames(train_data))
  newx<-train_data[,mean_std_cols]
  train_data<-newx
  train_subject<-read.delim("subject_train.txt")
  colnames(train_subject)<-"subject"
  y_train<-read.delim("y_train.txt")
  colnames(y_train)<-"y"
  train_data<-cbind(train_data,data.frame(train_subject,y_train))
  setwd(dirname(getwd()))
  setwd(dirname(getwd()))
  setwd(dirname(getwd()))
  train_data
}
setwd("./data cleaning")
setwd("./UCI HAR Dataset")
#reading features which contains the 561 variable names of data stored in x_test and x_train
features<-read.delim("features.txt",header = FALSE)
setwd(dirname(getwd()))
setwd(dirname(getwd()))
setwd("C:/Users/Prateek/Desktop/run-analysis")
#creating testing and training data
test<-create_test_data()
train<-create_train_data()
# merging training and testing data and storing it
tidy_data<-rbind(test,train)
write.table(tidy_data,file = "tidy_data.txt",row.names = FALSE)
