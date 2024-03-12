library(RMariaDB)

# Establishing a connection to the database
connection <- dbConnect(RMariaDB::MariaDB(),
                        dsn = "RMaria-connection",
                        Server = "localhost",
                        dbname = "sample_db",
                        user = "root"
)

# Define and execute each SQL query
queries <- c(
  "INSERT INTO moviereviews (title, reviewer, date_of_review, rating, title_of_review, review)
     VALUES('Titanic', 'TaylorYee94', '2020-09-02', '10.0',
            'How many times I watch this movie', 
            'I have watched Titanic how many times I don''t know. Everytime I watch it, I still cry, laugh, smile, and feel. The story flows with tension throughout the movie; two actors'' acting and chemistry need applaud; Sinking ship is realistically filmed; ''My Heart Will Go On'' is perfect fit for Jack and Roses'' love story and is timeless as well. All the movie''s factors are fully qualified. What more can I say? It is the masterpiece.'
     )",
  
  "INSERT INTO moviereviews (title, reviewer, date_of_review, rating, title_of_review, review)
      VALUES('Titanic', 'paulclaassen', '2018-07-03', '10.0',
             'Despite a lot of plot flaws and conveniences, this really is one of the best films ever made.',
             'Ah, yes, the film that propelled Leonardi DiCapro to super stardom, became the first film to gross $1 billion, and stayed on the top of the box office charts for 12 years (only to be kicked off the top by another James Cameron film, Avatar).'
      )",
  
  "INSERT INTO moviereviews (title, reviewer, date_of_review, rating, title_of_review, review)
      VALUES('Titanic', 'Marshall-D-Teach', '2020-02-23', '10.0', 'Great',
             'Very beautiful and cinematic movie with lots of classic scenes. Also extremely sad at times'
      )",
  
  "INSERT INTO moviereviews (title, reviewer, date_of_review, rating, title_of_review, review)
      VALUES('Titanic', 'Boyo-2', '1998-12-11', '10.0', 'One of a Kind', 
             'To all the miserable people who have done everything from complain about the dialogue, the budget, the this and the that....who wants to hear it? IF you missed the point of this beyond-beautiful movie'
      )",
  
  "INSERT INTO moviereviews (title, reviewer, date_of_review, rating, title_of_review, review)
      VALUES('Titanic', 'sddavis63', '2002-11-16', '9.0', 'A Superb Epic',
             'I avoided watching this film for the longest time. Long before it was even released I had dismissed it as an over-hyped, over-blown, overly romanticized piece of Hollywood schmaltz, and I wanted nothing to do with it. I never watched it in the theatre. I shook my head in disbelief at the 11 Academy Awards - even though I had never seen it.'
      )",
  
  "INSERT INTO moviereviews (title, reviewer, date_of_review, rating, title_of_review, review)
      VALUES('Titanic', 'Kingslaay', '2017-05-12', '10.0', 'Timeless',
             'Titanic is a true masterpiece and is easily one of the greatest films in history. James Cameron has outdone himself with this epic film that is clearly one for the ages. It is perfect in almost every way and can be watched over and over again.'
      )",
  
  "INSERT INTO moviereviews (title, reviewer, date_of_review, rating, title_of_review, review)
      VALUES('Titanic', 'Rage-4', '1998-08-09', '10.0', 'Bravo',
             'Firstly and foremostly, I am a guy, which (in most cases) means I did not go see Titanic to see DiCaprio...although I think he can be a great actor. Reading through earlier comments, i grew a bit weary of hearing about lame script and shallow characters. I went to see a ship sink...the plot and the characters were, at least to me, a kind of icing on the Cake.'
      )",
  
  "INSERT INTO moviereviews (title, reviewer, date_of_review, rating, title_of_review, review)
      VALUES('Titanic','shenhanyu_ww', '2023-03-31', '10.0', 'Brilliant', 
             '7.9????This should be at least 8.9!!!!!!!!!'
      )",
  
  "INSERT INTO moviereviews (title, reviewer, date_of_review, rating, title_of_review, review)
      VALUES('Titanic', 'alexanderliljefors', '2023-02-23', '10.0', 'GREATEST EVER!', 
             'MY ALL TIME FAVOURITE! THIS IS A BEAUTIFUL MASTERPIECE!'
      )",
  
  "INSERT INTO moviereviews (title, reviewer, date_of_review, rating, title_of_review, review)
      VALUES('Titanic', 'edit-53160', '2023-03-15', '10.0', 'Will never let go..',
             'For me this movie has the same power as music. That chapter in your life that you remember where you were when it came out, and the memories that come with it. For me Titanic is an experience not just a movie.'
      )"
)

# Execute each query
for (query in queries) {
  dbSendQuery(connection, query)
}

# Retrieve data from the table
reviewData <- dbGetQuery(connection, "SELECT * FROM moviereviews")

# Display the structure of the retrieved data
glimpse(reviewData)

# Write data to a CSV file
write.csv(reviewData, file = "movieReviews_Data.csv", row.names = FALSE)

# Disconnect from the database
dbDisconnect(connection)

