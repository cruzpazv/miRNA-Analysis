############################################################
###########                                         ########
###########            Analysis miRNA               ########
###########       Design by Victoria M. Cruz        ########
###########             UEB - VHIR                  ########
###########                2022                     ########
###########                                         ########
############################################################


# ui.R
source("helpers.R")
# all packages/libraries needed

dashboardPage(skin = "blue", 
  dashboardHeader(title = ("DBOARD: Shiny Dashboard Model"),
                  titleWidth = 600,
                  tags$li(a(href = 'https://sites.google.com/view/estbioinfo/home',
                            img(src = 'vhirlogo.jpg',
                                title = "VHIR", height = "30px"),
                            style = "padding-top:10px; padding-bottom:10px;"),
                          class = "dropdown")),
  
  # Shiny Dashboard Model
  
  dashboardSidebar(sidebarMenu(
    menuItem("Home", tabName = "home", icon = icon("home")),
    menuItem("Input Data", tabName = "inputdata", icon = icon("upload")),
    menuItem("Settings", tabName = "preprocessing", icon = icon("wrench"), startExpanded = FALSE,
      menuSubItem("Set1", tabName = "set1"),
      menuSubItem("Set2", tabName = "set2")),
    menuItem("Statistics", tabName = "statistics", icon = icon("sliders"), startExpanded = FALSE,
      menuSubItem("Analysis one", tabName = "aone"), 
      menuSubItem("Analysis two", tabName = "atwo")),
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
      tabItem(tabName = "home",
              source("ui-tab-introduction.R",local=TRUE)$value),
      tabItem(tabName = "inputdata",
              source("ui-tab-inputdata.R",local=TRUE)$value),
      tabItem("set1", 
              source("ui-tab-set1.R",local=TRUE)$value),
      tabItem("set2", 
              source("ui-tab-set2.R",local=TRUE)$value),
      tabItem("aone", 
              source("ui-tab-aone.R", local=TRUE)$value),
      tabItem("atwo", 
              source("ui-tab-atwo.R",local=TRUE)$value),
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
              p(("Copyright (C) 2018, code licensed under GPLv3"),align="center",width=4)))
             #p(("Code available on Github:"),a("link_html"),align="center",width=4),
    
    ## ==================================================================================== ##
    ## END
    ## ==================================================================================== ## 
    #tags$head(includeScript("google-analytics.js"))
  ) 
) 

