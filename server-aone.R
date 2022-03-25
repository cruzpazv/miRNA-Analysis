#CÓDIGO PARA ANALIZAR LOS DATOS

#aone_analysis<- ....

##########

#output$matriu <- DT::renderDataTable({
  
#  DT::datatable(aone_analisis()$res,
#                filter = 'top',extensions = 'Buttons',
#                escape=FALSE,  rownames=TRUE,
#                options = list(
#                  dom = 'Bfrtip',
#                 buttons = 
#                   list("copy", "print", list(
#                      extend="collection",
#                      buttons=list(list(extend="csv",
#                                        filename="limma"),
#                                   list(extend="excel",
#                                        filename="limma"),
#                                   list(extend="pdf",
#                                        filename="limma")),
#                      text="Download")),
#                  order=list(list(2, "desc")),
#                  pageLength = 100))
#})


