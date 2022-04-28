############################################################
###########                                         ########
###########            Analysis miRNA               ########
###########       Design by Victoria M. Cruz        ########
###########             UEB - VHIR                  ########
###########                2022                     ########
###########                                         ########
############################################################

# install CRAN packages
pk_cran <- c("shiny", "shinydashboard", "DT", "reshape2", "ggplot2", "gplots", "scales", 
             "plotly", "readxl", "glmnet", "ggvis", "shinyhelper", "broom", "readr", 
             "markdown", "ggthemes", "dplyr", "ggrepel", "ggfortify", "shinyBS", "shinyjs", "glue",
             "tidyr", "devtools", "Rcpp", "dashboardthemes")

pk_cran_miRFA <- c("argparser", "DBI", "RSQLite","VennDiagram","gridExtra") 

install.packages(setdiff(c(pk_cran, pk_cran_miRFA), rownames(installed.packages()))) 

# install BiocManager in order of install bioconductor pckgs, if needed
if (!require("BiocManager", quietly = TRUE)) install.packages("BiocManager")

# install Bioconductor packages
pk_bioc <- c("impute")

pk_bioc_miRFA <- c("org.Hs.eg.db", "GO.db", "edgeR")

BiocManager::install(setdiff(c(pk_bioc, pk_bioc_miRFA), rownames(installed.packages())), update = TRUE, ask = FALSE, quiet = TRUE)

# install Github packages
pk_git <- c("ggbiplot")
if(!require("ggbiplot", quietly = TRUE)) devtools::install_github("vqv/ggbiplot")

# REQUIRE ALL PACKAGES (invisible used to remove innecesary output)
invisible(lapply(c(pk_cran, pk_bioc, pk_git, pk_cran_miRFA, pk_bioc_miRFA), require, character.only = TRUE))
