############################################################
###########                                         ########
###########           Shiny Enrichment              ########
###########       Design by Victoria M. Cruz        ########
###########             UEB - VHIR                  ########
###########                2022                     ########
###########                                         ########
############################################################

######################### FUNCTIONS ########################
# must be before server code, do not change 

# FUNCTION to obtain data enrichment with genelist
get_enrichment <- function(df_gene){
  #' library(enrichR)
  #' HERE IS WHERE YOU MUST ADD MORE DB IF YOU WANT
  #' check names in: https://maayanlab.cloud/Enrichr/#libraries
  if (input$dbs_predetermined == "yes") {
    # validate if there is any db selected
    validate(
      need(input$dbs_predselected != "", "Please, select any of the predeterminated databases available.")
    )
    RV$dbs_selected <- input$dbs_predselected
  }else if(input$dbs_predetermined == "no") {
    # validate if there is any db selected
    validate(
      need(input$dbs_all != "", "Please, select any of the different databases available.")
    )
    RV$dbs_selected <- input$dbs_all
  }
  # create new dataframe only with gene and separate multinames in rows
  show_modal_spinner(text = "Please wait, calculating enrichmnet...") # widget on
  df_gene <- as.data.frame(df_gene)
  colnames(df_gene) <- "Gene"
  df_gene <- df_gene %>% separate_rows("Gene")
  genes_data <- unique(df_gene$Gene) # keep unique
  enriched <- enrichr(genes_data, RV$dbs_selected) # enrichment function
  remove_modal_spinner() # widget off
  return(enriched)
}

# FUNCTION to check the data columns
columns_are_valid <- function(data_csv){
  
  # create a bool to TRUE
  check_bool <- TRUE
  # empty strings
  error_title <- ""
  error_message <- ""
  
  data_csv <- as.data.frame(data_csv)
  
  # if data has less than 4 required column
  if(ncol(data_csv)<1){
    error_title <- "Not enough columns."
    error_message <- "Please, check that the file has at least one column."
  }else{
    # if there is column selected
    if(input$column_gene == ""){
      error_title <- "No Gene column found."
      error_message <- "Please, select the column for Gene ID."
    }
    # if the name is not in the colnames
    else if(!(input$column_gene %in% colnames(data_csv))){
      error_title <- "Undefined column selected."
      error_message <- "Please, check if the separator and the columnd are correct."
    }
    ## GENE ERRORS: must be character
    else if(!all(is.character(data_csv[,input$column_gene]))){
      error_title <- "Error in column for Gene."
      error_message <- "Please, the data format for Gene must be characters."
    }
  }
  
  # if message is empty, no error, return TRUE
  if(error_message == ""){
    return(check_bool)
  }else{ # else, there is error, return warning alert and FALSE 
    shinyalert(error_title, error_message, type = "warning")
    return(!check_bool)
  }
}

# FUNCTION to update de values of selectInput for columns names
insert_values_selectInput <- function(columnname, idSelectInput){
  col_num <- ""
  # if the exact name is found
  if(length(which(colnames(datasetInput())==columnname))>0){ 
    col_num <- which(colnames(datasetInput())==columnname)
  }
  # if similar name is found 
  else if(sum(grepl(columnname, names(datasetInput()), ignore.case = TRUE))>0){ 
    col_num <- which(grepl(columnname, names(datasetInput()), ignore.case = TRUE))[[1]]
  }
  
  if(col_num == ""){
    # if there isn't exact or similar name, don't select any
    updateSelectInput(session, idSelectInput, choices = colnames(datasetInput()),
                      selected = "")
  }else{
    # update selectInput choices if name found
    updateSelectInput(session, idSelectInput, choices = colnames(datasetInput()),
                      selected = colnames(datasetInput())[col_num])
  }
}

#################### ENRICHMENT SERVER #################

# REACTIVE_VALUES used 
RV <- reactiveValues(dbs_selected = character(), plot_title = character())

# Update selectInput options
observe({
  req(datasetInput())
  # update selectInput options
  if(input$column_gene == "" || !(input$column_gene %in% colnames(datasetInput())))
    insert_values_selectInput("Gene","column_gene")
  # update selectInput options enrich database
  if (input$dbs_predetermined == "no") {
    updateSelectizeInput(session, "dbs_all", choices = listEnrichrDbs()$libraryName,
                         selected = "")
  }
})

# REACTIVE use the function enrichment if there is file selected in selectInput
data_enrichment <- reactive({
  # check that there is a data upload
  if(is.null(datasetInput())){
    error_title <- "No data upload."
    error_message <- "Please, check that there is any data upload in the Input Data tab."
    shinyalert(error_title, error_message, type = "warning")
  }
  # function to check gene data is character
  req(columns_are_valid(datasetInput())) # must be true
  
  # enrichment
  list_enrich <- get_enrichment(datasetInput()[,input$column_gene])
  return(list_enrich)
})

# RENDER table enrich
output$enrich_table <- DT::renderDataTable({
  req(data_enrichment())
  if(nrow(data_enrichment()[[RV$dbs_selected]]>50)){ # if too long, just 50 rows show
    datatable <- head(data_enrichment()[[RV$dbs_selected]], 50)
  }else{
    datatable <- data_enrichment()[[RV$dbs_selected]]
  }
  return(DT::datatable(datatable, options = list(scrollX = TRUE, paging = FALSE, autoWidth = FALSE)))
})

# RENDER plot enrich
output$enrich_plot <- renderPlot({
  if(input$example_data == "umd"){
    validate(
      need(input$data, "You have selected upload your own data but there is not data upload. Please, check the Input Data tab.")
    )
  }
  req(data_enrichment())
  if(input$plot_title != ""){
    RV$plot_title <- input$plot_title
  }else{
    RV$plot_title <- paste("Enrichment analysys with database",RV$dbs_selected)
  }
  plotEnrich(data_enrichment()[[RV$dbs_selected]], 
             showTerms = input$num_terms, numChar = input$num_char, 
             y = "Count", orderBy = "P.value", 
             title = RV$plot_title)
})

# REACTIVE save name of file selected
current_fname <- reactive({
  req(data_enrichment())
  if (input$example_data == "yes") {
    return("example")
  }
  else if (input$example_data == "umd") {
    return(input$data$datapath)
  }
})

# DOWNLOAD_HANDLER Download plot button enrich (inside part)
output$download_enrichment <- downloadHandler(
  filename = function(){paste0(current_fname(),'_',Sys.Date(),'_enrichment.zip')}, 
  content = function(file){
    show_modal_spinner(text = "Please wait, preparing files to download...")
    owd <- setwd(tempdir()) # get directory
    on.exit(setwd(owd))
    # save table enrich
    write.table(data_enrichment()[[RV$dbs_selected]], 
                file = paste0(current_fname(), '_enrichment.txt'), 
                quote = FALSE, sep = "\t")
    # save plot enrich
    ggsave(filename = paste0(current_fname(), '_enrichment.png'), 
           plot = plotEnrich(data_enrichment()[[RV$dbs_selected]], 
                             showTerms = input$num_terms, numChar = input$num_char, 
                             y = "Count", orderBy = "P.value", 
                             title = RV$plot_title), 
           device = "png", height = 8 , width = 12)
    remove_modal_spinner()
    #create the zip file
    zip(file, c(paste0(current_fname(), '_enrichment.png'),
                paste0(current_fname(), '_enrichment.txt')))
  }
)
# RENDER download button plot (external part)
output$buttondown_enrichment <- renderUI({
  req(data_enrichment())
  downloadButton("download_enrichment", label = "Save Data & Plot", style="color: #fff; background-color: #a353cf; border-color: #852fb4")
})