installifnot <- function(pckgName){
  if (!(require(pckgName, character.only = TRUE))) {
    install.packages(pckgName, dep = TRUE)
    require(pckgName, character.only = TRUE)
  }
}

pk1 <- c("shiny", "shinydashboard", "DT", "reshape2", "ggplot2", "gplots", "scales", "plotly", "readxl", "glmnet", "ggvis", "shinyhelper",
         "broom", "readr", "markdown", "ggthemes", "dplyr", "ggrepel", "ggfortify", "shinyBS", "glue", "tidyr", "devtools",
         "Rcpp")

for (i in 1:length(pk1)){
  installifnot(pk1[i])
}

installBiocifnot <- function(pckgName){
  if (!(require(pckgName, character.only = TRUE))) {
    if (!require("BiocManager", quietly = TRUE))
      install.packages("BiocManager")
    BiocManager::install(pckgName)
    require(pckgName, character.only = TRUE)
  }
}

installBiocifnot("impute")

devtools::install_github("vqv/ggbiplot")
devtools::install_github("nik01010/dashboardthemes")

