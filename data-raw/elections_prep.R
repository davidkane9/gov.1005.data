# Script for creating elections data

# I am using data from MIT Election Data project. Why is so hard to find a
# simple, free dataset of this? Five elections is OK, but not that good.


library(tidyverse)
load("countypres_2000-2016.RData")

raw <- x

x <- raw %>%
  as_tibble() %>%
  select(-state_po, -FIPS, -office, -version, -candidate, -totalvotes) %>%
  filter(party %in% c("democrat", "republican")) %>%
  pivot_wider(names_from = party,
              values_from = candidatevotes) %>%
  mutate(votes = republican + democrat)

x$rep_per <- x$rep / (x$rep + x$dem + x$other)

elections <- x
usethis::use_data(elections)

# Starter code

elections %>%
  filter(county == "westchester") %>%
  ggplot(aes(x = year, y = rep_per)) + geom_point()
