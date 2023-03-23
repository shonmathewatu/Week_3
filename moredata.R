new_managers_data <- read.csv("MoreData.csv")
new_managers_data

#structure of datatset
str(new_managers_data)


managers_data <- read.csv("managers.csv")
managers_data

#structure of datatset
str(managers_data)

#heading of datasets

names(managers_data)

names(new_managers_data)

# creating df with column in common

#alternate Include list
#include_list <- new_managers_data[c(6,3,4,8,9,10,11,12)]
#include_list


include_list <- new_managers_data[c("Date","Country","Gender","Age", "Q1", "Q2", "Q3", "Q4", "Q5")]

include_list


#merging two dfs

names(managers_data)
names(include_list)


str(managers_data)
str(include_list)

# if date format is different 
date_format <- "%m/%d/%Y"
new_date_format <- "%d/%m/%Y"
formatted_date <- format(as.Date(include_list$Date, format= date_format),new_date_format)
formatted_date

class(formatted_date)


formatted_date <- as.Date(include_list$Date, format = "%m/%d/%Y")
formatted_date

include_list$Date = formatted_date
str(include_list)

attach(include_list)
include_list$AgeCat[Age < 25] <- "young"
include_list$AgeCat[Age > 45] <- "Elder"
include_list$AgeCat[Age > 25 & Age <=  45] <- "Middle Aged"
include_list$AgeCat[is.na(Age)] <- "Elder"


include_list

managers_formatted_date <- as.Date(managers_data$Date, format = "%m/%d/%y")
managers_formatted_date

managers_data$Date = managers_formatted_date
attach(managers_data)
managers_data$AgeCat[Age < 25] <- "young"
managers_data$AgeCat[Age > 45] <- "Elder"
managers_data$AgeCat[Age > 25 & Age <=  45] <- "Middle Aged"
managers_data$AgeCat[is.na(Age)] <- "Elder"


managers_data


managers_data <- managers_data[c(2:11)]
managers_data

managers_data <- rbind(managers_data,include_list)
write.csv(managers_data, "combined managers Data")
