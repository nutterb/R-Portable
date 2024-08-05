#' @name downloadInstallR
#' @title Download and start the R Installer
#' 
#' @description Downloads an R installer and starts the installation executable.
#' 
#' @param 

downloadInstallR <- function(version, install = TRUE){
  tmp <- tempfile(fileext = ".exe")
  
  url_base <- "https://cran.r-project.org/bin/windows/base/old/%s/R-%s-win.exe"
  url <- sprintf(url_base, 
                 version, 
                 version)
  
  download.file(url, 
                destfile = tmp, 
                mode = "wb", 
                quiet = TRUE)
  
  if (install){
    shell(shQuote(tmp))
  }
}