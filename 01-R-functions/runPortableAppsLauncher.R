#' @name runPortableAppsLauncher
#' @title Run the Portable Apps Launcher
#' 
#' @description Runs the portable app launcher to make the R Portable 
#'   executable.
#'
#' @param app_name the name of the app in R-x.y.z format.
#' @param dir the directory to which the Portable app is being installed.

runPortableAppsLauncher <- function(app_name, dir){
  exec <- paste(file.path(getwd(), "PortableApps.comLauncher", 
                          "PortableApps.comLauncherGenerator.exe"), 
                file.path(INSTALL_TO, app_name))
  exec <- gsub("/", "\\\\", exec)
  shell(shQuote(exec))
}
