managers_data <- read.csv("managers.csv")
managers_data
str

new_sample <- managers_data[sample(1:nrow(managers_data),4, replace = FALSE),]


new_sample

new_sample <- managers_data[sample(1:nrow(managers_data),8, replace = TRUE),]


new_sample


#sort the managers data in the order of age


age_order <- managers_data[order(managers_data$Age),]
age_order
    
gender_order <- managers_data[order(managers_data$Gender),]
gender_order

gender_Age_order <- managers_data[order(gender_order$Gender),]
gender_Age_order

attach(managers_data)
age_gender_sort <- managers_data[order(Gender,Age),]
age_gender_sort

detach(managers_data)
write.csv(age_gender_sort, "sorted_managers_Data")


new_data <- managers_data[order(Gender,Age),]
new_data


split_data <- subset(managers_data, select = c(Age,Q1))
split_data


