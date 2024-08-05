# Versions to make portable
VERSION <- "4.4.0"

# Directory into which the portable versions will be installed
INSTALL_TO <- "C:/Users/bnutter/Desktop/R-Portable"

# Direcotry with the configuration templates
TEMPLATE_DIR <- file.path(getwd(), "00-Templates")

invisible({
  lapply(list.files("01-R-functions", 
                  full.names = TRUE), 
       source)
})

portablize(version = VERSION, 
           install_to = INSTALL_TO, 
           template_dir = TEMPLATE_DIR)
