output$xfactor<-renderUI({selectInput("xfactor", "Select the variable to study:", choices = colnames(dd2()))})

