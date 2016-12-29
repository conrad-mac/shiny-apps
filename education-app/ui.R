library(shiny)
library(leaflet)
library(shinythemes)
library(dplyr)

source("helpers.R")

shinyUI(navbarPage(title = "NZ Schools Directory",
                   theme = "css/bootstrap-modified.css",
                   tabPanel("Interactive map",
                            fluidRow(
                               column(12,
                                      leafletOutput("map", height = 500),
                                      br()
                               ),
                               absolutePanel(bottom=100, right=25,
                                             selectInput("loc", "Zoom to location",
                                                         c("All locations", locations)
                                             ),
                                             radioButtons("maptype", "Choose map tiles",
                                                          choices = c(
                                                             "Default" = "OpenStreetMap",
                                                             "Stamen Watercolor" = "Stamen.Watercolor",
                                                             "CartoDB DarkMatter" = "CartoDB.DarkMatter"
                                                          )
                                             )
                               )
                               
                            ),
                            fluidRow(
                               column(12,
                                      helpText("App by: Conrad MacCormick")
                               )
                            )
                            
                   ),
                   tabPanel("About",
                            br(),
                            p(
                               "I created this visualisation using the ",
                               a(href="https://rstudio.github.io/leaflet/", "leaflet"),
                               " package in R. I downloaded the input dataset from the ", 
                               a(href="https://www.educationcounts.govt.nz/data-services/directories/list-of-nz-schools",
                                 "Education Counts website.")
                            )
                   ),
                   
                   header = tags$head(
                      tags$meta(
                         name="description", 
                         content="A visualisation of education information in New Zealand using leaflet in R."
                      ),
                      tags$meta(
                         name="keywords", 
                         content="leaflet, R, school, directory, New Zealand, NZ, education"
                      ),
                      tags$meta(
                         name="author", 
                         content="Conrad MacCormick"
                      )
                      # ,
                      # includeScript("init.js")
                   )
                   
))