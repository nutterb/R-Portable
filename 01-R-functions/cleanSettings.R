#' @name cleanSettings
#' @title Clean Settings from Portable Apps Launcher
#' 
#' @description The Portable Apps Launcher leaves a file at 
#'   "Data/settings/R-x.y.zSetting.ini" that includes the last 
#'   known launch location for the app. Running this function cleans any 
#'   references to the local system.
#'   
#' @param app_name the App name in R-x.y.z format.
#' @param dir The directory to which R Portable is being installed.
#' 
cleanSettings <- function(app_name, dir){
  settings_file <- file.path(file.path(dir, app_name, "Data", "settings", 
                                       sprintf("%sSettings.ini", app_name)))
  
  setting <- readLines(settings_file)
  setting <- sub("[=].+$", "=", setting)
  write(setting, 
        settings_file)
}
