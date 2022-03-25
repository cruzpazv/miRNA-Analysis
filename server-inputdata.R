
datasetInput <- reactive({

  if (input$example_data == "yes") {
    data <- read_csv("example_data/archivo.csv")
    print(data)
  }
  
 else if (input$example_data == "umd") {
   
    infile <- input$data
    
  if (is.null(infile)){
      return(NULL)
      }
  
  else {
    data2 <- read_csv(infile$datapath, input$header)
    print(data2)}
  }
})


output$contents <- DT::renderDataTable(datasetInput())
