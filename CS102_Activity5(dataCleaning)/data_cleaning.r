library(readxl)
library(lubridate)
library(dplyr)

cleaned_movieData <- read_excel("scrape3000reviews.xlsx")
cleaned_movieData

str(cleaned_movieData)


#cleaned dates
cleaned_movieData$Date <- dmy(cleaned_movieData$Date)
as.POSIXct.Date(cleaned_movieData$Date, format = "%d-%m-&Y")

#lowerCase
cleaned_movieData$Title <- tolower (cleaned_movieData$Title)
cleaned_movieData$Username <- tolower (cleaned_movieData$Username)
cleaned_movieData$Content <- tolower (cleaned_movieData$Content)
cleaned_movieData$Date <- tolower (cleaned_movieData$Date)

#average of null values
cleaned_movieData$Stars <- as.numeric(gsub("/.*", "", cleaned_movieData$Stars))
cleaned_movieData$Stars <- ifelse(is.na(cleaned_movieData$Stars),mean(cleaned_movieData$Stars, na.rm=TRUE), cleaned_movieData$Stars)

cleaned_movieData

write.csv(cleaned_movieData, file = "cleaned_movieData.csv")