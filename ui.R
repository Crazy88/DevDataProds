require(shiny)
require(datasets)
require(rCharts)
require(devtools)
require(ggplot2)
# Define UI 
shinyUI(fluidPage(
        # Application title
               h3("mtcars Variable Correlation Analyzer"),
        
        sidebarPanel(
                radioButtons(inputId="xvar", 
                             label = h4("DOCUMENTATION: Choose Your Variable"),
                             choices = names(mtcars),
                             selected="wt"
                ),
        h4("How does it correlate with mpg?"),
        h4("How does it correlate with am?"),
        h4("Could it be a potential confounder?")
        ),
        # Show scatterplots and correlation coeffs
        mainPanel(
                showOutput("corrplot",lib='polycharts')
                ,
                textOutput("outtext1")
                ,
                showOutput("corrplot2",lib='polycharts')
                ,
                textOutput("outtext2")
                
        )
        
))
