#' @name makeRPortableDirectory
#' @title Creates the directory structure to support R-Portable
#'
#' @description Adds directories to the file system that 
#' 
#' @param app_name \code{character} giving the name of the app. Usually
#' R-x.y.z
#' @param dir the directory into which R Portable is beign installed.

makeRPortableDirectory <- function(app_name, 
                                   dir = getwd()){
  .makeDirectory(file.path(dir, app_name, "App", "AppInfo", "Launcher"))
  .makeDirectory(file.path(dir, app_name, "Data", "settings"))
}

.makeDirectory <- function(path){
  if (!file.exists(path)){
    dir.create(path, 
               recursive = TRUE)
  }
}