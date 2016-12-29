library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  singleton(tags$head(
    tags$script(src="//cdnjs.cloudflare.com/ajax/libs/annyang/2.4.0/annyang.min.js"),
    includeScript('init.js')
  )),
  
  # Application title
  titlePanel("Shiny Text"),
  
  # Sidebar with controls to select a dataset and specify the
  # number of observations to view
  sidebarLayout(
    sidebarPanel(
    ),
    
  # Show a summary of the dataset and an HTML table with the 
	# requested number of observations
    mainPanel(
      h4(HTML("There are three datasets to choose from: rock, pressure, and cars.
         </br> Say 'data' + <i>dataset name</i> to change tables.</br>")),
      
      h2(textOutput("title")),
      
      h3("Summary"),
      
      verbatimTextOutput("summary"),
      
      br(),
      
      h4("Top",tags$strong(textOutput("obs1")), "observations"),
      
      tableOutput("view")
    )
  )
))
