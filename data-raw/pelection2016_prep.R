# Data from Gov 2000. Thanks Xiang! Leaving it messy on purpose.

library(tidyverse)

load("data-raw/pelection2016.RData")

votes_2016 <- as_tibble(pelection2016)

# usethis::use_data(votes_2016, overwrite = TRUE)
