library(rvest)
library(httr)
library(dplyr)
library(polite)


scrapeReviews <- function(url) {
  movieReviews <- read_html(url)

#title
movieReviews %>%
  html_nodes('.title') %>%
  html_text() -> title

#username
movieReviews %>%
  html_nodes('.display-name-link') %>%
  html_text() -> username

#content
movieReviews %>%
  html_nodes('.content') %>%
  html_text() -> content

#date
movieReviews %>%
  html_nodes('.review-date') %>%
  html_text() -> date

#stars
movieReviews %>%
  html_nodes('.rating-other-user-rating') %>%
  html_text() -> stars


cat("Title: ", length(title), "\n")
cat("Username: ", length(username), "\n")
cat("Content: ", length(content), "\n")
cat("Date: ", length(date), "\n")
cat("Stars: ", length(stars), "\n")
#cat("Metascore: ", length(metascore),"\n")

minLength<- min(length(title), length(username), length(content), length(date), length(stars))


movie_reviews <- data.frame (
  Title = title[1:minLength],
  Username = username[1:minLength],
  Content = content[1:minLength],
  Date = date[1:minLength],
  Stars = stars[1:minLength],
  stringsAsFactors = FALSE
)

return(movie_reviews)
}

url1 <- 'https://www.imdb.com/title/tt0120338/reviews?ref_=tt_urv'
target_reviews <- 300
movieReview1 <- data.frame()

page <- 1
while (nrow(movieReview1) < target_reviews) {
  url <- paste0(url1, page)
  reviewsPage <- scrapeReviews(url)
  movieReview1 <- bind_rows(movieReview1, reviewsPage)
  page <- page + 1
}
movieReview1 <- movieReview1[1:target_reviews, ]

cat("Number of scraped reviews: ", nrow( movieReview1), "\n")
View( movieReview1)


#2ND MOVIE(Wonka)
scrapeReviews2 <- function(url) {
  movie2Reviews <- read_html(url)
  
  #title
  movie2Reviews %>%
    html_nodes('.title') %>%
    html_text() -> title
  
  #username
  movie2Reviews %>%
    html_nodes('.display-name-link') %>%
    html_text() -> username
  
  #content
  movie2Reviews %>%
    html_nodes('.content') %>%
    html_text() -> content
  
  #date
  movie2Reviews %>%
    html_nodes('.review-date') %>%
    html_text() -> date
  
  #stars
  movie2Reviews %>%
    html_nodes('.rating-other-user-rating') %>%
    html_text() -> stars
  
  
  cat("Title: ", length(title), "\n")
  cat("Username: ", length(username), "\n")
  cat("Content: ", length(content), "\n")
  cat("Date: ", length(date), "\n")
  cat("Stars: ", length(stars), "\n")
  #cat("Metascore: ", length(metascore),"\n")
  
  minLength<- min(length(title), length(username), length(content), length(date), length(stars))
  
  
  movie_reviews2 <- data.frame (
    Title = title[1:minLength],
    Username = username[1:minLength],
    Content = content[1:minLength],
    Date = date[1:minLength],
    Stars = stars[1:minLength],
    stringsAsFactors = FALSE
  )
  
  return(movie_reviews2)
}

url1 <- 'https://www.imdb.com/title/tt6166392/reviews?ref_=tt_urv'
target_reviews <- 300
movieReview2 <- data.frame()

page <- 1
while (nrow(movieReview2) < target_reviews) {
  url <- paste0(url1, page)
  reviewsPage <- scrapeReviews2(url)
  movieReview2 <- bind_rows(movieReview2, reviewsPage)
  page <- page + 1
}
movieReview2 <- movieReview2[1:target_reviews, ]

cat("Number of scraped reviews: ", nrow( movieReview2), "\n")
View( movieReview2)

  
#3RD MOVIE(The Shawshank Redemption)
scrapeReviews3 <- function(url) {
  movie3Reviews <- read_html(url)
  
  #title
  movie3Reviews %>%
    html_nodes('.title') %>%
    html_text() -> title
  
  #username
  movie3Reviews %>%
    html_nodes('.display-name-link') %>%
    html_text() -> username
  
  #content
  movie3Reviews %>%
    html_nodes('.content') %>%
    html_text() -> content
  
  #date
  movie3Reviews %>%
    html_nodes('.review-date') %>%
    html_text() -> date
  
  #stars
  movie3Reviews %>%
    html_nodes('.rating-other-user-rating') %>%
    html_text() -> stars
  
  
  cat("Title: ", length(title), "\n")
  cat("Username: ", length(username), "\n")
  cat("Content: ", length(content), "\n")
  cat("Date: ", length(date), "\n")
  cat("Stars: ", length(stars), "\n")
  #cat("Metascore: ", length(metascore),"\n")
  
  minLength<- min(length(title), length(username), length(content), length(date), length(stars))
  
  
  movie_reviews3 <- data.frame (
    Title = title[1:minLength],
    Username = username[1:minLength],
    Content = content[1:minLength],
    Date = date[1:minLength],
    Stars = stars[1:minLength],
    stringsAsFactors = FALSE
  )
  
  return(movie_reviews3)
}

url1 <- 'https://www.imdb.com/title/tt0111161/reviews?ref_=tt_urv'
target_reviews <- 300
movieReview3 <- data.frame()

page <- 1
while (nrow(movieReview3) < target_reviews) {
  url <- paste0(url1, page)
  reviewsPage <- scrapeReviews3(url)
  movieReview3 <- bind_rows(movieReview3, reviewsPage)
  page <- page + 1
}
movieReview3 <- movieReview3[1:target_reviews, ]

cat("Number of scraped reviews: ", nrow( movieReview3), "\n")
View( movieReview3)


#4TH MOVIE(Argylle)
scrapeReviews4 <- function(url) {
  movie4Reviews <- read_html(url)
  
  #title
  movie4Reviews %>%
    html_nodes('.title') %>%
    html_text() -> title
  
  #username
  movie4Reviews %>%
    html_nodes('.display-name-link') %>%
    html_text() -> username
  
  #content
  movie4Reviews %>%
    html_nodes('.content') %>%
    html_text() -> content
  
  #date
  movie4Reviews %>%
    html_nodes('.review-date') %>%
    html_text() -> date
  
  #stars
  movie4Reviews %>%
    html_nodes('.rating-other-user-rating') %>%
    html_text() -> stars
  
  
  cat("Title: ", length(title), "\n")
  cat("Username: ", length(username), "\n")
  cat("Content: ", length(content), "\n")
  cat("Date: ", length(date), "\n")
  cat("Stars: ", length(stars), "\n")
  #cat("Metascore: ", length(metascore),"\n")
  
  minLength<- min(length(title), length(username), length(content), length(date), length(stars))
  
  
  movie_reviews4 <- data.frame (
    Title = title[1:minLength],
    Username = username[1:minLength],
    Content = content[1:minLength],
    Date = date[1:minLength],
    Stars = stars[1:minLength],
    stringsAsFactors = FALSE
  )
  
  return(movie_reviews4)
}

url1 <- 'https://www.imdb.com/title/tt15009428/reviews?ref_=tt_urv'
target_reviews <- 300
movieReview4 <- data.frame()

page <- 1
while (nrow(movieReview4) < target_reviews) {
  url <- paste0(url1, page)
  reviewsPage <- scrapeReviews4(url)
  movieReview4 <- bind_rows(movieReview4, reviewsPage)
  page <- page + 1
}
movieReview4 <- movieReview4[1:target_reviews, ]

cat("Number of scraped reviews: ", nrow( movieReview4), "\n")
View( movieReview4)


#5TH MOVIE(The Marvels)
scrapeReviews5 <- function(url) {
  movie5Reviews <- read_html(url)
  
  #title
  movie5Reviews %>%
    html_nodes('.title') %>%
    html_text() -> title
  
  #username
  movie5Reviews %>%
    html_nodes('.display-name-link') %>%
    html_text() -> username
  
  #content
  movie5Reviews %>%
    html_nodes('.content') %>%
    html_text() -> content
  
  #date
  movie5Reviews %>%
    html_nodes('.review-date') %>%
    html_text() -> date
  
  #stars
  movie5Reviews %>%
    html_nodes('.rating-other-user-rating') %>%
    html_text() -> stars
  
  
  cat("Title: ", length(title), "\n")
  cat("Username: ", length(username), "\n")
  cat("Content: ", length(content), "\n")
  cat("Date: ", length(date), "\n")
  cat("Stars: ", length(stars), "\n")
  #cat("Metascore: ", length(metascore),"\n")
  
  minLength<- min(length(title), length(username), length(content), length(date), length(stars))
  
  
  movie_reviews5 <- data.frame (
    Title = title[1:minLength],
    Username = username[1:minLength],
    Content = content[1:minLength],
    Date = date[1:minLength],
    Stars = stars[1:minLength],
    stringsAsFactors = FALSE
  )
  
  return(movie_reviews5)
}

url1 <- 'https://www.imdb.com/title/tt10676048/reviews?ref_=tt_urv'
target_reviews <- 300
movieReview5 <- data.frame()

page <- 1
while (nrow(movieReview5) < target_reviews) {
  url <- paste0(url1, page)
  reviewsPage <- scrapeReviews5(url)
  movieReview5 <- bind_rows(movieReview5, reviewsPage)
  page <- page + 1
}
movieReview5 <- movieReview5[1:target_reviews, ]

cat("Number of scraped reviews: ", nrow( movieReview5), "\n")
View( movieReview5)


#6TH MOVIE(Aquaman)
scrapeReviews6 <- function(url) {
  movie6Reviews <- read_html(url)
  
  #title
  movie6Reviews %>%
    html_nodes('.title') %>%
    html_text() -> title
  
  #username
  movie6Reviews %>%
    html_nodes('.display-name-link') %>%
    html_text() -> username
  
  #content
  movie6Reviews %>%
    html_nodes('.content') %>%
    html_text() -> content
  
  #date
  movie6Reviews %>%
    html_nodes('.review-date') %>%
    html_text() -> date
  
  #stars
  movie6Reviews %>%
    html_nodes('.rating-other-user-rating') %>%
    html_text() -> stars
  
  
  cat("Title: ", length(title), "\n")
  cat("Username: ", length(username), "\n")
  cat("Content: ", length(content), "\n")
  cat("Date: ", length(date), "\n")
  cat("Stars: ", length(stars), "\n")
  #cat("Metascore: ", length(metascore),"\n")
  
  minLength<- min(length(title), length(username), length(content), length(date), length(stars))
  
  
  movie_reviews6 <- data.frame (
    Title = title[1:minLength],
    Username = username[1:minLength],
    Content = content[1:minLength],
    Date = date[1:minLength],
    Stars = stars[1:minLength],
    stringsAsFactors = FALSE
  )
  
  return(movie_reviews6)
}

url1 <- 'https://www.imdb.com/title/tt9663764/reviews?ref_=tt_urv'
target_reviews <- 300
movieReview6 <- data.frame()

page <- 1
while (nrow(movieReview6) < target_reviews) {
  url <- paste0(url1, page)
  reviewsPage <- scrapeReviews6(url)
  movieReview6 <- bind_rows(movieReview6, reviewsPage)
  page <- page + 1
}
movieReview6 <- movieReview6[1:target_reviews, ]

cat("Number of scraped reviews: ", nrow( movieReview6), "\n")
View( movieReview6)


#7TH MOVIE(Barbie)
scrapeReviews7 <- function(url) {
  movie7Reviews <- read_html(url)
  
  #title
  movie7Reviews %>%
    html_nodes('.title') %>%
    html_text() -> title
  
  #username
  movie7Reviews %>%
    html_nodes('.display-name-link') %>%
    html_text() -> username
  
  #content
  movie7Reviews %>%
    html_nodes('.content') %>%
    html_text() -> content
  
  #date
  movie7Reviews %>%
    html_nodes('.review-date') %>%
    html_text() -> date
  
  #stars
  movie7Reviews %>%
    html_nodes('.rating-other-user-rating') %>%
    html_text() -> stars
  
  
  cat("Title: ", length(title), "\n")
  cat("Username: ", length(username), "\n")
  cat("Content: ", length(content), "\n")
  cat("Date: ", length(date), "\n")
  cat("Stars: ", length(stars), "\n")
  #cat("Metascore: ", length(metascore),"\n")
  
  minLength<- min(length(title), length(username), length(content), length(date), length(stars))
  
  
  movie_reviews7 <- data.frame (
    Title = title[1:minLength],
    Username = username[1:minLength],
    Content = content[1:minLength],
    Date = date[1:minLength],
    Stars = stars[1:minLength],
    stringsAsFactors = FALSE
  )
  
  return(movie_reviews7)
}

url1 <- 'https://www.imdb.com/title/tt1517268/reviews?ref_=tt_urv'
target_reviews <- 300
movieReview7 <- data.frame()

page <- 1
while (nrow(movieReview7) < target_reviews) {
  url <- paste0(url1, page)
  reviewsPage <- scrapeReviews7(url)
  movieReview7 <- bind_rows(movieReview7, reviewsPage)
  page <- page + 1
}
movieReview7 <- movieReview7[1:target_reviews, ]

cat("Number of scraped reviews: ", nrow( movieReview7), "\n")
View( movieReview7)


#8TH MOVIE(Five Feet Apart)
scrapeReviews8 <- function(url) {
  movie8Reviews <- read_html(url)
  
  #title
  movie8Reviews %>%
    html_nodes('.title') %>%
    html_text() -> title
  
  #username
  movie8Reviews %>%
    html_nodes('.display-name-link') %>%
    html_text() -> username
  
  #content
  movie8Reviews %>%
    html_nodes('.content') %>%
    html_text() -> content
  
  #date
  movie8Reviews %>%
    html_nodes('.review-date') %>%
    html_text() -> date
  
  #stars
  movie8Reviews %>%
    html_nodes('.rating-other-user-rating') %>%
    html_text() -> stars
  
  
  cat("Title: ", length(title), "\n")
  cat("Username: ", length(username), "\n")
  cat("Content: ", length(content), "\n")
  cat("Date: ", length(date), "\n")
  cat("Stars: ", length(stars), "\n")
  #cat("Metascore: ", length(metascore),"\n")
  
  minLength<- min(length(title), length(username), length(content), length(date), length(stars))
  
  
  movie_reviews8 <- data.frame (
    Title = title[1:minLength],
    Username = username[1:minLength],
    Content = content[1:minLength],
    Date = date[1:minLength],
    Stars = stars[1:minLength],
    stringsAsFactors = FALSE
  )
  
  return(movie_reviews8)
}

url1 <- 'https://www.imdb.com/title/tt6472976/reviews?ref_=tt_urv'
target_reviews <- 300
movieReview8 <- data.frame()

page <- 1
while (nrow(movieReview8) < target_reviews) {
  url <- paste0(url1, page)
  reviewsPage <- scrapeReviews8(url)
  movieReview8 <- bind_rows(movieReview8, reviewsPage)
  page <- page + 1
}
movieReview8 <- movieReview8[1:target_reviews, ]

cat("Number of scraped reviews: ", nrow( movieReview8), "\n")
View( movieReview8)


#9TH MOVIE(Ready or Not)
scrapeReviews9 <- function(url) {
  movie9Reviews <- read_html(url)
  
  #title
  movie9Reviews %>%
    html_nodes('.title') %>%
    html_text() -> title
  
  #username
  movie9Reviews %>%
    html_nodes('.display-name-link') %>%
    html_text() -> username
  
  #content
  movie9Reviews %>%
    html_nodes('.content') %>%
    html_text() -> content
  
  #date
  movie9Reviews %>%
    html_nodes('.review-date') %>%
    html_text() -> date
  
  #stars
  movie9Reviews %>%
    html_nodes('.rating-other-user-rating') %>%
    html_text() -> stars
  
  
  cat("Title: ", length(title), "\n")
  cat("Username: ", length(username), "\n")
  cat("Content: ", length(content), "\n")
  cat("Date: ", length(date), "\n")
  cat("Stars: ", length(stars), "\n")
  #cat("Metascore: ", length(metascore),"\n")
  
  minLength<- min(length(title), length(username), length(content), length(date), length(stars))
  
  
  movie_reviews9 <- data.frame (
    Title = title[1:minLength],
    Username = username[1:minLength],
    Content = content[1:minLength],
    Date = date[1:minLength],
    Stars = stars[1:minLength],
    stringsAsFactors = FALSE
  )
  
  return(movie_reviews9)
}

url1 <- 'https://www.imdb.com/title/tt7798634/reviews?ref_=tt_urv'
target_reviews <- 300
movieReview9 <- data.frame()

page <- 1
while (nrow(movieReview9) < target_reviews) {
  url <- paste0(url1, page)
  reviewsPage <- scrapeReviews9(url)
  movieReview9 <- bind_rows(movieReview9, reviewsPage)
  page <- page + 1
}
movieReview9 <- movieReview9[1:target_reviews, ]

cat("Number of scraped reviews: ", nrow( movieReview9), "\n")
View( movieReview9)


#10TH MOVIE(To All the Boys I've Loved Before)
scrapeReviews10 <- function(url) {
  movie10Reviews <- read_html(url)
  
  #title
  movie10Reviews %>%
    html_nodes('.title') %>%
    html_text() -> title
  
  #username
  movie10Reviews %>%
    html_nodes('.display-name-link') %>%
    html_text() -> username
  
  #content
  movie10Reviews %>%
    html_nodes('.content') %>%
    html_text() -> content
  
  #date
  movie10Reviews %>%
    html_nodes('.review-date') %>%
    html_text() -> date
  
  #stars
  movie10Reviews %>%
    html_nodes('.rating-other-user-rating') %>%
    html_text() -> stars
  
  
  cat("Title: ", length(title), "\n")
  cat("Username: ", length(username), "\n")
  cat("Content: ", length(content), "\n")
  cat("Date: ", length(date), "\n")
  cat("Stars: ", length(stars), "\n")
  #cat("Metascore: ", length(metascore),"\n")
  
  minLength<- min(length(title), length(username), length(content), length(date), length(stars))
  
  
  movie_reviews10 <- data.frame (
    Title = title[1:minLength],
    Username = username[1:minLength],
    Content = content[1:minLength],
    Date = date[1:minLength],
    Stars = stars[1:minLength],
    stringsAsFactors = FALSE
  )
  
  return(movie_reviews10)
}

url1 <- 'https://www.imdb.com/title/tt3846674/reviews?ref_=tt_urv'
target_reviews <- 300
movieReview10 <- data.frame()

page <- 1
while (nrow(movieReview10) < target_reviews) {
  url <- paste0(url1, page)
  reviewsPage <- scrapeReviews10(url)
  movieReview10 <- bind_rows(movieReview10, reviewsPage)
  page <- page + 1
}
movieReview10 <- movieReview10[1:target_reviews, ]

cat("Number of scraped reviews: ", nrow(movieReview10), "\n")
View( movieReview10)

#RBind
combined_df <- rbind(movieReview1, movieReview2,movieReview3,movieReview4,movieReview5,movieReview6,movieReview7,movieReview8,movieReview9,movieReview10)
View(combined_df)