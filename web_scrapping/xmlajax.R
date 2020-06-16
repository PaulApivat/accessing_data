# Web Scraping XML / AJAX

# sessionInfo()
# R version 3.6.3 (2020-02-29)
# Platform: x86_64-apple-darwin15.6.0 (64-bit)
# Running under: macOS Catalina 10.15.2
# RStudio Version 1.2.5042

# source article: https://medium.com/@iwishcognitivedissonance/%E0%B9%83%E0%B8%84%E0%B8%A3%E0%B9%84%E0%B8%A1%E0%B9%88%E0%B8%A1%E0%B8%B5-thaime-%E0%B8%81%E0%B8%A7%E0%B9%88%E0%B8%B2%E0%B8%88%E0%B8%B0%E0%B9%84%E0%B8%94%E0%B9%89%E0%B8%A7%E0%B8%B4%E0%B9%80%E0%B8%84%E0%B8%A3%E0%B8%B2%E0%B8%B0%E0%B8%AB%E0%B9%8C-%E0%B8%82%E0%B9%89%E0%B8%AD%E0%B8%A1%E0%B8%B9%E0%B8%A5%E0%B9%80%E0%B8%9B%E0%B8%B4%E0%B8%94-%E0%B8%82%E0%B8%AD%E0%B8%87%E0%B8%A3%E0%B8%B1%E0%B8%90%E0%B9%84%E0%B8%97%E0%B8%A2-fcd8acff7745

# description: Accessing Thai NESDC "open" data that is in AJAX

##### IMPORANT NOTE ABOUT XML ######
# No two single XML files have to be same dimension or structure. 
# It is an open-ended, nested data type left to designer unlike dataframes/datasets 
# that are always two-dimensional, rows by columns. 
# ******So a generalizable conversion of any XML to df is not possible. ******
# We need to see your specific XML to tailor accordingly. Show us doc. – Parfait
# source: https://stackoverflow.com/questions/49784523/how-to-convert-any-xml-file-to-a-data-frame
#####################################

# load libraries
library(tidyverse)
library(xml2)     # main see: 
library(XML)
library(rvest)

# reading from URL
url <- 'http://nscr.nesdb.go.th/thaime-project/'
webpage <- read_html(url)

##### Focus on xml2 package ######

# Navigage TREE
xml_children(webpage)   # below
xml_siblings(webpage)
xml_parent(webpage)     # above

# use xpath to jump directly to nodes you're interested in
# xml_find_one()
# xml_find_all()

xml_find_all(webpage, ".//div")     # xml_nodeset (129)
xml_find_all(webpage, ".//head")
xml_find_all(webpage, ".//body")






# explore webpage file

# xml_document, xml_node
class(webpage)

# List of 2, node, doc
str(webpage)

# view structure of xml document
View(xml_structure(webpage))

# use xml2 package to explore

xml_name(webpage)
xml_children(webpage)

# these are all LISTS ("xml_nodeset")
View(xml_find_all(webpage, ".//div"))       #list [129]
View(html_nodes(webpage, "div"))

View(xml_find_all(webpage, ".//meta"))      #list [11]
View(xml_find_all(webpage, ".//link"))      #list [24]
View(xml_find_all(webpage, ".//ul"))        #list [2]
View(xml_find_all(webpage, ".//li"))        #list [15]

# convert lists ("xml_nodeset") to data.frame, but not helpful
html_nodes(webpage, "div") %>%
    map(xml_attrs) %>%
    map_df(~as.list(.))

html_nodes(webpage, "meta") %>% 
    map(xml_attrs) %>% 
    map_df(~as.list(.))

# potential routes
webpage %>% html_nodes('div') %>% html_text()

# search for SPECIFIC ID

webpage %>% 
    html_nodes(xpath = '//*[@id="some_id_value"]')

webpage %>% 
    html_nodes(xpath = '//*[@id="footable_parent_11913"]')


# reading from URL (xml version)
url2 <- "http://nscr.nesdb.go.th/wp-admin/admin-ajax.php?action=wp_ajax_ninja_tables_public_action&table_id=11868&target_action=get-all-data&default_sorting=old_first&skip_rows=0&limit_rows=0&chunk_number={chunk}"

webpage2 <- read_html(url2)

View(xml_find_all(webpage2, ".//a"))

View(html_nodes(webpage2, "a") %>% map(xml_attrs) %>% map_df(~as.list(.)))

###### Another Shot ######

url <- "http://nscr.nesdb.go.th/wp-admin/admin-ajax.php?action=wp_ajax_ninja_tables_public_action&table_id=11913&target_action=get-all-data&default_sorting=old_first&skip_rows=0&limit_rows=0&chunk_number=13"

webpage <- read_html(url)

# xml_nodeset
nodes <- html_nodes(webpage, "a")

########## Instead of XML, try scrapping Table from HTML ##########
url <- "http://nscr.nesdb.go.th/thaime-project/"
webpage <- read_html(url)

table <- html_nodes(webpage, "table")

divs <- html_nodes(webpage, "div")

# divs[[14]] <div data-id="2514c6a" class="elementor-element elementor-element-251 ...

## copy Xpath
//*[@id="footable_11913"]

# this is most specific
divs %>% html_nodes(xpath = '//*[@data-footable_id="11913"]')
divs %>% html_nodes(xpath = '//*[@id="footable_11913"]')

divs %>% html_nodes(xpath = '//*[@id="footable_11913"]') -> tablehead

# even more specific
tablehead[[1]]

