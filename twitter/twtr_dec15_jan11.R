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


