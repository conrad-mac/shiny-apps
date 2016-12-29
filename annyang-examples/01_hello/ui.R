library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  singleton(tags$head(
    tags$script(src="//cdnjs.cloudflare.com/ajax/libs/annyang/2.4.0/annyang.min.js"),
    includeScript('init.js')
  )),

  # Application title
  titlePanel("Hello Shiny!"),

  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      helpText("Say 'bins X' to change the bin number for this histogram.")
      # sliderInput("bins",
      #             "Number of bins:",
      #             min = 1,
      #             max = 50,
      #             value = 30)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      br(),
      textOutput("checkText")
    )
  )
))
