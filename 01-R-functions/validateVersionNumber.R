#' @name validateVersionNumber
#' @title Check that the string giving the R Version number is a valid format
#'
#' @description Checks that the string provided by the user follows the
#'   x.y.z version number format.
#' 
#' @param version \code{character} of version numbers. 
#' 

validateVersionNumber <- function(version){
  version <- trimws(version)
  
  if any((!grepl("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}$", version))){
    stop("Version number must be in x.y.z format")
  }
  
  version
}
