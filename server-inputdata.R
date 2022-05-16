############################################################
###########                                         ########
###########           Shiny Enrichment              ########
###########       Design by Victoria M. Cruz        ########
###########             UEB - VHIR                  ########
###########                2022                     ########
###########                                         ########
############################################################

datasetInput <- reactive({
  
  if (input$example_data == "yes") {
    data <- as.data.frame(read.csv("example_data/archivo.csv", row.names = NULL))
  }
  else if (input$example_data == "umd") {
    req(input$data)
    data <- as.data.frame(read.csv(input$data$datapath, sep = input$sep2, dec = input$dec2))
  }
})


output$contents <- DT::renderDataTable(datasetInput())
