#A.Load the built-in warpbreaks
warpbreaks

#1.Find out, in a single command, which columns of warpbreaks are either numeric or integer
warp_numeric <- sapply(warpbreaks, is.numeric)

#2.Is numeric a natural data type for the columns which are stored as such? Convert to integer when necessary.
#Answer: Yes,numeric a natural data type for the columns.Converting columns to integer data type is okay if the values are whole numbers.

warp_integer <- sapply(warpbreaks, is.integer)
warpbreaks[, warp_integer] <- lapply(warpbreaks[, warp_integer], as.integer)

#3.Error messages in R sometimes report the underlying type of an object rather than the
#user-level class. Derive from the following code and error message what the underlying type.

x <- "Lore"
y <- 10
z <- x + y

#Eror in x+y:non-numeric argument to binary operator
#It is error because we can't add the character vector and numeric vector

#B.Load the exampleFile.txt
#1.Read the complete file using readLines

example_file <- readLines("exampleFile.txt")

#2.Separate the vector of lines into a vector containing comments and a vector containing the data. Hint: use grepl.
comments <- example_file[grepl("^", example_file)]
data <- example_file[grepl("^", example_file)]

#3.Extract the date from the first comment line.
date <- sub("^ Date: ", "", comments[1])

#4a.Read the data into a matrix as follows.Split the character vectors in the vector containing data lines by semicolon (;) using strsplit.
splitData <- strsplit(data, ";")

#b.Find the maximum number of fields retrieved by split. Append rows that are shorter with NA's.
maxFields <- max(sapply(splitData, length))

#append
maxFields <- max(sapply(splitData, length))

splitData <- lapply(splitData, function(x) {
  if (length(x) < maxFields) {
    x <- c(x, rep(NA, maxFields - length(x)))
  }
  return(x)
})

print(splitData)

#c.Use unlist and matrix to transform the data to row-column format.
data_matrix <- matrix(unlist(splitData), ncol = maxFields, byrow = TRUE)

#d.From comment lines 2-4, extract the names of the fields. Set these as colnames for the matrix you just created.
name_field <- sapply(comments[2:4], function(x) sub("^ ", "", x))

colnames(data_matrix) <- name_field

View(name_field)
