Finding Nearby R Package Authors
===============================

As I'm organizing [my local R users' group](http://www.noamross.net/davis-r-users-group.html), I got interested in learning who at UC Davis was active in the R community.  One thought I had was to look up what R packages were written by people at UC Davis, so I wrote a function to look this up in CRAN:


```r
require(balleRs)
```

```
## Loading required package: balleRs
```

```r
search_in_CRAN_packages
```

```
## function (names, pandoc = TRUE) 
## {
##     mytemp <- tempfile()
##     download.file(paste0(options("repos")$repos, "/web/packages/packages.rds"), 
##         mytemp)
##     mydata <- as.data.frame(readRDS(mytemp), row.names = NA, 
##         stringsAsFactors = FALSE)
##     rows <- matrix(FALSE, nrow(mydata), ncol(mydata))
##     for (name in names) {
##         rows <- rows | grepl(name, as.matrix(mydata))
##     }
##     matches <- which(rowSums(rows) > 0)
##     mydata <- mydata[matches, ]
##     rows <- rows[matches, ]
##     Matches <- aaply(1:length(matches), 1, function(x) paste("\n", 
##         names(mydata)[which(rows[x, ])], ": ", mydata[x, which(rows[x, 
##             ])], sep = "", collapse = "\n"))
##     output <- cbind(mydata[, c("Package", "Title")], Matches)
##     rownames(output) <- NULL
##     if (pandoc) {
##         pandoc.table(output, split.tables = Inf)
##     }
##     else {
##         mydata
##     }
## }
## <environment: namespace:balleRs>
```


The function takes a vector of strings and returns a nicely formatted table (in pandoc format, thanks to the `pander` package) of packages and the fields that contain those strings.  to search for local authors, I search for my school name and its domain:


```r
search_in_CRAN_packages(c("UC Davis", "ucdavis.edu"))
```


------------------------------------------------------------------------------
Package     Title                         Matches                             
----------- ----------------------------- ------------------------------------
aqp         Algorithms for Quantitative   Author: Dylan Beaudette             
            Pedology                      <debeaudette@ucdavis.edu>,          
                                          Pierre Roudier                      
                                          <roudierp@landcareresearch.co.nz>   
                                                                              
                                          Maintainer: Dylan Beaudette         
                                          <debeaudette@ucdavis.edu>           

BINCO       Bootstrap Inference for       Author: Shuang Li                   
            Network COstruction           <shuangli@fhcrc.org>,Li Hsu         
                                          <lih@fhcrc.org>, Jie Peng           
                                          <jiepeng@ucdavis.edu>, Pei          
                                          Wang <pwang@fhcrc.org>              

cimis       R package for retrieving data Author: Greg Hirson                 
            from CIMIS                    <ghirson@ucdavis.edu>               
                                                                              
                                          Maintainer: Greg Hirson             
                                          <ghirson@ucdavis.edu>               

fpca        Restricted MLE for Functional Author: Jie Peng                    
            Principal Components Analysis <jie@wald.ucdavis.edu> ,            
                                          Debashis Paul                       
                                          <debashis@wald.ucdavis.edu>         
                                                                              
                                          Maintainer: Jie Peng                
                                          <jie@wald.ucdavis.edu>              
                                                                              
                                          URL:                                
                                          anson.ucdavis.edu/~jie/software.html

FTICRMS     Programs for Analyzing        Maintainer: Don Barkauskas          
            Fourier Transform-Ion         <barkda@wald.ucdavis.edu>           
            Cyclotron Resonance Mass                                          
            Spectrometry Data                                                 

maxent      Low-memory Multinomial        Maintainer: Timothy P. Jurka        
            Logistic Regression with      <tpjurka@ucdavis.edu>               
            Support for Text                                                  
            Classification                                                    

nparLD      Nonparametric Analysis of     Author: Kimihiro Noguchi            
            Longitudinal Data in          <kinoguchi@ucdavis.edu>,            
            Factorial Experiments         Mahbub Latif                        
                                          <mlatif@gwdg.de>,                   
                                          Karthinathan Thangavelu             
                                          <kthanga@gwdg.de>, Frank            
                                          Konietschke                         
                                          <fkoniet@gwdg.de>, Yulia R.         
                                          Gel <ygl@math.uwaterloo.ca>,        
                                          Edgar Brunner                       
                                          <brunner@ams.med.uni-goettingen.de> 
                                                                              
                                          Maintainer: Kimihiro Noguchi        
                                          <kinoguchi@ucdavis.edu>             

remMap      Regularized Multivariate      Author: Jie Peng                    
            Regression for Identifying    <jie@wald.ucdavis.edu>, Pei         
            Master Predictors             Wang <pwang@fhcrc.org>, Ji          
                                          Zhu <jizhu@umich.edu>               

RGtk2       R bindings for Gtk 2.8.0 and  Author: Michael Lawrence            
            above                         <michafla@gene.com> and             
                                          Duncan Temple Lang                  
                                          <duncan@wald.ucdavis.edu>           

RLastFM     R interface to last.fm API    Author: Greg Hirson                 
                                          <ghirson@ucdavis.edu>               
                                                                              
                                          Maintainer: Greg Hirson             
                                          <ghirson@ucdavis.edu>               

robust      Insightful Robust Library     Author: Jiahui Wang, Ruben          
                                          Zamar <ruben@stat.ubc.ca>,          
                                          Alfio Marazzi                       
                                          <Alfio.Marazzi@inst.hospvd.ch>,     
                                          Victor Yohai                        
                                          <vyohai@dm.uba.ar>, Matias          
                                          Salibian-Barrera                    
                                          <matias@stat.ubc.ca>, Ricardo       
                                          Maronna                             
                                          <maron@mate.unlp.edu.ar>,           
                                          Eric Zivot                          
                                          <ezivot@u.washington.edu>,          
                                          David Rocke                         
                                          <dmrocke@ucdavis.edu>, Doug         
                                          Martin <doug@statsci.com>,          
                                          Martin Maechler                     
                                          <maechler@stat.math.ethz.ch>,       
                                          Kjell Konis                         
                                          <kjell.konis@me.com>                

RTextTools  Automatic Text Classification Maintainer: Timothy P. Jurka        
            via Supervised Learning       <tpjurka@ucdavis.edu>               

SearchTrees Spatial Search Trees          Maintainer: Gabriel Becker          
                                          <gmbecker@ucdavis.edu>              

space       Sparse PArtial Correlation    Author: Jie Peng                    
            Estimation                    <jie@wald.ucdavis.edu> , Pei        
                                          Wang <pwang@fhcrc.org>,             
                                          Nengfeng Zhou                       
                                          <nfzhou@umich.edu>, Ji Zhu          
                                          <jizhu@umich.edu>                   

wq          Exploring water quality       Maintainer: Alan Jassby             
            monitoring data               <adjassby@ucdavis.edu>              
------------------------------------------------------------------------------


Now I do the same thing for Bioconductor authors:


```r
search_in_bioC_packages(c("UC Davis", "ucdavis.edu"))
```


------------------------------------------------------------------------------
Package   Title                       Matches                                 
--------- --------------------------- ----------------------------------------
LMGene    LMGene Software for Data    Maintainer: Blythe                      
          Transformation and          Durbin-Johnson                          
          Identification of           <bpdurbin@ucdavis.edu>                  
          Differentially Expressed                                            
          Genes in Gene Expression    URL:                                    
          Arrays                      http://dmrocke.ucdavis.edu/software.html

TypeInfo  Optional Type Specification Maintainer: Duncan Temple               
          Prototype                   Lang                                    
                                      <duncan@wald.ucdavis.edu>               

qrqc      Quick Read Quality Control  Maintainer: Vince Buffalo               
                                      <vsbuffalo@ucdavis.edu>                 
------------------------------------------------------------------------------


Pretty cool!  These aren't perfect.  For instance, I know that Duncan Temple Lang, here at the UC Davis Statistics Department, is the author of [a number of other packages](http://crantastic.org/authors/28).  I see on CRAN, though, that he lists his email as `duncan at r-project.org` on the XML package and probably a few others.  [Carl Boettiger has a few, too](http://crantastic.org/authors/2009), but he lists his gmail account.

I've put this function as the start of a package called ["balleRs" on github](https://github.com/noamross/balleRs).  I want to add a bunch of other tools to find poweR users on the web, such as scraping the R-help archives, Stack Overflow, and Cross-Validated.

