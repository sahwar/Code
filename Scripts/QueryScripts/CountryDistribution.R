source("/Users/ricardocunha/Documents/FEUP/5ano/MSc\ Thesis/Thesis/Code/Scripts/Utils/mainBody.R")

countries <- vector()
countriesValues <- vector()
nTotalQueries <- 0
counter <- 0


parseString <- function(str){
  #print the 10 cities with most queries
  if(counter == 0){
    nTotalQueries <<- as.integer(str)
    counter <<- counter+1
  } else {
    #  print(str)
    aCountry <- strsplit(str, separator)
    countries <<- append(countries, aCountry[[1]][1])
    countriesValues <<- append(countriesValues, as.integer(aCountry[[1]][2]))
  }
  
}

printResults <- function(filename){
  i<-1
  write("QUERIES PER COUNTRY", file=filename, append=FALSE)
  write(paste("Total number of queries(not empty)",nTotalQueries,sep=": "), file=filename, append=TRUE)
  while(i<=length(countries)){
    write(paste(countries[i],paste(countriesValues[i],percent(countriesValues[i]/nTotalQueries),sep=" -> "),sep=":"),
          file=filename,append=TRUE)
    i <- i+1
  }
  
}

main <- function(){
  readFromStdin()
  filename <- paste(outputPath,"CountryDistribution.txt", sep = "/")
  printResults(filename)
}

main();