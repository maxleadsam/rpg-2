complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
  
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
  
    #Return a data frame of the form: 
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the 
    ## number of complete cases
  df <- data.frame("id" = numeric(0),"nobs" = numeric(0), stringsAsFactors = FALSE)
    ## creating the variable df and store an empty data frame which can later be filled
  for(i in seq_along(id))  {
    df_temp <- read.csv(paste(directory,"/",formatC(id[i], width = 3, flag = "0"),".csv", sep = ""))
    ## creating a loop to read through all csv files
    df[i,] <-c(id[i],sum(complete.cases(df_temp)))
    ## filling the empty data frame with id number and number of complete cases by concatenating subset i of id
    ## and the sum of complete cases which is stored in df_temp
  }
  df
  ## returning the data frame
}