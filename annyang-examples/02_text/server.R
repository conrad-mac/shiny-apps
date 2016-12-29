library(shiny)
library(datasets)

# Define server logic required to summarize and view the selected
# dataset
shinyServer(function(input, output) {
  
  # Return the requested dataset
  datasetInput <- reactive({
    if (is.null(input$dataset)) return()
    switch(input$dataset,
           "rock" = rock,
           "pressure" = pressure,
           "cars" = cars)
  })
  
  # Generate a summary of the dataset
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  
  output$title <- renderText(input$dataset)
  
  output$obs1 <- renderText(input$obs)
  
  # Show the first "n" observations
  output$view <- renderTable({
    if(is.null(input$obs)) return()
    head(datasetInput(), n = input$obs)
  })
})
