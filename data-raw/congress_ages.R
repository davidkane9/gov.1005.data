# The data about Congressional ages from the 538 package is a little too hard
# for students to work with in week 2. So, I make a couple of simplifications.

library(lubridate)
library(fivethirtyeight)

data("congress_age")

x <- congress_age %>%
  select(-suffix, -bioguide, -birthday, -middlename, -congress, -state) %>%
  mutate(year = year(termstart)) %>%
  select(year, party, firstname, lastname, age, incumbent, chamber)

congress <- x
usethis::use_data(congress, overwrite = TRUE)
