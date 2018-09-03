# Script for creating harvard_courses data.

# Thanks to Registrar Mike Burke for permission and to Alpha Sanneh for data
# preparation.

# The key difference is that clean has all the html tags removed from the
# description field while raw does not. Not sure if that is the only difference
# . . .

# Alpha writes: Take a look at the data attached. It is 15yrs of course offering
# data across FAS by term and department.  The criteria used to pull the data is
# as follows:

# The class has a meeting pattern

# The class is enrollable meaning students have to be able to enroll in the
# class

# The class is schedule to print meaning it has to be available on the schedule
# for a specific term so students can see it and be able to register for it

# There is a column labelled max term and that is the term. The numbers are 4
# digits and the way to interpret;  first digit is the century, two middle
# digits year and the last digit term.

# For example fall 2018 is designated – 2188; 2 – century; 18 – year; 8 – fall
# term. Spring 2018 will be 2182; 2 – century; 18 – year; 2 – spring term


library(tidyverse)
x <- readxl::read_xlsx("data-raw/harvard_courses_clean.xlsx", skip = 1)

x %>%
  select(-c(INSTITUTION, `INSTRUCTOR ROLE`)) %>%
  rename(org = `ACADEMIC ORGANIZATION`,
         id = `COURSE ID`,
         subject = `SUBJECT`,
         number = `Catalog`,
         title = `COURSE TITLE`,
         enrollment = `TOTAL ENROLLMENTS`,
         instructor = `INSTRUCTOR NAME`,
         term_code = `MAX TERM`) %>%
  mutate(century = ifelse(substr(term_code, 1, 1) == 1, 1900, 2000)) %>%
  mutate(year = century + as.numeric(substr(term_code, 2, 3))) %>%
  mutate(term = case_when(
    substr(term_code, 4, 4) == 2 ~ "spring",
    substr(term_code, 4, 4) == 8 ~ "fall",
    TRUE ~ "other")) %>%
  filter(term != "other") %>%
  filter(! (term == "fall" & year == 2018)) %>%
  filter(! enrollment == 0) %>%
  select(year, term, subject, title, enrollment, instructor) -> y

# courses <- y
# usethis::use_data(courses)


