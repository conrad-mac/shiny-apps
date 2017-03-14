library(shiny)
library(leaflet)
library(shinythemes)
library(dplyr)

source("helpers.R")

htmlTemplate("index.html",
             map = leafletOutput("map",
                                 height = 640),
             zoom = selectInput("loc", "Zoom to location",
                                c("All locations", locations)
             ),
             type = radioButtons("maptype", "Choose map tiles",
                                 choices = c(
                                    "Default" = "OpenStreetMap",
                                    "Stamen Watercolor" = "Stamen.Watercolor",
                                    "CartoDB DarkMatter" = "CartoDB.DarkMatter"
                                 )
             )
)