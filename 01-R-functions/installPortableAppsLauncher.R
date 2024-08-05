#' @name installPortableAppsLauncher
#' @title Install the Portable Apps Launcher
#' 
#' @description Download and install the Portable Apps Launcher. This 
#'   is required to write the executable for the Portable Apps Framework.
#'   The program is saved into the working directory.
#'   
#' @param url The URL from which to download the launcher. If \code{NULL}, 
#'   it uses what was known in August 2024.
installPortableAppsLauncher <- function(url = NULL){
  if (is.null(url))
    url <- "https://portableapps.com/redir2/?a=PortableApps.comLauncher&s=s&d=pa&f=PortableApps.comLauncher_2.2.9.paf.exe"
  
  if (!dir.exists("PortableApps.comLauncher")){
    download.file(url, 
                  destfile = "PortableApps.comLauncher.paf.exe", 
                  mode = "wb", 
                  quiet = TRUE)
    
    shell(shQuote("PortableApps.comLauncher.paf.exe"))
  }
}
