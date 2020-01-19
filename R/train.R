#' Attitude changes toward immigrants.
#'
#' Data for changes in attitude toward immigration-related policies after
#' exposure to Spanish-speakers on a Boston commuter train, from Enos (2016).
#' Individuals with a treatment value of "Treated" were exposed to a
#' Spanish-speaker on their regular commute. "Control" individuals were not.
#'
#' @format A tibble with 115 observations and 9 variables:
#' \describe{
#'   \item{male}{0/1 variable with 1 meaning male}
#'   \item{liberal}{0/1 variable with 1 meaning liberal}
#'   \item{republican}{0/1 variable with 1 meaning Republican}
#'   \item{age}{numeric variable for age in years}
#'   \item{income}{numeric variable for  family income in dollars}
#'   \item{treatment}{factor variable with two values: Treated and Control}
#'   \item{att_start}{Starting attitude toward immigration issues. Uses a 3 to 15 scale, with higher numbers meaning more conservative.}
#'   \item{att_end}{Ending attitude toward immigration issues. Uses a 3 to 15 scale, with higher numbers meaning more conservative.}
#'   \item{att_chg}{Change in attitude toward immigration issues. Positive means becoming more conservative.}
#' }
#' @source \url{https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/DOP4UB}
#'
"train"
