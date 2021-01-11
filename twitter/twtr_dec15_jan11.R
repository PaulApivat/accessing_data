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
    
