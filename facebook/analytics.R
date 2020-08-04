# Environment ----
# R version 3.6.3 (2020-02-29)
# Platform: x86_64-apple-darwin15.6.0 (64-bit)
# Running under: macOS Catalina 10.15.5
# RStudio Version 1.2.5042

# Setting Up: Facebook Analytics ----

# Step 1: Create App: saku_analytics
# Step 1a: Add 'Analytics' to App
# Step 1b: Choose platform for this app (Web)

# Step 2: go to https://developers.facebook.com/tools/explorer
# Step 2a: Generate Access Token for 'previously' created saku_analytics
# Step 2b: Other settings: 
# - Facebook App: saku_analytics
# - User or Page: User Token
# - Permissions - public_profile (user_friends, user_events)

# Facebook Page Analysis with R ----

# Step 1: go to https://developers.facebook.com/tools/explorer
# Step 2: choose saku_analytics (previously created, see above)
# step 3: choose 'Get Page Access Token', continue as my personal account
# step 4: What page do you want to use with saku_analytics? (choose: Saku)
# step 5: Submit for Login Review - What is saku_analytics allowed to do? (read content posted on the page)
# - you've now linked saku_analytics to Facebook 
# step 6: For User or Page - select 'Saku'
# Step 7: Click Generate Access Token
# Step 8: require Rfacebook library, store access token as string, fetch data from Facebook page (see below)


# Packages & Libraries ----
install.packages('Rfacebook', dependencies = TRUE)
library(Rfacebook)

# access token stored as a string
token <- "access token"

# fetch data from Facebook page
page <- getPage("Saku", token, n=1000)

# Tentative solution: Request access to Saku admin page for faster API access [done]

# Error in callAPI(url = url, token = token, api = api) : 
# (#803) Some of the aliases you requested do not exist: Saku



