##################

# This code installed the needed R packages into the build environment
# Author: Leah A. Wasser, Gina L. Li
# last modified: April 2019
##################

# should the dependencies be installed explicityl?
# ‘backports’, ‘zeallot’, ‘glue’, ‘magrittr’, ‘stringi’, ‘colorspace’, ‘assertthat’, ‘utf8’, ‘vctrs’, ‘Rcpp’, ‘stringr’, ‘labeling’, ‘munsell’, ‘R6’, ‘RColorBrewer’, ‘cli’, ‘crayon’, ‘fansi’, ‘pillar’, ‘pkgconfig’, ‘digest’, ‘gtable’, ‘lazyeval’, ‘plyr’, ‘reshape2’, ‘rlang’, ‘scales’, ‘tibble’, ‘viridisLite’, ‘withr’
packages <- c("ggplot2", "dplyr", "RJSONIO",
              "ggmap", "raster", "rgdal", "rtweet", "widyr",
              "knitr", "rmarkdown", "dplyr", "stringr", "RSAGA",
              "ggmap", "maps", "sf", "rasterVis", "knitr","rmarkdown",
              "RSAGA", "ff")

for (package in packages) {
  if (!package %in% rownames(installed.packages())) {
    print("need to install a package")
    install.packages(package, repos = "http://cran.us.r-project.org")
  }
}

## flag unsuccessful package installs
check_pkg = !packages %in% rownames(installed.packages())
if(sum(check_pkg) > 0){
  problem_pkg = packages[check_pkg]
  problem_pkg = paste(problem_pkg, collapse = ', ')
  stop(paste('Installation of package(s)', problem_pkg, 'was unsuccessful.'))
}