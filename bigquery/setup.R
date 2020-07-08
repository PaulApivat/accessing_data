# Environment ----
# R version 3.6.3 (2020-02-29)
# Platform: x86_64-apple-darwin15.6.0 (64-bit)
# Running under: macOS Catalina 10.15.5
# RStudio Version 1.2.5042


# Installation ----
install.packages("bigrquery")


# Usage ----

# Low-level API
library(bigrquery)


# DBI
library(DBI)

con <- dbConnect(
    bigrquery::bigquery(),
    project = "jobsbot-276604",
    dataset = "smartjob",
    billing = jobsbot-276604
)
