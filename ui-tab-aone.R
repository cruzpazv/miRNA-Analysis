fluidRow(
  column(width = 3,
#Describiendo varios paneles según la opción escogida
         wellPanel(
           radioButtons("aone_test", h4("aone methods:"),
                        choices = c("Choice 1"='c1',
                                    "Choice 2" = 'c2',
                                    "Choice 3" = 'c3')
                        ),
           
           actionButton("play_test","Analyze", icon("step-forward"),
                        style="color: #fff; background-color: #00b300; border-color: #009900")
           
         )),
  
  column(width = 8,
#Panel 1: Panel de resultados desplegable
         conditionalPanel(condition = ("input.aone_test == 'c1'"),
                          fluidPage(tabsetPanel(
                            tabPanel("Results", div(style = 'overflow-x: scroll', DT::dataTableOutput("matriu"), width = NULL,
                                                      status = "primary"))
                            )
                          )
         ),
#Panel 2: Panel de resultados simple
	       conditionalPanel(condition = ("input.aone_test == 'c2'"),
                          fluidPage(tabsetPanel(
                            tabPanel("Results", DT::dataTableOutput("matriu2"),
                            width = NULL,
                                                                       status = "primary"))
                          ),
#Panel 3: Panel de resultados con dos pestañas, una para tabla desplegable y una de plot con botones de descarga
         conditionalPanel(condition = ("input.aone_test == 'c3'"),
                          fluidPage(tabsetPanel(
                            tabPanel("Results",div(style='overflow-x: scroll', DT::dataTableOutput("matriu3"), width=NULL,
                                                        status="primary")),
                            tabPanel("Another tab to display a plot for example",
                                     box(
                                       width = 9, status = "info", solidHeader = F,collapsible = F,
                                       title = "Do you want to display a plot?",
                                       tags$button(id="goPlot",type="button",class="btn btn-primary action-button","GO PLOT!")
                                     ),
                                     bsModal("PlotModal", h3("Plot"), "goPlot", size = "large",
                                                              box(title = "TITLE", width = 3, status = "info", solidHeader = TRUE,collapsible = TRUE,
                                                                  numericInput("a",strong("A"),0.05),
                                                                  numericInput("b",strong("B"),1.5),
                                                                  sliderInput("c", strong("C"), 1, 10, 5, step = 0.5,animate = TRUE),
                                                                  
                                                                  
                                                              box(title = "Plot", width = 9, status = "success", solidHeader = F,collapsible = TRUE,
                                                                  div(
                                                                    downloadLink('downloadDataPNG', 'Download PNG',class="downloadLinkblack"),
                                                                    downloadLink('downloadDataPDF', 'Download PDF',class="downloadLinkred"),
                                                                    plotOutput("Plot",height="100%",width="100%")
                                                                  )
                                                              )
                                                              
                                                              
                            ))
                          ) 
                          )
         )
          
                          )
         )
  )
)

