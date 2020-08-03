# Environment ----
# R version 3.6.3 (2020-02-29)
# Platform: x86_64-apple-darwin15.6.0 (64-bit)
# Running under: macOS Catalina 10.15.5
# RStudio Version 1.2.5042


# BigQuery platform (not Export yet) ----

# Identify Primary Keys in each table _sdc_primary_keys

# mixpanel_export distinct_id
# mixpanel_export _rjm_record_hash
# mixpanel_export event
# mixpanel_export time
# mixpanel_engage mp_reserved_distinct_id
# mixpanel_funnels funnel_id
# mixpanel_funnels date


# 3 Distinct funnel_id from mixpael_funnels
SELECT DISTINCT(funnel_id) 
FROM `jobsbot-276604.jobsbot_mixpanel.mixpanel_funnels` 
LIMIT 200


# BigQuery: What basic data would be useful? ----

# Count of events  from mixpanel_export
# job listing, get job details, share job, got to smartjob, contact employer
SELECT event, COUNT(event) FROM `jobsbot-276604.jobsbot_mixpanel.mixpanel_export` 
GROUP BY event
LIMIT 700

# Count gender from mixpanel_engage
# female (115) male (51)
SELECT gender, COUNT(gender) FROM `jobsbot-276604.jobsbot_mixpanel.mixpanel_engage` 
GROUP BY gender
LIMIT 200

# Next Step ----
# Explore visualizing on Google Data Studio

# Connect R to BigQuery ----
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
