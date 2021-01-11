library(tidyverse)
library(lubridate)

# load data
df <- read_csv("daily_tweet_metrics_20201215_20210112_en.csv")

# relation published and impressions
df %>%
    ggplot(aes(x = `Tweets published`, y = impressions)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between Tweets Published & Impressions",
        subtitle = "Dec 15, 2020 - Jan 11, 2021",
        y = "Impressions",
        x = "Tweets Published",
        caption = "Data & Graphic: @paulapivat"
    )

# relation published and engagement
df %>%
    ggplot(aes(x = `Tweets published`, y = engagements)) +
    geom_point(position = 'jitter')

df %>%
    ggplot(aes(x = `Tweets published`, y = engagements)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between Tweets Published & Engagements",
        subtitle = "Dec 15, 2020 - Jan 11, 2021",
        y = "Engagements",
        x = "Tweets Published",
        caption = "Data & Graphic: @paulapivat"
    )

# relation impressions and engagements
df %>%
    ggplot(aes(x = impressions, y = engagements)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between Impressions & Engagements",
        subtitle = "Dec 15, 2020 - Jan 11, 2021",
        y = "Engagements",
        x = "Impressions",
        caption = "Data & Graphic: @paulapivat"
    )




# relation engagement and media engagement
df %>%
    ggplot() +
    geom_point(aes(x = `media engagements`, y = engagements), position = 'jitter') 

df %>%
    ggplot(aes(x = `media engagements`, y = engagements)) +
    geom_point(color = 'red') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between Engagements & Media Engagements",
        subtitle = "Dec 15, 2020 - Jan 11, 2021",
        y = "Engagements",
        x = "Media Engagements",
        caption = "Data & Graphic: @paulapivat"
    )

# pivot_longer for published, impressions, engagement
df %>%
    select(1:4) %>%
    pivot_longer(cols = 2:4, names_to = 'metrics') %>%
    ggplot(aes(x = Date, y = value, fill = metrics)) +
    geom_bar(stat = 'identity', position = 'stack') +
    # geom_text represents Tweets published only
    geom_text(aes(label = ifelse(metrics=='Tweets published', value, '')), vjust = -1) +
    theme(legend.position = 'bottom')


# USER PROFILE CLICKS ----

# And Engagement
df %>%
    ggplot(aes(x = `user profile clicks`, y = engagements)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between Engagements & User Profile Clicks (r = 0.56)",
        subtitle = "Dec 15, 2020 - Jan 11, 2021",
        y = "Engagements",
        x = "User Profile Clicks",
        caption = "Data & Graphic: @paulapivat"
    )

cor.test(x = df$`user profile clicks`, y = df$engagements)

# And Impressions
df %>%
    ggplot(aes(x = `user profile clicks`, y = impressions)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between Impressions & User Profile Clicks (r = 0.34)",
        subtitle = "Dec 15, 2020 - Jan 11, 2021",
        y = "Impressions",
        x = "User Profile Clicks",
        caption = "Data & Graphic: @paulapivat"
    )

cor.test(x = df$`user profile clicks`, y = df$impressions)

# And Tweets Published
df %>%
    ggplot(aes(x = `user profile clicks`, y = `Tweets published`)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between Tweets Published & User Profile Clicks (r = 0.43)",
        subtitle = "Dec 15, 2020 - Jan 11, 2021",
        y = "Tweets Published",
        x = "User Profile Clicks",
        caption = "Data & Graphic: @paulapivat"
    )

cor.test(x = df$`user profile clicks`, y = df$`Tweets published`)

# And Retweets
df %>%
    ggplot(aes(x = `user profile clicks`, y = retweets)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between Retweets & User Profile Clicks (r = 0.37)",
        subtitle = "Dec 15, 2020 - Jan 11, 2021",
        y = "Retweets",
        x = "User Profile Clicks",
        caption = "Data & Graphic: @paulapivat"
    )

cor.test(x = df$`user profile clicks`, y = df$retweets)

# And Replies
df %>%
    ggplot(aes(x = `user profile clicks`, y = replies)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between Replies & User Profile Clicks (r = 0.33)",
        subtitle = "Dec 15, 2020 - Jan 11, 2021",
        y = "Replies",
        x = "User Profile Clicks",
        caption = "Data & Graphic: @paulapivat"
    )

cor.test(x = df$`user profile clicks`, y = df$replies)

# And Likes
df %>%
    ggplot(aes(x = `user profile clicks`, y = likes)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between Likes & User Profile Clicks (0.65)",
        subtitle = "Dec 15, 2020 - Jan 11, 2021",
        y = "Likes",
        x = "User Profile Clicks",
        caption = "Data & Graphic: @paulapivat"
    )

cor.test(x = df$`user profile clicks`, y = df$likes)

# And URL Clicks
df %>%
    ggplot(aes(x = `user profile clicks`, y = `url clicks`)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between URL Clicks & User Profile Clicks (r = 0.0)",
        subtitle = "Dec 15, 2020 - Jan 11, 2021",
        y = "URL Clicks",
        x = "User Profile Clicks",
        caption = "Data & Graphic: @paulapivat"
    )

cor.test(x = df$`user profile clicks`, y = df$`url clicks`)

# And Hashtag Clicks
df %>%
    ggplot(aes(x = `user profile clicks`, y = `hashtag clicks`)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between Hashtag Clicks & User Profile Clicks (r = 0.42)",
        subtitle = "Dec 15, 2020 - Jan 11, 2021",
        y = "Hashtag Clicks",
        x = "User Profile Clicks",
        caption = "Data & Graphic: @paulapivat"
    )

cor.test(x = df$`user profile clicks`, y = df$`hashtag clicks`)

# And Detail Expands
df %>%
    ggplot(aes(x = `user profile clicks`, y = `detail expands`)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between Detail Expands & User Profile Clicks (r = 0.35)",
        subtitle = "Dec 15, 2020 - Jan 11, 2021",
        y = "Detail Expands",
        x = "User Profile Clicks",
        caption = "Data & Graphic: @paulapivat"
    )

cor.test(x = df$`user profile clicks`, y = df$`detail expands`)

# And Media Views
df %>%
    ggplot(aes(x = `user profile clicks`, y = `media views`)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between Media Views & User Profile Clicks (r = 0.44)",
        subtitle = "Dec 15, 2020 - Jan 11, 2021",
        y = "Media Views",
        x = "User Profile Clicks",
        caption = "Data & Graphic: @paulapivat"
    )

cor.test(x = df$`user profile clicks`, y = df$`media views`)

# And Media Engagements
df %>%
    ggplot(aes(x = `user profile clicks`, y = `media engagements`)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE) +
    theme_minimal() +
    labs(
        title = "Relationship between Media Engagements & User Profile Clicks (r = 0.45)",
        subtitle = "Dec 15, 2020 - Jan 11, 2021",
        y = "Media Engagements",
        x = "User Profile Clicks",
        caption = "Data & Graphic: @paulapivat"
    )

cor.test(x = df$`user profile clicks`, y = df$`media engagements`)


