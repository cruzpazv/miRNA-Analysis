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
install.packages(setdiff(pk_cran, rownames(installed.packages()))) 

# install BiocManager in order of install bioconductor pckgs, if needed
if (!require("BiocManager", quietly = TRUE)) install.packages("BiocManager")

# install Bioconductor packages
pk_bioc <- c("impute")
BiocManager::install(setdiff(pk_bioc, rownames(installed.packages())), update = TRUE, ask = FALSE)

# install Github packages
pk_git <- c("ggbiplot")
if(!require("ggbiplot", quietly = TRUE)) devtools::install_github("vqv/ggbiplot")

# needed for miRFA
pk_cran_miRFA <- c("argparser", "DBI", "RSQLite","VennDiagram","gridExtra") # CRAN
install.packages(setdiff(pk_cran_miRFA, rownames(installed.packages())))

pk_bioc_miRFA <- c("org.Hs.eg.db", "GO.db", "edgeR") # Bioconductor
BiocManager::install(setdiff(pk_bioc_miRFA, rownames(installed.packages())), update = TRUE, ask = FALSE)

# REQUIRE ALL PACKAGES (invisible used to remove innecesary output)
invisible(lapply(c(pk_cran, pk_bioc, pk_git, pk_cran_miRFA, pk_bioc_miRFA), require, character.only = TRUE))
