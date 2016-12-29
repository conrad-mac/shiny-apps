library(shiny)
library(shinythemes)

# Define UI for dataset viewer application
shinyUI(navbarPage(
   header = singleton(tags$head(
      #tags$script(src="//cdnjs.cloudflare.com/ajax/libs/annyang/1.4.0/annyang.min.js"),
      # tags$script(src="//cdnjs.cloudflare.com/ajax/libs/annyang/2.4.0/annyang.min.js"),
      tags$script(src="//cdnjs.cloudflare.com/ajax/libs/annyang/2.6.0/annyang.min.js"),
      includeScript('init.js')
   )),
   
   # Application title
   title = "Annyang Speech App",
   
   theme = shinytheme("cerulean"),
   
   # Show a summary of the dataset and an HTML table with the 
   # requested number of observations
   tabPanel("Ask a question",
            
            #h2(textOutput("text")),
            
            #h2(textOutput("text2")),
            
            h3("Ask a question!"),
            h5("Example: 'What is the capital of New Zealand?'"),
            
            p(textOutput("capital")),
            
            br(),
            
            h3("What kind of plot do you want to show?"),
            h5("Example: 'Show me time series'"),
            
            plotOutput("plot"),
            
            h5("Text for testing:"),
            textOutput("plotText")
            
   )
)
)
