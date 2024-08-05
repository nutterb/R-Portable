#' @name portablize
#' @title Make R Portable
#' 
#' @description Performs all of the necessary tasks to make R Portable
#' 
#' @param version The version of R being installed and made portable
#' @param install_to the directory into which the portable application is
#'   being installed.
#' @param template_dir The directory in which the settings templates are
#'   located.
#'   
#' @details Performs the following tasks
#' 
#' Check that the version name is a valid R version
#' 
#' Make the file structure for R Portable
#' 
#' Download and install the R version from CRAN
#' 
#' Write the app configuration files
#' 
#' Copy the icon image to the expected location in the Portable Apps Framework
#' 
#' Install the PortableApps launcher, if it isn't present
#' 
#' Run the PortableApps launcher.
#' 
#' Clean settings file
#' 
#' Zip the folder for portable use.

portablize <- function(version, 
                       install_to, 
                       template_dir){
  version <- validateVersionNumber(version)
  app_name <- sprintf("R-%s", version)
  
  # Make the directory structure
  makeRPortableDirectory(app_name, 
                         dir = install_to)
  
  # Print the directory into which R should be installed
  message(sprintf("Install R to: %s\n\n", 
                  file.path(install_to, app_name, "App", app_name)))
  
  # Download the R installer. exec is the command 
  downloadInstallR(version, 
                   install = TRUE)
  
  # Add version number to config files and copy to appropriate locations
  configureAppInfo(version = version, 
                   app_name = app_name,
                   dir = install_to, 
                   template_dir = template_dir)
  
  # Copy the app icon to the appropriate location
  file.copy(file.path(template_dir, "appicon.ico"),
            file.path(install_to, app_name, "App", "AppInfo", "appicon.ico"))
  
  # Install the PortableApps.com launcher if it isn't already installed
  installPortableAppsLauncher()
  
  runPortableAppsLauncher(app_name, install_to)
  
  # Clean the App/R-x.y.z/Data/settings/R-x.y.zSettings.ini file
  cleanSettings(app_name, dir)
  
  # Make the zip folder for portability
  zip(zipfile = file.path(install_to, sprintf("%s.zip", app_name)), 
      files = file.path(install_to, app_name))
}
