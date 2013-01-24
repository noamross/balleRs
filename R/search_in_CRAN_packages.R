#' @import plyr pander
#' @export
search_in_CRAN_packages <- function(names, pandoc=TRUE) {

  mytemp <- tempfile()
  download.file("http://cran.r-project.org/web/packages/packages.rds", mytemp)
  mydata <- as.data.frame(readRDS(mytemp), row.names=NA, stringsAsFactors=FALSE)
  rows <- matrix(FALSE, nrow(mydata), ncol(mydata))
  for(name in names) {
    rows <- rows | grepl(name, as.matrix(mydata))
  }
  matches <- which(rowSums(rows) > 0)
  mydata <- mydata[matches,]
  rows <- rows[matches,]
  Matches <- aaply(1:length(matches), 1, function(x) paste("\n", names(mydata)[which(rows[x,])],": ", mydata[x,which(rows[x,])],sep="", collapse="\n" ))
  output <- cbind(mydata[,c("Package","Title")], Matches)
  rownames(output) <- NULL
  if(pandoc) {
    pandoc.table(output, split.tables=Inf)
  } else {
    mydata
  }
 }