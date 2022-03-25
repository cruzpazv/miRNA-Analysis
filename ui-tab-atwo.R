fluidRow(
  column(width = 3,
                wellPanel(
#Describiendo varios paneles según la opción escogida
  radioButtons("atwo_plot", h4("atwo methods:"),
               choices = c("Choice 1" = 'c1',
                           "Choice 2" = 'c2',
                           "Choice 3" = 'c3')
               ),
#Si seleccionamos la opción 1 nos permite entrar valores a través de SliderInput o NumericInput  
  conditionalPanel(condition = ("input.atwo_plot == 'c1'"),
                   sliderInput("s","Select",min=0,max=3,value=1.5, step = .1)),
  conditionalPanel(condition = ("input.atwo_plot == 'c1'"),
                   numericInput("num","Number",min=2,max=20,value=6,
                                step = 1)),

#Si seleccionamos la opción 2 nos permite entrar valores a través de NumericInput
  conditionalPanel(condition = ("input.atwo_plot == 'c2'"),
                   numericInput("num2","Number",min=2,max=20,value=6,
                                step = 1)),

#Si seleccionamos la opción 3 nos permite entrar valores a través de dos NumericInput
  conditionalPanel(condition = ("input.atwo_plot == 'c3'"),
                   numericInput("num3","Number",min=2,max=20,value=6,
                                step = 1),
                   numericInput("num4","Another number",min=1,max=30,value=10,
                                step = 1)),
                          
  
  actionButton("plot_atwo","Analyze", icon("step-forward"),
               style="color: #fff; background-color: #00b300; border-color: #009900")
  )),
  
  column(width = 8,

#Definimos un panel de resultados de la opción 1        
         conditionalPanel(condition = ("input.atwo_plot == 'c1'"),
                          fluidPage(tabsetPanel(
                            tabPanel("Table", div(style = 'overflow-x: scroll', 
                                                        dataTableOutput("tablec1"), 
                                                        width = NULL,
                                                        status = "primary")),
                            tabPanel("Another tab panel if you need more tables", DT::dataTableOutput("table2c1")),
                            tabPanel("One Plot", plotlyOutput("plotc1")),
                            tabPanel("Another tab panel if you need more plots", plotlyOutput("plot2c1")),
                            tabPanel("Tab panel with slider Input", plotOutput("plot3c1"),
                                     sliderInput("slider","Select",
                                                 min=1,max=5,value=1))
                            ))),

#Panel de resultados de la opción 2
         conditionalPanel(condition = ("input.atwo_plot == 'c2'"),
                          fluidPage(tabsetPanel(
                            tabPanel("Table", DT::dataTableOutput("tablec2")),
                            tabPanel("Plot", plotlyOutput("plotc2"))
                            ))),

#Panel de resultados de la opción 3
         conditionalPanel(condition = ("input.atwo_plot == 'c3'"),
                          fluidPage(tabsetPanel(
                            tabPanel("Plot", plotlyOutput("plotc3"))
                            )))
         
           
  ))

