install.packages("ggplot2")
library(ggplot2)

data <- read.csv("scraped_data.csv")
View(data)

date<-data$publish_date
year <- gsub(".*([0-9]{4})", "\\1", date)
year_counts <- data.frame(Column_Name = year,Count = as.numeric(year))
year_counts_df <- data.frame(Year = names(year), Count = as.numeric(year))
options(scipen = 999)

ggplot(year_counts, aes(x = year, y = Count)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Year Counts", x = "Year", y = "Count")
  