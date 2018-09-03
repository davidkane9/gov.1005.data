# Script for creating elections data

# I am using data from QSS by Imai.

# See http://qss.princeton.press/ for details.

library(tidyverse)
x <- read_csv("data-raw/elections.csv")
x$rep_per <- x$rep / (x$rep + x$dem + x$other)

elections <- x
usethis::use_data(elections)

# Starter code

elections %>%
  filter(county == "westchester") %>%
  ggplot(aes(x = year, y = rep_per)) + geom_point()
