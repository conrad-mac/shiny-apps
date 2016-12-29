library(shiny)
library(datasets)
library(dplyr)

dataIn <- read.csv("./data/capitals.csv")

# Define server logic required to summarize and view the selected
# dataset
shinyServer(function(input, output) {
  
  getCapital <- reactive({
    if(is.null(input$country)) return()
    
    x <- filter(dataIn, country == input$country)
    
    return(as.character(x$capital))
  })
  
  output$capital <- renderText({
     if(is.null(getCapital())) return()
     
     paste("The capital of", input$country, "is", getCapital())
  })
  
  output$plotText <- renderText({
     if(is.null(input$plotme)) return()
     
     as.character(input$plotme)
  })
  
  output$plot <- renderPlot({
     if(is.null(input$plotme)) return()
     if(input$plotme=="time series"){
        plot(AirPassengers)
     }
     if(input$plotme=="histogram"){
        hist(VADeaths)
     }
  })
  
  # output$text <- renderText({
  #    if (is.null(input$speech)) return()
  #    input$speech
  # })
  # 
  # output$text2 <- renderText({
  #    if (is.null(input$country)) return()
  #    input$country
  # })
  
})
