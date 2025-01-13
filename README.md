# Web-Scraping-Molecular-Cancer

Molecular Cancer Data Analysis Project
Overview
This project involves web scraping data from the Molecular Cancer journal's website, processing the data, and performing exploratory analysis. The project extracts key information, such as publication details, corresponding authors, abstracts, and keywords, to create a structured dataset for further visualization and insights.

Features
Web Scraping: Extracts data from the Molecular Cancer journal, including titles, authors, publication dates, abstracts, keywords, and corresponding author information.
Data Cleaning: Processes and structures scraped data for easy analysis.
Data Visualization: Generates insights from the data using plots created in R, showcasing trends over time.
Technologies Used
Languages: R
Libraries:
rvest: For web scraping.
httr: For handling HTTP requests.
dplyr & tidyverse: For data manipulation.
ggplot2: For creating visualizations.
Installation
Clone the repository:
bash
Copy code
git clone https://github.com/yourusername/molecular-cancer-data-analysis.git
cd molecular-cancer-data-analysis
Install the necessary R packages:
R
Copy code
install.packages(c("rvest", "httr", "xml2", "dplyr", "magrittr", "tidyverse", "ggplot2"))
Ensure the scraped_data.csv and data.csv files are in the project directory.
How It Works
Web Scraping:

The script Project_1.R scrapes data from multiple pages of the Molecular Cancer journal.
It extracts information like publication titles, dates, authors, and abstracts using functions defined for specific HTML nodes.
Data Cleaning and Structuring:

The scraped data is stored in data.csv.
Additional transformations are performed to extract and clean publication years and months.
Visualization:

The script graph.R uses ggplot2 to create bar charts visualizing publication trends by year and month.
Usage
Run the scraping script to fetch data:

R
Copy code
source("Project_1.R")
The output is saved as data.csv.

Analyze the data with visualizations:

R
Copy code
source("graph.R")
View the generated bar plots for year and month trends.

Output
Dataset: data.csv contains structured information for further analysis.
Visualizations:
Bar charts representing publication trends by year and month.
Examples
Example Data
csv
Copy code
Title,Author,Publish_Date,Corr_Author,Email,Abstract,Keywords
"Title 1","Author A","2023-01-15","Author A","authorA@example.com","Abstract text here","Keyword1, Keyword2"
"Title 2","Author B","2022-11-23","Author B","authorB@example.com","Abstract text here","Keyword3, Keyword4"
Example Visualization
Yearly Publications:
Monthly Publications:
Contributing
Contributions are welcome! Feel free to fork the repository and submit a pull request.

