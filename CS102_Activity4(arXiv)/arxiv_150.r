library(RMariaDB)
library(dplyr,dbplyr)

#LOAD DATA LOCAL INFILE 'C:/xampp/mysql/data/arxiv/text_mining.csv'  INTO TABLE articles FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;

# Establishing a connection to the database
connection <- dbConnect(RMariaDB::MariaDB(),
                        dsn = "arxiv150",
                        Server = "localhost",
                        dbname = "arxiv",
                        user = "root"
)

#to show tables
dbListTables(connection)
#[1] "articles"

#to show fields
dbListFields(connection, "articles")
#[1] "num"      "Title"    "Author"   "Subject" 
#[5] "Abstract" "Meta" 

arxiv_data<- dbGetQuery(connection, "SELECT * FROM articles")
glimpse(arxiv_data)
#Rows: 150
#Columns: 6
#$ num      <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11…
#$ Title    <chr> "The Sample Average Approximation…
#$ Author   <chr> "Maria Bazotte, Margarida Carvalh…
#$ Subject  <chr> "Optimization and Control (math.O…
#$ Abstract <chr> "Real-world decision-making probl…
#$ Meta     <chr> "Fri, 23 Feb 2024 18:26:16 UTC (8…

#seleted fields of table
arxiv_sel <- dbGetQuery(connection, "SELECT Title, Abstract FROM articles")
arxiv_sel[c(1,2),]
arxiv_sel[c(4,2),]

#getting all data
mysqlQuery <- "SELECT Author, Meta FROM articles"
as_tibble(dbGetQuery(connection, mysqlQuery))
#A tibble: 150 × 2
#Author                                      Meta 
#<chr>                                       <chr>
#1 Maria Bazotte, Margarida Carvalho, Thibaut… Fri,…
#2 U.R. Olimov, U.A. Rozikov                   Fri,…
#3 Joao Domingos Gomes da Silva Junior, Carla… Fri,…
#4 Jiangfu Wang, Huazhong Tang, Kailiang Wu    Fri,…
#5 C?dric Arhancet                             Fri,…
#6 Shengrong Ding, Kailiang Wu                 Fri,…
#7 Juan L. Valerdi                             Fri,…
#8 David Sommer, Robert Gruhlke, Max Kirstein… Fri,…
#9 Amneet Pal Singh Bhalla, Neelesh A. Patank… Fri,…
#10 Qifan Chen, Zheng Sun, Yulong Xing          Fri,…
# ℹ 140 more rows
# ℹ Use `print(n = ...)` to see more rows

#inserting data
query <- "INSERT INTO articles(num, Title, Author, Subject, Abstract, Meta)
          VALUES ('', 'Database Arxiv', 'Lore Faith Sabio', 'R-Databases Integration',
          'Loading and importing csv file using cmd and connect it to database/mysql.', 'March 12, 2024')"

queryResult <- dbSendQuery(connection, query)

dbClearResult(queryResult)

arxiv_update <- dbGetQuery(connection, 'SELECT * FROM
                          articles')
tail(arxiv_update)


arxiv2 <- dbGetQuery(connection, "SELECT Title, Author, Subject, Meta FROM articles")
(arxi2 <- tail(arxiv2, n = 5))
#Title
#147 On the convergence of the graph sequence $left{ C^m(D) \right}_{m=1}^{infty}$ for a multipartite tournament $D$
#  148                               A hybrid iterative method based on MIONet for PDEs: Theory and numerical examples
#149                                                          A multitype Galton-Watson model for rejuvenating cells
#150                                                                 Transport multi-paths with capacity constraints
#151                                                                                                  Database Arxiv
#Author                            Subject
#147       Ji-Hwan Jung, Suh-Ryung Kim, Hyesun Yoon            Combinatorics (math.CO)
#148                           Jun Hu, Pengzhan Jin       Numerical Analysis (math.NA)
#149 Serik Sagitov, Lotta Eriksson, Marija Cvijovic              Probability (math.PR)
#150                       Qinglan Xia, Haotian Sun Optimization and Control (math.OC)
#151                               Lore Faith Sabio            R-Databases Integration
#Meta
#147  Sun, 11 Feb 2024 13:30:24 UTC (19 KB)
#148 Sun, 11 Feb 2024 11:02:25 UTC (432 KB)
#149 Sun, 11 Feb 2024 05:50:39 UTC (234 KB)
#150  Sun, 11 Feb 2024 05:15:46 UTC (21 KB)
#151                         March 12, 2024

write.csv(arxiv_update, file = "arxiv_150.csv", row.names = FALSE)

dbDisconnect(connection)
