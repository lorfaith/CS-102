library(RMariaDB)
library(dplyr)
library(dbplyr)

connection <- dbConnect(RMariaDB::MariaDB(),
                        dbname = "sample_db",
                        username = "root",
                        password = "",
                        host = "localhost"
)

# List tables and fields
dbListTables(connection)
dbListFields(connection, "books")

queries <- c("INSERT INTO books (id,title, author, description, date) 
                VALUES ('1','The Catcher in the Rye', 'J.D. Salinger', 'A novel depicting the struggles of adolescence and the search for identity.', '1951-07-16')",
             "INSERT INTO books (id,title, author, description, date) 
                VALUES ('2','To Kill a Mockingbird', 'Harper Lee', 'A novel set in the American South during the 1930s, dealing with racial injustice and moral growth.', '1960-07-11')",
             "INSERT INTO books (id,title, author, description, date) 
                VALUES ('3','Harry Potter and the Philosopher''s Stone', 'J.K. Rowling', 'The first book in the Harry Potter series, detailing Harry''s discovery of his wizarding heritage.', '1997-06-26')",
             "INSERT INTO books (id,title, author, description, date) 
                VALUES ('4','The Lord of the Rings', 'J.R.R. Tolkien', 'A high fantasy epic following the quest to destroy the One Ring and defeat the Dark Lord Sauron.', '1954-07-29')",
             "INSERT INTO books (id,title, author, description, date) 
                VALUES ('5','Moby-Dick', 'Herman Melville', 'An epic tale of Captain Ahab''s obsessive quest for revenge against the white whale.', '1851-10-18')",
             "INSERT INTO books (id,title, author, description, date) 
                VALUES ('6','Pride and Prejudice', 'Jane Austen', 'A romantic novel set in rural England, exploring themes of love, marriage, and social hierarchy.', '1813-01-28')",
             "INSERT INTO books (id,title, author, description, date) 
                VALUES ('7','The Great Gatsby', 'F. Scott Fitzgerald', 'A novel set in the Jazz Age, portraying the American Dream and its corruption in the pursuit of wealth and status.', '1925-04-10')",
             "INSERT INTO books (id,title, author, description, date) 
                VALUES ('8','1984', 'George Orwell', 'A dystopian novel set in a totalitarian regime, focusing on surveillance, government oppression, and individual freedom.', '1949-06-08')",
             "INSERT INTO books (id,title, author, description, date) 
                VALUES ('9','The Hobbit', 'J.R.R. Tolkien', 'A fantasy novel about the hobbit Bilbo Baggins''s journey to reclaim the treasure guarded by the dragon Smaug.', '1937-09-21')",
             "INSERT INTO books (id,title, author, description, date) 
                VALUES ('10','Alice''s Adventures in Wonderland', 'Lewis Carroll', 'A surreal tale of a young girl named Alice who falls through a rabbit hole into a fantasy world.', '1865-11-26')"
)


# Execute queries
for (query in queries) {
  query_result <- dbSendQuery(connection, query)
  dbClearResult(query_result)
}

# Retrieve data from MySQL
books_data <- dbGetQuery(connection, "SELECT * FROM books")

# Check the columns and its content
glimpse(books_data)

# Write data to a CSV file
write.csv(books_data, file = "Books_data.csv", row.names = FALSE)

# Disconnect from the database
dbDisconnect(connection)
