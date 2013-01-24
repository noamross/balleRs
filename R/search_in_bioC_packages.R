#' @import plyr plyr
#' @export
search_in_bioC_packages <- function(names, pandoc=TRUE) {
  
  mytemp <- tempfile()
  download.file("http://bioconductor.org/packages/release/bioc/VIEWS", mytemp)
  mydata <- as.data.frame(read.dcf(mytemp), row.names=NA, stringsAsFactors=FALSE)
  rows <- matrix(FALSE, nrow(mydata), ncol(mydata))
  for(name in names) {
    rows <- rows | grepl(name, as.matrix(mydata))
  }
  if(!any(rows)) {
    Message("No matches found")
    return()
  }
  matches <- which(rowSums(rows) > 0)
  mydata <- mydata[matches,]
  rows <- rows[matches,,drop=FALSE]
  Matches <- aaply(1:length(matches), 1, function(x) paste("\n", names(mydata)[which(rows[x,])],": ", mydata[x,which(rows[x,])],sep="", collapse="\n" ))
  output <- cbind(mydata[,c("Package","Title")], Matches)
  rownames(output) <- NULL
  if(pandoc) {
    pandoc.table(output, split.tables=Inf)
  } else {
    mydata
  }
}