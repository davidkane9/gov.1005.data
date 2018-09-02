#' County Presidential Election Results from 1960 through 2012
#'
#' A dataset presidential election results for each US county.
#'
#' @format A tibble with 43,494 rows and 7 variables:
#' \describe{
#'   \item{year}
#'   \item{state}
#'   \item{county}
#'   \item{rep}{number of votes cast for the Republican candidate}
#'   \item{dem}{number of votes cast for the Democratic candidate}
#'   \item{other}{number of votes cast for other candidates}
#'   \item{rep_per}{percentage of all votes cast for the Republican candidate}
#' }
#' @source \url{http://qss.princeton.press/}
"elections"
