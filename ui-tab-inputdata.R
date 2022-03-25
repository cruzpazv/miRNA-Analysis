tabPanel("Input Data", 
         fluidRow(column(width = 2,
                         
              
                         radioButtons("example_data", "Do you want to use our example data?",
                                      choices = c("Yes" = 'yes',
                                                  "No, upload my own data" = 'umd'),
                                      selected = 'yes'),
                         
                         conditionalPanel(condition = ("input.example_data == 'yes'")),
                         
                         conditionalPanel(condition = ("input.example_data == 'umd'"),
                                          fileInput("data","Please choose your data:", accept = c("text/csv", 
                                                                                                               "text/comma-separated-values,text/plain",
                                                                                                               ".csv")),
                                          radioButtons('fila', 'Select if the first column of your data is an ID number or not', c('Yes' = 'yes', 'No'='no')),
                                          fileInput("targets","Please choose your target file:", accept = c("text/csv","text/comma-separated-values,text/plain",".csv")),
                         
                         radioButtons('sep2', 'Separator', c('Tab' ='\t', 'Comma (,)' =',', 'Semicolon (;)' =';'),'\t'),
                         radioButtons('dec2', 'Decimal', c('Point (.)'='.', 'Comma (,)'=','),'.'))
                         
         

         
                               
                  
                  ),

         column(10,
                bsCollapse(id="input_collapse_panel",open="data_panel",multiple = FALSE,
                           bsCollapsePanel(title="Uploaded Data File",value="data_panel",
                                           div(style = 'overflow-x: scroll', dataTableOutput("contents"), width = NULL,
                                               status = "primary")),
                           bsCollapsePanel(title="Uploaded Target File", value="target_panel",
                                           div(style= 'overflow-x: scroll', dataTableOutput("targets"),width = NULL,
                                               status = "primary"))
                          
                           ))))

