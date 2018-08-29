# Script for creating data for Lecture 1.

# I am using data from

# See http://qss.princeton.press/ for details.

library(tidyverse)
x <- read_csv("data-raw/elections.csv")
x$rep_per <- x$rep / (x$rep + x$dem + x$other)

elections <- x
usethis::use_data(elections)
