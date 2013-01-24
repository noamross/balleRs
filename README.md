This is the repository for my R Package **balleRs**, which provides tools for
finding high-power R users.  It's just getting started - there's only a coule of
functions here.

To use:

    install.packages("devtools")
    library(devtools)
    install_github("balleRs","noamross")
    library(balleRs)
    search_in_bioC_packages("ucdavis.edu")
    search_in_CRAN_packages("ucdavis.edu")