## loading packages ##

#this loads the packages used in this project and suppresses their startup messages
#the only package used in this project not included in the function is 'here'
#'here' is loaded directly in the .qmd file so here() can be used to locate
#and call in this function.

loadPackages <- function(){
  suppressPackageStartupMessages(library(palmerpenguins))
  suppressPackageStartupMessages(library(tidyverse))
  suppressPackageStartupMessages(library(janitor))
  suppressPackageStartupMessages(library(ragg))
  suppressPackageStartupMessages(library(kableExtra))
}
