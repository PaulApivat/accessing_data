library(tidyverse)
library(lubridate)

# load data
df <- read_csv("daily_tweet_metrics_20201215_20210112_en.csv")

# relation published and impressions
df %>%
    ggplot(aes(x = `Tweets published`, y = impressions)) +
    geom_point(position = 'jitter') 

# relation published and engagement
df %>%
    ggplot(aes(x = `Tweets published`, y = engagements)) +
    geom_point(position = 'jitter')

df %>%
    ggplot(aes(x = `Tweets published`, y = engagements)) +
    geom_point(color = 'red', position = 'jitter') +
    geom_smooth(method = 'lm', se = FALSE)

# relation engagement and media engagement
df %>%
    ggplot() +
    geom_point(aes(x = `media engagements`, y = engagements), position = 'jitter') 

df %>%
    ggplot(aes(x = `media engagements`, y = engagements)) +
    geom_point(color = 'red') +
    geom_smooth(method = 'lm', se = FALSE)

# pivot_longer for published, impressions, engagement
df %>%
    select(1:4) %>%
    pivot_longer(cols = 2:4, names_to = 'metrics') %>%
    ggplot(aes(x = Date, y = value, fill = metrics)) +
    geom_bar(stat = 'identity', position = 'stack') +
    # geom_text represents Tweets published only
    geom_text(aes(label = ifelse(metrics=='Tweets published', value, '')), vjust = -1)
