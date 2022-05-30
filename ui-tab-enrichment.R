############################################################
###########                                         ########
###########           Shiny Enrichment              ########
###########       Design by Victoria M. Cruz        ########
###########             UEB - VHIR                  ########
###########                2022                     ########
###########                                         ########
############################################################

tabPanel( # ENRICHMENT TAB
  title = "Enrichment",
  sidebarLayout(
    sidebarPanel(
      width = 3,
      # SELECT COLUMN THAT CONTAINS GENE ID
      selectInput("column_gene", "Select column for Gene Symbol (HGNC or Entrez):", ""),
      hr(),
      # SELECT DB
      radioButtons("dbs_predetermined", "Do you want to use the predetermined databases?",
                   choices = c("Yes" = 'yes',
                               "No, select a different one" = 'no'),
                   selected = 'yes'),
      conditionalPanel(condition = ("input.dbs_predetermined == 'yes'"),
                       selectInput("dbs_predselected", "Select a predeterminated database:", c("GO_Molecular_Function_2021", 
                                                                                               "GO_Cellular_Component_2021", 
                                                                                               "GO_Biological_Process_2021", 
                                                                                               "GWAS_Catalog_2019", "KEGG_2021_Human",
                                                                                               "miRTarBase_2017"), 
                                   "GO_Molecular_Function_2021")),
      conditionalPanel(condition = ("input.dbs_predetermined == 'no'"),
                       selectizeInput("dbs_all", "Select a different database:", "", "", multiple = FALSE)),
      hr(),
      # select num of term enrichement to show
      sliderInput("num_terms", "Number of terms to show:", 5, 30,  15),
      # number of characters on plot
      sliderInput("num_char", "Number of characters to keep in the term description:", 25, 120,  40),
      # name of the plot
      textInput("plot_title", "Title plot (if empty, will be one by default):", ""),
      # width of the plot
      numericInput("plot_width", "Width (pixel):", 1000),
      # height of the plot
      numericInput("plot_height", "Height (pixel):", 800),
      # width of the plot
      numericInput("plot_res", "Resolution:", 110),
      uiOutput("buttondown_enrichment")
    ),
    mainPanel(
      plotOutput("enrich_plot", height = "800px", width = "100%"),
      br(), br(), # only one is end of line, two means new line
      h4("Table preview of the current data."),
      "Shows a max. of 50 rows.", br(), br(),
      DT::dataTableOutput("enrich_table")
    )
  )
)