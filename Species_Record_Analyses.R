#Set working directory to project file.  This code may need to be customized
setwd("C:/Users/Mariah/CSB/Scott_Quarter_Project/Mussel_Project/")

#import needed libraries and install packages
install.packages("tidyverse")
library(tidyverse)
install.packages("RgoogleMaps")
library(RgoogleMaps)

#Get a list of the cleaned data files
setwd("Cleaned_Files/")
list_files <- dir(pattern = "*.csv") # creates the list of all the csv files in the directory
list_files #confirm the code worked properly

#Write a function to determine the top five museums, 
#in terms of the number of the desired specimens they hold
get_top_museums <- function(file){
  f <- read.csv2(file, header = TRUE, sep = ",")
  #count number of specimens from a given institution
  institutions <- aggregate(as.integer(f$individual_count), 
                            by=list(Category = f$institution_code),
                            FUN = sum)
  colnames(institutions) <- c("institution_code", "number_of_specimens")
  top_institutions <- institutions[with(institutions, order(-number_of_specimens)),] %>% head(5)
  return(top_institutions)
}

##For each file, determine the top five museums, 
#in terms of the number of the desired specimens they hold
#save these names in a data frame for later comparisons
top_museums <- data.frame(matrix(0, ncol = 6, nrow = length(list_files)))
x <- c("file", "museum1", "museum2", "museum3", "museum4", "museum5")
colnames(top_museums) <- x
for (k in 1:length(list_files)){
  print(list_files[k])
  print(get_top_museums(list_files[k]))
  top_museums[k, 1] <- list_files[k]
  top_museums[k, 2:6] <- get_top_museums(list_files[k])$institution_code
}
#Array to visualize the top five institutions for each file
top_museums
# The identity of institution codes can be looked up 
#at http://grbio.org/find-biorepositories

#Create function list that takes a file name and institution code and makes a catalog list
#The default is the first list_files and the Field Museum of Natural History
get_catalog_numbers <- function(file = list_files[1], institution = "fmnh"){ 
  f <- read.csv2(file, header = TRUE, sep = ",")
  #get catalog numbers from a given institution
  catalog_numbers <- subset(f, institution_code == institution)
  return(catalog_numbers)
}
#Input file and institution code example
get_catalog_numbers(file = list_files[1], institution = "usnm")
catalog_numbers
