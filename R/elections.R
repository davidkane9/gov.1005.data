#' County Presidential Election Results from 1960 through 2012
#'
#' A dataset presidential election results for each US county.
#'
#' @format A tibble with 43,494 rows and 7 variables:
#' \describe{
#'   \item{year}{calendar year of the election}
#'   \item{state}{US state (in all lower cases letters) in which county is located}
#'   \item{county}{US county (in all lower case letters). Note that different states often have counties with the same names.}
#'   \item{rep}{number of votes cast for the Republican candidate}
#'   \item{dem}{number of votes cast for the Democratic candidate}
#'   \item{other}{number of votes cast for other candidates}
#'   \item{rep_per}{percentage of all votes cast for the Republican candidate}
#' }
#' @source \url{http://qss.princeton.press/}
"elections"
