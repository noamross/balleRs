#' Finding Nearby R Package Authors
#' ===============================
#' 
#' As I'm organizing 
#' [my local R users' group](http://www.noamross.net/davis-r-users-group.html), 
#' I got interested in learning who at UC Davis was active in the R community. 
#' One thought I had was to look up what R packages were written by people at 
#' UC Davis, so I wrote a function to look this up in CRAN:
#' 
## @knitr 
require(balleRs)
search_in_CRAN_packages

#' 
#' 
#' The function takes a vector of strings and returns a nicely formatted table 
#' (in pandoc format, thanks to the `pander` package) of packages and the fields
#' that contain those strings.  to search for local authors, I search for my
#' school name and its domain:
#' 
## @knitr results='asis'
search_in_CRAN_packages(c("UC Davis", "ucdavis.edu"))

#' 
#' 
#' Now I do the same thing for Bioconductor authors:
#' 
## @knitr results='asis'
search_in_bioC_packages(c("UC Davis", "ucdavis.edu")) 

#' 
#' 
#' Pretty cool!  These aren't perfect.  For instance, I know that Duncan Temple 
#' Lang, here at the UC Davis Statistics Department, is the author of [a number 
#' of other packages](http://crantastic.org/authors/28).  I see on CRAN, though,
#' that he lists his email as `duncan at r-project.org` on the XML package and 
#' probably a few others.  
#' [Carl Boettiger has a few, too](http://crantastic.org/authors/2009), but he 
#' lists his gmail account.
#' 
#' I've put this function as the start of a package called ["balleRs" on 
#' github](https://github.com/noamross/balleRs).  I want to add a bunch of other
#' tools to find poweR users on the web, such as scraping the R-help archives, 
#' Stack Overflow, and Cross-Validated, and maybe github
#' 
