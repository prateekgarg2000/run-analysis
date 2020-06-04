library(stringr)
createlist<-function(x,i)
{
  xlist<-strsplit(x=x[i,1]," ")
  xlist<-xlist[[1]][xlist[[1]]!=""]
  xlist
}
create_test_data<-function()
{
  setwd("./data cleaning")
  setwd("./UCI HAR Dataset")
  setwd("./test")
  x_test<-read.delim("x_test.txt")
  test_data<-data.frame(c(1:561))
  for (i in 1:length(x_test[,1]))
  {
    test_data[,i]<-createlist(x_test,i)
  }
  test_data<-t(test_data)
  colnames(test_data)<-features[,1]
  mean_std_cols<-grep("((m|M)ean)|(s|S)td",colnames(test_data))
  newx<-test_data[,mean_std_cols]
  test_data<-newx
  test_subject<-read.delim("subject_test.txt")
  colnames(test_subject)<-"subject"
  y_test<-read.delim("y_test.txt")
  colnames(y_test)<-"y"
  test_data<-cbind(test_data,data.frame(test_subject,y_test))
  setwd(dirname(getwd()))
  setwd(dirname(getwd()))
  setwd(dirname(getwd()))
  test_data
}

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
features<-read.delim("features.txt",header = FALSE)
labels<-read.delim("activity_labels.txt")
setwd(dirname(getwd()))
setwd(dirname(getwd()))
setwd("C:/Users/Prateek/Desktop/run-analysis")
test<-create_test_data()
train<-create_train_data()
tidy_data<-rbind(test,train)
write.table(tidy_data,file = "tidy_data.txt",row.names = FALSE)
