############################################################
###########                                         ########
###########           Shiny Enrichment              ########
###########       Design by Victoria M. Cruz        ########
###########             UEB - VHIR                  ########
###########                2022                     ########
###########                                         ########
############################################################

# ui.R
source("helpers.R")
# all packages/libraries needed

dashboardPage(skin = "blue", 
              dashboardHeader(title = ("Shiny Enrichment"),
                              titleWidth = 600,
                              tags$li(a(href = 'https://sites.google.com/view/estbioinfo/home',
                                        img(src = 'vhirlogo.png',
                                            title = "VHIR", height = "30px"),
                                        style = "padding-top:10px; padding-bottom:10px;"),
                                      class = "dropdown")),
              
              # Shiny Dashboard Model
              
              dashboardSidebar(sidebarMenu(
                menuItem("Input Data", tabName = "inputdata", icon = icon("upload")),
                menuItem("Run analysis", tabName = "enrichment", icon = icon("play")),
                menuItem("Help", tabName = "help", icon = icon("question")),
                menuItem("Terms & Conditions", tabName = "terms", icon = icon("clipboard")),
                menuItem("About Us", tabName = "about", icon = icon("user"))
                
              )),
              dashboardBody(
                shinyDashboardThemes(
                  theme = "onenote"    
                  # onenote, grey_dark, grey_light, blue_gradient, purple_gradient, boe_website, poor_mans_flatly
                ),                           
                tags$head(
                  tags$link(rel = "stylesheet", type = "text/css", href = "mycss.css")
                ),
                tabItems(
                  tabItem(tabName = "inputdata",
                          source("ui-tab-inputdata.R",local=TRUE)$value),
                  tabItem(tabName = "enrichment",
                          source("ui-tab-enrichment.R",local=TRUE)$value),
                  tabItem("help", 
                          source("ui-tab-help.R",local=TRUE)$value),
                  tabItem("terms", 
                          source("ui-tab-terms.R",local=TRUE)$value),
                  tabItem("about", 
                          source("ui-tab-about.R",local=TRUE)$value)
                  
                ),
                
                ## ==================================================================================== ##   
                tags$hr(),
                ## ==================================================================================== ##
                ## FOOTER
                ## ==================================================================================== ##  
                tags$footer(p(h5(("Vall d'Hebron Research Institute"),align="center",width=3),
                              p(("Statistics and Bioinformatics Research Group"),"and",align="center",width=3),
                              p(("Copyright (C) 2022, code licensed under GPLv3"),align="center",width=4)))
                #p(("Code available on Github:"),a("link_html"),align="center",width=4),
                
                ## ==================================================================================== ##
                ## END
                ## ==================================================================================== ## 
                #tags$head(includeScript("google-analytics.js"))
              ) 
) 

