pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  v_temp <- vector("numeric")
  if(pollutant == "sulfate") {
    n=2
  }
  else {
    n=3
  }
  ## Defined an empty vector in which we can store pollutant values
  for(i in seq_along(id)) {
    df <- read.csv(paste(directory,"/",formatC(id[i], width = 3, flag = "0"),".csv", sep = ""))
    ## creating a loop to read through all csv files
    v_temp <- c(v_temp,df[,n])
  }
  ## concatenate vtemp with a subset of n column from all csv's
  
  mean(v_temp, na.rm = TRUE)
  ## last expression used is the mean from which NA's are removed
}