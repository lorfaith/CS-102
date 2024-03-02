library(rvest)
library(dplyr)
library(writexl)
library(polite)

session <- bow(url = 'https://www.imdb.com/title/tt0120338/reviews?ref_=tt_urv',
               user_agent = "Educational")
session

session_scrape <- scrape(session)

scrapeReviews <- function(page_url) {
  page <- read_html(page_url)
  
  names <- page %>% html_nodes(".display-name-link") %>% html_text()
  dates <- page %>% html_nodes("span.review-date") %>% html_text()
  ratings <- page %>% html_nodes("span.rating-other-user-rating") %>% html_text()
  content_reviews <- page %>% html_nodes("a.title") %>% html_text()
  reviews <- page %>% html_nodes(".text.show-more__control") %>% html_text()
  
  phantom_thread_df = data.frame(
    Name = names[1:25],
    Date = dates[1:25],
    User_Rating = ratings[1:25],
    Content_Review = content_reviews[1:25],
    Reviews = reviews[1:25]
  )
}

titanic_urls<- c('https://www.imdb.com/title/tt0120338/reviews?ref_=tt_urv',
                 'https://www.imdb.com/title/tt0120338/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnruqls4qab22mndd4pkalep6vd5pjt6uds2oyyvxpzlb4dzzauudfic4djuva3jdcmjcoiqm',
                 'https://www.imdb.com/title/tt0120338/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnzvr7rmqary3ekdx6xpb3b7evd5pjt6uds4om2vvnjob4d6sizcxotukxlowedjtfgimac32',
                 'https://www.imdb.com/title/tt0120338/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbyrhrmyabs2modz67jahbpytttfjrkidc5o43fjmzyoanberaloqcmazjpjgxb6nbahioa',
                 'https://www.imdb.com/title/tt0120338/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnburdtm4ab43yptr67latcpqvt5pjt6ucc4pe2f7nznb4d557oz66pk24a65p2sajociq4yg',
                 'https://www.imdb.com/title/tt0120338/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbtrhsmocj73yodb67ib3b72tttfjrkybctpa4v7mjyoc55pnraajqg3rbg5ixyl7exz5fq',
                 'https://www.imdb.com/title/tt0120338/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnbrqps4wart3iotd6hpahe7yud5pjt6ubkto4yvznjnb4dyt3itbfqbgwcpay5mw3kb22nhe',
                 'https://www.imdb.com/title/tt0120338/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjyr3tmqcj72mmtz67jb7a7uvteoq366ssypayv3mzpcv4k4zo5bs5nat45f3me2bj364qj5gq',
                 'https://www.imdb.com/title/tt0120338/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjzrxqmyazs3qmdv4hkatd7ww35pjt6udk7om3vlnzpb4dz7tm74m3ssb4pt57jacrilvyb6',
                 'https://www.imdb.com/title/tt0120338/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjwrdumycby3iotx7hfaxdpsu3coq366sszoy4v7prld54k5gxgdlaam7367jpc67s4dfetk7i',
                 'https://www.imdb.com/title/tt0120338/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjxr3smsazz3qkdx77pape7qudeoq366ss3oqzfxmjkdv4k54wtu6em74mp3n3l64ug6d6uu3i',
                 'https://www.imdb.com/title/tt0120338/reviews/_ajax?&paginationKey=g4w6ddbmqyzdo6ic4oxwjnjur7s4ycj62mnd76pnalepww3hoq366ss6oq2vlnridb4k5ppgo3zzl236k7pbn3uz6vdsquy'
)

allReviews <- lapply(titanic_urls, scrapeReviews) 

movieReviews <- do.call(rbind, allReviews) 

View(movieReviews)

write_xlsx(movieReviews, "scrape300reviews.xlsx")