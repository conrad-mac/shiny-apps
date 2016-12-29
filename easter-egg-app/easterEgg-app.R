library(shiny)

eggScript <- 'https://cdn.rawgit.com/mikeflynn/egg.js/master/egg.min.js'
iconUp <- icon('arrow-circle-o-up', 'fa-5x')
iconDown <- icon('arrow-circle-o-down', 'fa-5x')
iconLeft <- icon('arrow-circle-o-left', 'fa-5x')
iconRight <- icon('arrow-circle-o-right', 'fa-5x')
handRight <- icon('hand-o-right', 'fa-5x')

ui <- shinyUI({
   navbarPage(
      "Test",
      header = tags$head(
         tags$script(type='text/javascript', 
                     src=eggScript),
         tags$script(type='text/javascript',
                     'var egg = new Egg("up,up,down,down,left,right", function() {
                        jQuery("#testgif").fadeIn(500, function() {
                           window.setTimeout(function() { jQuery("#testgif").hide(); }, 5000);
                        });
                     }).listen();'),
         tags$style(type='text/css',
                    '#testgif {
                        position: absolute; 
                        top: 33%; 
                        left: 25%; 
                        display: none; 
                    }
                     #buttons {
                        position: absolute;
                        top: 33%;
                        left: 25%;
                        
                     }
                    ')
      ),
      
      tabPanel(
         "Test tab",
         div(
            id = "buttons",
            handRight, iconUp, iconUp, iconDown, iconDown,
            iconLeft, iconRight
         ),
         img(
            id="testgif", 
            src='https://media.giphy.com/media/qpDpG0oC0aUxO/giphy.gif'
         )
      )
   )
})

server <- shinyServer(function(input,output){
   
})

shinyApp(ui, server)