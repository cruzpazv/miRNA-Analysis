# server.R

options(shiny.maxRequestSize = 100*1024^2)

source("installPackages.R")
print(sessionInfo())

shinyServer(function(input, output,session) {
  
  ## Server functions are divided by tab
  ## 
  source("server-inputdata.R",local = TRUE)
  source("server-set1.R",local=TRUE)
  source("server-set2.R",local = TRUE)
  source("server-aone.R",local = TRUE)
  source("server-atwo.R",local = TRUE)
  
})
