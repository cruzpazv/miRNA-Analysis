fluidRow(column(width = 3,
                wellPanel(
                h4("Choices"),
                
		#Pregunta 1:Selección simple
                radioButtons("s1", "1. Select something",
                             choices = c("Yes" = 'yes',
                                         "No" = 'no'),
                             selected = 'yes'),
                



		#Pregunta 2: Selección simple con panel condicional
                radioButtons("s2", "2. Select another thing",
                             choices = c("Yes" = 'yes',
                                         "No" = 'no'),
                             selected = 'yes'),

                #Conditional panel depending on the answer of Question 2
                conditionalPanel(condition = ("input.s2 == 'yes'"),
                                 sliderInput("value", "Example of slider imput",
                                              value = 20, min = 5, max = 100)),
                


		#Pregunta 3: Selección simple
                radioButtons("s3", "3. Select the last one thing",
                              choices = c("Yes" = 'yes',
                                          "No" = 'no',
                                          "Could be" = 'cb',
                                          "Don't know" = 'dk'),
                             selected = 'yes'),
  


		#Botón submit
                actionButton("submit","Submit", icon("step-forward"),
                             style="color: #fff; background-color: #00b300; border-color: #009900")

  )),

  #Configuración del segundo panel de la página: tablas de resultados
  column(width = 9,
         
         bsCollapse(id="panel",open="open_panel",multiple = FALSE,
                    bsCollapsePanel(title="Data without settings",value="panel1",
                                    div(style = 'overflow-x: scroll', DT::dataTableOutput("tablewos"), width = NULL,
                                        status = "primary")),
                    bsCollapsePanel(title="Submitted Data (with settings)",value="panel2",
                                    div(style = 'overflow-x: scroll', DT::dataTableOutput("tablews"), width = NULL,
                                        status = "primary"))
  )
))


