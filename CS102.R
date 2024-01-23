library(rvest)
library(polite)

polite::use_manners(save_as = 'polite_scrape.R')

url <- 'https://www.amazon.com/s?i=specialty-aps&bbn=16225007011&rh=n%3A16225007011%2Cn%3A172456&ref=nav_em__nav_desktop_sa_intl_computer_accessories_and_peripherals_0_2_6_2'

session <- bow(url, user_agent = "Educational")

category <- character()
brandDescription <- character()
prices <- character()
reviews <- character()

page <- scrape(session)

category_element <- ('span.')

brandDescription_element <- ('span.a-size-base-plus.a-color-base.a-text-normal') 
brandDescription <-  ifelse(!is.na(brandDescription), html_text(brandDescription), '')

price_element <- ('span.a-price-whole') 
price <- ifelse(!is.na(price_element), html_text(price_element), '')

reviews_element <- ('span.a-icon-alt')
reviews <- ifelse(!is.na(rating_element), html_text(rating_element), '')

titles <- c(titles, title)
brandDescription <- c(brandDescription, brandDescription)  
prices <- c(prices, price)
reviews <- c(reviews, reviews)  

product_df <- data.frame(
  Titles = titles,
  brandDescription = brandDescription,
  Prices = prices,
  Reviews = reviews
)

write.csv(product_df, "product.csv")
