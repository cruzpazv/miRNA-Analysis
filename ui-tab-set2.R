fluidRow(
  column(width = 3,
                wellPanel(



  #Pregunta 1: Selección simple
  radioButtons("s1", h4("Chose one method"),
               choices = c("First one" = 'first',
                           "Second" = 'second', 
                           "Third" = 'third',
                           "Fourth" = 'fourth',
                           "Keep counting" = 'kc'),
		selected = 'first'),
                          
  

  #Botón submit
  actionButton("submit2","Submit", icon("step-forward"),
               style="color: #fff; background-color: #00b300; border-color: #009900")
  )),
  

  #Configuración de página: tabla con resultados
  column(width = 9,
         bsCollapse(id="panel2",open="panel",multiple = FALSE,
                    bsCollapsePanel(title="Data without settings",value="panel3",
                                    div(style = 'overflow-x: scroll', DT::dataTableOutput("tablewos2"), width = NULL,
                                        status = "primary")),
                    bsCollapsePanel(title="Submitted data (with settings)",value="panel4",
                                    div(style = 'overflow-x: scroll', DT::dataTableOutput("tablews2"), width = NULL,
                                        status = "primary"))
         )))


