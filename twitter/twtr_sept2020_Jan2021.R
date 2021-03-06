library(tidyverse)
library(lubridate)
library(GGally)

# load data from September to mid-January
df1 <- read_csv("./daily_tweet_activity/daily_tweet_activity_metrics_paulapivat_20200901_20201001_en.csv")
df2 <- read_csv("./daily_tweet_activity/daily_tweet_activity_metrics_paulapivat_20201001_20201101_en.csv")
df3 <- read_csv("./daily_tweet_activity/daily_tweet_activity_metrics_paulapivat_20201101_20201201_en.csv")
df4 <- read_csv("./daily_tweet_activity/daily_tweet_activity_metrics_paulapivat_20201201_20210101_en.csv")
df5 <- read_csv("./daily_tweet_activity/daily_tweet_activity_metrics_paulapivat_20210101_20210112_en.csv")

# combining ALL five dataframes into ONE by rows

df <- rbind(df1, df2, df3, df4, df5)

# USER PROFILE CLICKS ----

# Engagement (r = 0.64) ----
df %>%
    ggplot(aes(x = `user profile clicks`, y = engagements)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between Engagements & User Profile Clicks (r = 0.64)",
        subtitle = "Sept 01, 2020 - Jan 11, 2021",
        y = "Engagements",
        x = "User Profile Clicks",
        caption = "Data & Graphic: @paulapivat"
    )

cor.test(x = df$`user profile clicks`, y = df$engagements)

# Impressions (r = 0.64) ----
df %>%
    ggplot(aes(x = `user profile clicks`, y = impressions)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between Impressions & User Profile Clicks (r = 0.64)",
        subtitle = "Sept 01, 2020 - Jan 11, 2021",
        y = "Impressions",
        x = "User Profile Clicks",
        caption = "Data & Graphic: @paulapivat"
    )

cor.test(x = df$`user profile clicks`, y = df$impressions)

# Tweets Published (r = 0.42) ----
df %>%
    ggplot(aes(x = `user profile clicks`, y = `Tweets published`)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between Tweets Published & User Profile Clicks (r = 0.42)",
        subtitle = "Sept 01, 2020 - Jan 11, 2021",
        y = "Tweets Published",
        x = "User Profile Clicks",
        caption = "Data & Graphic: @paulapivat"
    )

cor.test(x = df$`user profile clicks`, y = df$`Tweets published`)


# Retweets (r = 0.39) ----
df %>%
    ggplot(aes(x = `user profile clicks`, y = retweets)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between Retweets & User Profile Clicks (r = 0.39)",
        subtitle = "Sept 01, 2020 - Jan 11, 2021",
        y = "Retweets",
        x = "User Profile Clicks",
        caption = "Data & Graphic: @paulapivat"
    )

cor.test(x = df$`user profile clicks`, y = df$retweets)

# Replies (r = 0.40) ----
df %>%
    ggplot(aes(x = `user profile clicks`, y = replies)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between Replies & User Profile Clicks (r = 0.40)",
        subtitle = "Sept 01, 2020 - Jan 11, 2021",
        y = "Replies",
        x = "User Profile Clicks",
        caption = "Data & Graphic: @paulapivat"
    )

cor.test(x = df$`user profile clicks`, y = df$replies)

# Likes (r = 0.65) ----
df %>%
    ggplot(aes(x = `user profile clicks`, y = likes)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between Likes & User Profile Clicks (r = 0.65)",
        subtitle = "Sept 01, 2020 - Jan 11, 2021",
        y = "Likes",
        x = "User Profile Clicks",
        caption = "Data & Graphic: @paulapivat"
    )

cor.test(x = df$`user profile clicks`, y = df$likes)

# URL Clicks (r = 0.30) ----
df %>%
    ggplot(aes(x = `user profile clicks`, y = `url clicks`)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between URL Clicks & User Profile Clicks (r = 0.30)",
        subtitle = "Sept 01, 2020 - Jan 11, 2021",
        y = "URL Clicks",
        x = "User Profile Clicks",
        caption = "Data & Graphic: @paulapivat"
    )

cor.test(x = df$`user profile clicks`, y = df$`url clicks`)

# And Hashtag Clicks (r = 0.33) ----
df %>%
    ggplot(aes(x = `user profile clicks`, y = `hashtag clicks`)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between Hashtag Clicks & User Profile Clicks (r = 0.33)",
        subtitle = "Sept 01, 2020 - Jan 11, 2021",
        y = "Hashtag Clicks",
        x = "User Profile Clicks",
        caption = "Data & Graphic: @paulapivat"
    )

cor.test(x = df$`user profile clicks`, y = df$`hashtag clicks`)

# Detail Expands (r = 0.64) ----
df %>%
    ggplot(aes(x = `user profile clicks`, y = `detail expands`)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between Detail Expands & User Profile Clicks (r = 0.64)",
        subtitle = "Sept 01, 2020 - Jan 11, 2021",
        y = "Detail Expands",
        x = "User Profile Clicks",
        caption = "Data & Graphic: @paulapivat"
    )

cor.test(x = df$`user profile clicks`, y = df$`detail expands`)

# Media Views (r = 0.53) ----
df %>%
    ggplot(aes(x = `user profile clicks`, y = `media views`)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between Media Views & User Profile Clicks (r = 0.53)",
        subtitle = "Sept 01, 2020 - Jan 11, 2021",
        y = "Media Views",
        x = "User Profile Clicks",
        caption = "Data & Graphic: @paulapivat"
    )

cor.test(x = df$`user profile clicks`, y = df$`media views`)

# Media Engagements (r = 0.54) ----
df %>%
    ggplot(aes(x = `user profile clicks`, y = `media engagements`)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between Media Engagements & User Profile Clicks (r = 0.54)",
        subtitle = "Sept 01, 2020 - Jan 11, 2021",
        y = "Media Engagements",
        x = "User Profile Clicks",
        caption = "Data & Graphic: @paulapivat"
    )

cor.test(x = df$`user profile clicks`, y = df$`media engagements`)


# PIVOT LONGER ----
df %>%
    select(Date, `user profile clicks`, impressions, engagements, retweets, replies, likes) %>%
    pivot_longer(cols = 3:7, names_to = 'iv') %>%
    ggplot(aes(x = `user profile clicks`, y = value)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    facet_wrap(~iv, scales = 'free')

# CORRELELOGRAM ----

# native plot()
df %>%
    select(`user profile clicks`,3:4, 6:8, 10:12) %>%
    plot(pch = 20, cex = 1.5, col="#69b3a2")

# strongest
df %>%
    select(8, 12, 19:20, `user profile clicks`) %>%
    plot(pch = 20, cex = 1.5, col="#69b3a2")

# moderate
df %>%
    select(6:7, 10:11, `user profile clicks`) %>%
    plot(pch = 20, cex = 1.5, col="#69b3a2")

# GGally
# Documentation: https://www.rdocumentation.org/packages/GGally/versions/1.5.0/topics/ggpairs
library(GGally)


# GGally, Strongest Related
df %>%
    select(8, 12, 19:20, `user profile clicks`) %>%
    ggpairs(
        diag = NULL,
        title = "Strongest Relationships with User Profile Clicks: Sep 2020 - Jan 2021",
        axisLabels = c("internal"),
        xlab = "Value"
    )

# GGally, Least Related
df %>%
    select(6:7, 10:11, `user profile clicks`) %>%
    ggpairs(
        diag = NULL,
        title = "Moderate Relationships with User Profile Clicks: Sep 2020 - Jan 2021",
        axisLabels = c("internal"),
        xlab = "Value"
    )

# VISUALIZING ----
library(ggridges)

str(df)

# Ridge Plot
df %>%
    mutate(
        month = month(Date, label = TRUE, abbr = TRUE)
    ) %>% 
    # fill = ..x.. allows colors to show up
    ggplot(aes(x = impressions, y = month, fill = ..x.., group = month)) +
    geom_density_ridges_gradient(scale = 3, 
                                 rel_min_height = 0.01, 
                                 stat = 'density_ridges', 
                                 quantile_lines = TRUE,
                                 quantiles = 2) +
    scale_fill_viridis_c(option = 'C') +
    theme_minimal() +
    theme(
        legend.position = 'none'
    ) + 
    labs(
        title = "Twitter Impressions Over the Past Five Months",
        subtitle = "Sept 2020 - Jan 2021",
        caption = "Data & Visualization: @paulapivat",
        y = "",
        x = "Impressions"
    )




# Box Plot
df %>%
    mutate(
        month = month(Date, label = TRUE, abbr = TRUE)
    ) %>% 
    ggplot(aes(x = month, y = engagements, fill = month)) +
    geom_boxplot() +
    scale_fill_viridis_d(option = "C") +
    geom_jitter(color = 'black', size = 0.4, alpha = 0.9) +
    theme_minimal() +
    theme(
        legend.position = 'none'
    ) +
    labs(
        title = "Twitter Engagement Over the Past Five Months",
        subtitle = "Sept 2020 - Jan 2021",
        caption = "Data & Visualization: @paulapivat",
        y = "Engagements",
        x = ""
    )

# Violin
df %>%
    mutate(
        month = month(Date, label = TRUE, abbr = TRUE)
    ) %>% 
    ggplot(aes(x = month, y = engagements, fill = month)) +
    geom_violin()


# Area Chart
df %>%
    ggplot() +
    geom_area(aes(x = Date, y = engagements))


# Area Chart by Group
df %>%
    mutate(
        month = month(Date, label = TRUE, abbr = TRUE)
    ) %>% 
    ggplot(aes(x = Date, y = engagements, fill=month)) +
    geom_area()

# Stacked Area Chart
df %>%
    select(Date, 6:12) %>%
    pivot_longer(cols = 2:8, names_to = 'metrics') %>%
    ggplot(aes(x=Date, y=value, fill=metrics)) +
    geom_area()

# Stacked Area Chart (Percentage)
df %>%
    select(Date, 6:12) %>%
    pivot_longer(cols = 2:8, names_to = 'metrics') %>%
    ggplot(aes(x=Date, y=value, fill=metrics)) +
    geom_area(position = 'fill')



