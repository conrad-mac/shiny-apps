shinyServer(function(input,output,session){
   
   popupText <- ~paste0("<strong>Rank: </strong>", 
                        Rank,
                        "<br><strong>Main road: </strong>", 
                        crash_road, 
                        "<br><strong>Side road: </strong>", 
                        as.character(side_road), 
                        "<br><strong>Total casualties: </strong>", 
                        as.character(totalCasualties), 
                        "<br><strong>Fatalities: </strong>", 
                        as.character(fatalities), 
                        "<br><strong>Serious injuries: </strong>", 
                        as.character(seriousInjuries), 
                        "<br><strong>Minor injuries: </strong>", 
                        as.character(minorInjuries)
   )
   
   dataUpdate <- reactive({
      if(is.null(input$loc)){return()} 
      
      if(input$loc=="All locations"){return(intersections)}
      filter(intersections, TLA==input$loc)
   })
   
   pal <- reactive({
      if(is.null(dataUpdate())){return()}
      data <- dataUpdate()
      
      colorNumeric(
         palette = "Reds",
         domain = data$Rank2
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
         addCircleMarkers(
            lng = ~longitude, 
            lat = ~latitude, 
            weight = 2,
            radius = 10, 
            popup = popupText,
            color = "black",
            opacity = 0.7,
            fillColor = ~pal(Rank2),
            fillOpacity = 1,
            clusterOptions = markerClusterOptions()
         )
      # %>%
      #    addLegend(
      #       "bottomleft",
      #       pal = pal,
      #       values = ~Rank2,
      #       title = "Intersection Rank"
      #    )
   })
}
)