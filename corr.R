corr <- function(directory, treshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
  
    ## 'treshold' is a numeric vector of length 1 indicating the
    ##  number of completely observed observations (on a;;
    ##  variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations 
    ## NOTE: Do not round the result!
  v_temp <- vector("numeric")
  id <- 1:332
  ## I need a variable ID for all the CSV files that will be consulted. Therefore I create this variable
  for(i in seq_along(id)) {
    df <- read.csv(paste(directory,"/",formatC(id[i], width = 3, flag = "0"),".csv", sep = ""))
    ## creating a loop to read through all csv files
    if(sum(complete.cases(df))> treshold){
    v_temp <- c(v_temp,cor(df[,2],df[,3], use = "complete.obs"))
    }}
    ## if the sum of complete cases exceeds the treshold I want to include them in my function
    v_temp
    ## returning correlation between two variables when cases are complete and complete cases exceed the treshold
}  