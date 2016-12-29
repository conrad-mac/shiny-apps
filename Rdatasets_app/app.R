library(shiny)
library(DT)
library(shinythemes)

ui <- navbarPage(
   "R Datasets",
   
   theme = shinytheme("flatly"),
   
   tabPanel("Datasets table",
            dataTableOutput('table1')
   )
)


server <- function(input, output){
   
   output$table1 <- renderDataTable({
      data1 <- data(package = .packages(all.available = TRUE))
      return(
         datatable(data1$results, style = 'bootstrap', extensions = c('Buttons','Responsive'),
                   options = list(
                      dom = 'Brtip',
                      buttons = c('copy', 'csv', 'excel', 'pdf', 'print'),
                      searchHighlight = TRUE
                   ),
                   filter = 'top')
         )
   })
   
}

shinyApp(ui, server)