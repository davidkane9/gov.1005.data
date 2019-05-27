


simulate_null <- function(data, cause, result,
                          include_actual = FALSE,
                          type = "all",
                          n){

  # complete() might be useful. also expand()

  # need to learn how to write tidy-compatible functions.

  # We do not force the inclusion of the input data in the output, although it
  # will be included with type = "all", nor do we label the input data. If
  # include_actual = TRUE, we do three things. First, we add a new variable,
  # "actual", which is TRUE for the input data and FALSE otherwise. Second, we
  # ensure that the input data is included, and place it at the top of the
  # result. (We might also want to ensure that there is only one copy of the
  # input data or, at least, ensure that input data only appears once.)

  # https://dplyr.tidyverse.org/articles/programming.html

  # By default, type is "all", which means that we don't want/need a value for
  # n. (So, providing an n without changing type should cause an error.) One
  # danger is that the total number of permutations is too large. If it is, we
  # should probably just create an error.

  # The other two possibilities for all are "permute" and "probability". For
  # permute, we just permute the causes. With "probabilty", we create a
  # probability vector for the input frequency of the different causes. We then
  # sample using this probability. In both cases, we return n samples.

  # Now that I look more closely, it is clear that infer does most (all?) of
  # what I want, so there is no reason for my own function. One thing the
  # generate() function does not seem to have is an elegant way to keep around
  # (and or make use of) the actual result. That is, how does it know (later)
  # which permutation is the actual assignment?


}
