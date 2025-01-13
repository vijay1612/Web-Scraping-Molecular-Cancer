install.packages("rvest")
install.packages("httr")
install.packages("xml2")
install.packages("dplyr")
install.packages("magrittr")
install.packages("tidyverse")

# Load necessary packages
library(rvest)
library(httr)
library(xml2)
library(dplyr)
library(magrittr)
library(tidyverse)


get_date<- function(journal_link) {
  journal_page <- read_html(journal_link)
  journal_date <- journal_page %>% html_nodes(".c-article-identifiers__item time") %>%
    html_text() %>% paste(collapse = ",")
  return(journal_date)
}

get_corauthor<- function(journal_link) {
  journal_page <- read_html(journal_link)
  corauth <- journal_page %>% html_nodes("#corresponding-author-list") %>%
    html_text() %>% paste(collapse = ",")
  return(corauth)
}

get_abstract<- function(journal_link) {
  journal_page <- read_html(journal_link)
  abst <- journal_page %>% html_nodes("#Abs1-content p") %>%
    html_text() %>% paste(collapse = ",")
  return(abst)
}

get_keywords <- function(journal_link) {
  journal_page <- read_html(journal_link)
  keywrd <- journal_page %>% html_nodes(".c-article-subject-list__subject a") %>%
    html_text() %>% paste(collapse = ",")
  return(keywrd)
}


get_email <- function(journal_link) {
  journal_page <- read_html(journal_link)
  email_full <- journal_page %>% html_nodes("#corresponding-author-list a") %>%
    html_attr("href")  %>% paste(collapse = ",")
  el <- sub("^mailto:", "", email_full)
  em = gsub("mailto:", "",el)
  return(em)
}


df <- data.frame()


for (page_result in seq(from = 1, to = 63)) {
  url = paste0("https://molecular-cancer.biomedcentral.com/articles?searchType=journalSearch&sort=PubDate&page=", 
               page_result, "&ref_=adv_nxt")
  
  journal<- read_html(url)
  
  Title <- journal %>% html_nodes(".c-listing__title a") %>% html_text()
  author<-journal %>% html_nodes(".c-listing__authors-list") %>% html_text()
  
  journal_links<- journal %>% html_nodes(".c-listing__title a") %>% 
    html_attr("href") %>% paste("https://molecular-cancer.biomedcentral.com", ., sep = "")
  publish_date <- sapply(journal_links,FUN = get_date,USE.NAMES = FALSE)
  
  corr_author <- sapply(journal_links,FUN = get_corauthor,USE.NAMES = FALSE)
  
  Abstract <- sapply(journal_links,FUN = get_abstract,USE.NAMES = FALSE)
  
  Keywords <- sapply(journal_links,FUN = get_keywords,USE.NAMES = FALSE)
  
  email <- sapply(journal_links,FUN = get_email,USE.NAMES = FALSE)
  
  
  df <- rbind(df,data.frame(Title, author,publish_date,corr_author,email, Abstract,Keywords))
  
  }

View(df)


write.csv(df, file = "C:\\Users\\vijay\\Desktop\\data analysis with r\\project\\data.csv", row.names = FALSE)

install.packages("ggplot2")
library(ggplot2)

data <- read.csv("data.csv")
View(data)

date<-data$publish_date
year <- gsub(".*([0-9]{4})", "\\1", date)
year_counts <- data.frame(Column_Name = year,Count = as.numeric(year))
year_counts_df <- data.frame(Year = names(year), Count = as.numeric(year))
options(scipen = 999)

ggplot(year_counts, aes(x = year, y = Count)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Year Counts", x = "Year", y = "Count")

month <- str_extract(date, "\\b[A-Za-z]+\\b")
month_counts <- data.frame(Column_Name = month,Count = as.numeric(month))
month_counts_df <- data.frame(Month = names(month), Count = as.numeric(month))
options(scipen = 999)

ggplot(year_counts, aes(x = month, y = Count)) +
  geom_bar(stat = "identity", fill = "red") +
  labs(title = "Month Counts", x = "Month", y = "Count")








