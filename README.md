# run-analysis
the run_analysis.R is a r script which makes tidy data from the UCI HAR dataset
the dataset is supposed to be placed in a folder named "data cleaning"
there are 2 main functions:-
- create_train_data: to create training data with just mean and standard deviation.
- create_test_data: to create testing data with just mean and standard deviation.

the dataset contains 2 directories named test and train, each of these contains x,y,subject as txt files which are to be read by read.delim

the y and subject files when opened contains a dataframe of only one variable but multiple rows

the x file when opened is a database with just one variable and multiple rows, but each entry is a character type vector

this vector is first broken by splitstr function whenever a " " comes and the empty elements are deleted

all the entries formed after breaking the vector is stored in a list and then added to a new data frame column wise

the data frame is then inverted to make the perfect dataframe with 561 variable and some no. of rows according to the folder they belong to

after this the variables are given names according to the "features" file given in the UCI HAR dataset

out of these variables only the variables with mean and standard deviation are selected for the tidy dataset

in this tidy data frame the y and subject are then added

no. of rows in testing data=2946

no. of rows in training data=7351

training and testing data are then formed of size "7351 * 88" and "2946 * 88" which are the combined by the function rbind()
