library(RMariaDB)
library(dplyr)
library(dbplyr)

connection <- dbConnect(RMariaDB::MariaDB(),
                        dsn="RMaria-connection",
                        Server = "localhost",
                        dbname = "sample_db",
                        user = "root"
)

dbListTables(connection)
dbListFields(connection,"books")

books_data <- dbGetQuery(connection, "SELECT * FROM sample_db.books ORDER BY ID")

glimpse(books_data)
tail(books_data)

books_data <- dbGetQuery(connection, "SELECT title,description FROM sample_db.books")
books_data[c(1:2)]

SqlQuery <- "SELECT title,description FROM sample_db.books"

dataTibble <- as_tibble(dbGetQuery(connection, SqlQuery))
View(dataTibble)
View(books_data)

write.csv(books_data, file = "Books_data.csv", row.names = FALSE)

dbDisconnect(connection)