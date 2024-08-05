# Versions to make portable
VERSION <- c("4.4.0")

# Directory into which the portable versions will be installed
INSTALL_TO <- "C:/Users/bnutter/Desktop/R-Portable"

# Direcotry with the configuration templates
TEMPLATE_DIR <- file.path(getwd(), "00-Templates")


portablize(version = VERSION, 
           install_to = INSTALL_TO, 
           template_dir = TEMPLATE_DIR)
