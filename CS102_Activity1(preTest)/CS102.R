library(rvest)
library(polite)

# First category
url1 <- "https://www.amazon.com/s?i=specialty-aps&bbn=16225007011&rh=n%3A16225007011%2Cn%3A3011391011&ref=nav_em__nav_desktop_sa_intl_laptop_accessories_0_2_6_7"

session1 <- bow(url1, user_agent = "Educational")
sessionScrape1 <- scrape(session1)

div_elements1 <- html_nodes(sessionScrape1, 'div.sg-col-4-of-24.sg-col-4-of-12.s-result-item.s-asin.sg-col-4-of-16.sg-col.s-widget-spacing-small.sg-col-4-of-20')
brandDescription1 <- character()
price1 <- character()
num_rev1 <- character()
revStars1 <- character()

for (div_element in div_elements1) {
  brandDescription_element <- html_node(div_element, 'span.a-size-base-plus.a-color-base.a-text-normal')
  brandDescriptions <- ifelse(!is.na(brandDescription_element), html_text(brandDescription_element), '')
  
  price_element <- html_node(div_element, 'span.a-price-whole') 
  prices <- ifelse(!is.na(price_element), html_text(price_element), '')
  
  numRev <- html_node(div_element, 'div.s-csa-instrumentation-wrapper.alf-search-csa-instrumentation-wrapper')
  numReview <- ifelse(!is.na(numRev), html_text(numRev), '')
  
  revStars_element <- html_node(div_element, 'span.a-icon-alt')
  reviewStars <- ifelse(!is.na(revStars_element), html_text(revStars_element), '')
  
  brandDescription1 <- c(brandDescription1, brandDescriptions)
  price1 <- c(price1, prices)
  num_rev1 <- c(num_rev1, numReview)
  revStars1 <- c(revStars1, reviewStars)
}

Laptop_df <- data.frame(
  Categories = rep('Laptop Accessories', length(brandDescription1)),
  Brand_Description = brandDescription1,
  Price = price1,
  NumberOfReviews = num_rev1,
  ReviewStars = revStars1
)
Laptop_df

# Second category
url2 <- 'https://www.amazon.com/s?i=specialty-aps&bbn=16225009011&rh=n%3A%2116225009011%2Cn%3A541966&ref=nav_em__nav_desktop_sa_intl_computers_and_accessories_0_2_5_6'

session2 <- bow(url2, user_agent = "Educational")
sessionScrape2 <- scrape(session2)

div_elements2 <- html_nodes(sessionScrape2, 'div.sg-col-4-of-24.sg-col-4-of-12.s-result-item.s-asin.sg-col-4-of-16.sg-col.s-widget-spacing-small.sg-col-4-of-20')
brandDescription2 <- character()
price2 <- character()
num_rev2 <- character()
revStars2 <- character()

for (div_element in div_elements2) {
  brandDescription_element <- html_node(div_element, 'span.a-size-base-plus.a-color-base.a-text-normal')
  brandDescriptions <- ifelse(!is.na(brandDescription_element), html_text(brandDescription_element), '')
  
  price_element <- html_node(div_element, 'span.a-price-whole') 
  prices <- ifelse(!is.na(price_element), html_text(price_element), '')
  
  numRev <- html_node(div_element, 'div.s-csa-instrumentation-wrapper.alf-search-csa-instrumentation-wrapper')
  numReview <- ifelse(!is.na(numRev), html_text(numRev), '')
  
  revStars_element <- html_node(div_element, 'span.a-icon-alt')
  reviewStars <- ifelse(!is.na(revStars_element), html_text(revStars_element), '')
  
  brandDescription2 <- c(brandDescription2, brandDescriptions)
  price2 <- c(price2, prices)
  num_rev2 <- c(num_rev2, numReview)
  revStars2 <- c(revStars2, reviewStars)
}

Computer_df <- data.frame(
  Categories = rep('Computers & Accessories', length(brandDescription2)),
  Brand_Description = brandDescription2,
  Price = price2,
  NumberOfReviews = num_rev2,
  ReviewStars = revStars2
)
Computer_df

Df_final <- rbind(Laptop_df, Computer_df)
Df_final

write.csv(Df_final, "CS102(pre-test).csv")
