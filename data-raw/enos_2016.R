# Script which cleans up the raw data from Enos (2016). This is mostly taken
# from Exam 2 in Fall 2019.

library(tidyverse)
library(usethis)

x <- read_csv("pnas_data.csv",
                  col_types = cols(
                    .default = col_double(),
                    male = col_integer(),
                    liberal = col_integer(),
                    republican = col_integer(),
                    treated_unit = col_character(),
                    t.time = col_character(),
                    assignment = col_character(),
                    line.y = col_character(),
                    station = col_character(),
                    train = col_character(),
                    time = col_time(format = ""),
                    time.treatment = col_character()
                  )) %>%

  # We really only need a handful of these variables.

  select(numberim.x, Remain.x, Englishlan.x,
         numberim.y, Remain.y, Englishlan.y,
         treatment, liberal, republican, age,
         male, income.new) %>%

  # Create an overall measure of attitude change. Positive means becoming more
  # conservative. Should we normalize this number? Should we allow for an NA in
  # one or two of the three questions? We only lose 8 of the 123 observations
  # right now. But could rescue three of these if we allowed number_diff to be
  # NA. Only 5 are truly NAs, meaning the person did not answer any ogf the
  # three questions on the second survey.

  mutate(att_start = numberim.x + Remain.x + Englishlan.x,
         att_end = numberim.y + Remain.y + Englishlan.y,
         att_chg = att_end - att_start) %>%

  # Delete component parts that we no longer need.

  select(- starts_with("numberim")) %>%
  select(- starts_with("Remain")) %>%
  select(- starts_with("Englishlan")) %>%

  # Handling NAs is always tricky. I should make it easy to see if saving the
  # three savable rows makes a substantive difference to any conclusion. But,
  # for this exam, I will only keep the 115 observations for which we have all
  # the data.

  drop_na(att_chg) %>%

  rename(income = income.new) %>%

  # Stuff that becomes handy later. It is important to understand that sometimes
  # we are happy to work with treatment as a numeric variable with vales of zero
  # and one. But, other times, we want it to be a factor. And, once we decide we
  # need a factor, we might as well create a "proper" factor with named levels.
  # In this case, I will keep both versions of treatment around: treatment and
  # treatment.2.

  mutate(treatment.2 = ifelse(treatment == 1, "Treated", "Control")) %>%
  mutate(treatment.2 = factor(treatment.2, levels = c("Treated", "Control"))) %>%

  select(-treatment) %>%
  rename(treatment = treatment.2) %>%

  select(male, liberal, republican, age, income,
         treatment, att_start, att_end, att_chg)


# Code for saving object

train <- x
usethis::use_data(train, overwrite = TRUE)

