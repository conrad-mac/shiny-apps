shinyServer(function(input,output,session){
   
   popupText <- ~paste0("<strong>School name: </strong>", 
                        name,
                        "<br><strong>Email: </strong>",
                        email,
                        "<br><strong>Telephone: </strong>", 
                        as.character(telephone),
                        "<br><strong>Decile: </strong>", 
                        decile,
                        "<br><strong>School roll: </strong>", 
                        schoolRoll
   )

   dataUpdate <- reactive({
      if(is.null(input$loc)){return()}

      if(input$loc=="All locations"){return(schools)}
      filter(schools, TA==input$loc)
   })
   
   pal <- reactive({
      if(is.null(dataUpdate())){return()}
      data <- dataUpdate()
      
      colorNumeric(
         palette = "Blues",
         domain = data$decile
      )
   })
   
   output$map <- renderLeaflet({
      if(is.null(dataUpdate())){return()}
      
      data <- dataUpdate()
      pal <- pal()
      
      leaflet(data) %>%
         addProviderTiles(input$maptype) %>%
         #addTiles() %>%
         #setView(173, -41, 4) %>%
         # addControl(
         #    selectInput("loc", "Zoom to location",
         #                c("All locations", locations)
         #    )
         # ) %>%
         addCircleMarkers(
            lng = ~longitude, 
            lat = ~latitude, 
            weight = 2,
            radius = 10, 
            popup = popupText,
            color = "black",
            opacity = 0.7,
            fillColor = ~pal(decile),
            fillOpacity = 1,
            clusterOptions = markerClusterOptions()
         ) %>%
         addLegend(
            "topright",
            pal = pal,
            values = ~decile,
            title="School decile"
         )
   })
}
)