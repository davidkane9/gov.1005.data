# Script which cleans up the Q Scores json file. This is purposely simplied data
# since I use it on the second day of classes.

library(tidyverse)
library(jsonlite)
library(janitor)
library(usethis)

x <- read_json("q_scores.json", simplifyDataFrame = TRUE, flatten = TRUE) %>%
  as_tibble() %>%
  clean_names() %>%
  select(-meeting_days, -meeting_times, -enrolled, -grading_basis) %>%
  rename(overall = evaluations_overall,
         workload = evaluations_workload,
         number = evaluations_amount) %>%
  mutate(overall = parse_number(overall, na = "None"),
         workload = parse_number(workload, na = "None"),
         number = parse_number(number, na = "None"))

# Code for saving object

qscores <- x
usethis::use_data(qscores)

