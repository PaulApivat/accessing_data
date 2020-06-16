# Web Scraping XML / AJAX

# sessionInfo()
# R version 3.6.3 (2020-02-29)
# Platform: x86_64-apple-darwin15.6.0 (64-bit)
# Running under: macOS Catalina 10.15.2
# RStudio Version 1.2.5042

# source article: https://medium.com/@iwishcognitivedissonance/%E0%B9%83%E0%B8%84%E0%B8%A3%E0%B9%84%E0%B8%A1%E0%B9%88%E0%B8%A1%E0%B8%B5-thaime-%E0%B8%81%E0%B8%A7%E0%B9%88%E0%B8%B2%E0%B8%88%E0%B8%B0%E0%B9%84%E0%B8%94%E0%B9%89%E0%B8%A7%E0%B8%B4%E0%B9%80%E0%B8%84%E0%B8%A3%E0%B8%B2%E0%B8%B0%E0%B8%AB%E0%B9%8C-%E0%B8%82%E0%B9%89%E0%B8%AD%E0%B8%A1%E0%B8%B9%E0%B8%A5%E0%B9%80%E0%B8%9B%E0%B8%B4%E0%B8%94-%E0%B8%82%E0%B8%AD%E0%B8%87%E0%B8%A3%E0%B8%B1%E0%B8%90%E0%B9%84%E0%B8%97%E0%B8%A2-fcd8acff7745

# description: Accessing Thai NESDC "open" data that is in AJAX

# load libraries
library(tidyverse)

# reading from URL
url <- 'http://nscr.nesdb.go.th/thaime-project/'
webpage <- read_html(url)

# explore webpage file

# xml_document, xml_node
class(webpage)

# List of 2, node, doc
str(webpage)

# view structure of xml document
View(xml_structure(webpage))

