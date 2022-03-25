#Data<- reactive({})

#CÓDIGO PARA CARGAR LOS DATOS
  




#SettedData<-

#CÓDIGO QUE DEBE EJECUTAR NUESTRA APLICACIÓN PARA TRATAR LOS DATOS




#################
'
output$tablewos <- renderDataTable({
  Data()
  })

observeEvent(Data(),({
  updateCollapse(session,id = "panel", open="panel3",
                 style = list("open_panel" = "default",
                              "panel3"="success"))
}))
  
observeEvent(input$submit, ({
  updateCollapse(session,id =  "panel", open="panel4",
                 style = list("open_panel" = "success",
                              "panel4"="primary"))
}))


output$tablews <- DT::renderDataTable({
  setting_data_table<-SettedData()
  DT::datatable(setting_data_table)
})
'
