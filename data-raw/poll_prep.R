# Script showing how to work with 538 Trump polling data. Not sure if we should
# have the students start from scratch or from a clean data set.

# https://projects.fivethirtyeight.com/trump-approval-data/approval_polllist.csv

# https://fivethirtyeight.com/features/how-were-tracking-donald-trumps-approval-ratings/

library(tidyverse)
library(lubridate)
x <- read_csv("https://projects.fivethirtyeight.com/trump-approval-data/approval_polllist.csv",
              guess_max = 100000) %>%
  select(enddate, adjusted_approve, adjusted_disapprove)

x %>%
  mutate(date = mdy(enddate)) %>%
  select(-enddate) %>%
  ggplot() + geom_point(aes(y = adjusted_approve, x = date), alpha = 0.1, size = 0.1) +
  geom_smooth(aes(y = adjusted_approve, x = date), method = "loess", se = TRUE, level = 0.99)

