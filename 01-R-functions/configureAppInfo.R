#' @name configureAppInfo
#' @title Write Configuration Files for R Portable
#' 
#' @description Writes the configuration files for the R-Portable app based
#'   on the version number.
#' 
#' @param version \code{character} in the form x.y.z
#' @param app_name \code{character} in the form R-x.y.z
#' @param dir \code{character} the directory to which R Portable is installed
#' @param template_dir \code{character} the location of the folder with the
#'   configuration templates.

configureAppInfo <- function(version, 
                             app_name,
                             dir = getwd(), 
                             template_dir = file.path(getwd(), "00-Templates")){
  appinfo <- readLines(file.path(template_dir, 
                                 "appinfo-template.ini"))
  
  appinfo <- sub("INSERT_VERSION_HERE", 
                 version, 
                 appinfo)
  
  write(appinfo, 
        file.path(dir, app_name, "App", "AppInfo", "appinfo.ini"))
  
  
  
  launcher <- readLines(file.path(template_dir, 
                                  "RPortable-template.ini"))
  launcher <- sub("INSERT_VERSION_HERE", 
                  version, 
                  launcher)
  write(launcher, 
        file.path(dir, app_name, "App", "AppInfo", "Launcher", 
                  paste0(app_name, ".ini")))
}