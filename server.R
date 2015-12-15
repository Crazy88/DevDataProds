rm(list = ls())
require(shiny)
require(datasets)
require(rCharts)
require(devtools)
require(ggplot2)
#setwd("C:/coursera/DevDataProds/project-02")

shinyServer(function(input,output) {
#unfactor numeric variables
        mtcars$cyl<-as.numeric(as.character(mtcars$cyl))
        mtcars$vs<-as.numeric(as.character(mtcars$vs))
        mtcars$am<-as.numeric(as.character(mtcars$am))
        mtcars$gear<-as.numeric(as.character(mtcars$gear))
        mtcars$carb<-as.numeric(as.character(mtcars$carb))
        mtcars<-as.data.frame(mtcars)
        attach(mtcars)
# Correlate selected variable with MPG
        
        output$corrplot <- renderChart2({
                r1 <- rPlot(x = input$xvar,
                              y = "mpg",
                              data=mtcars,
                              main='Model: mpg~selected', 
                              type='point',
                              color='am'
                              )
                return(r1)
        })

        corrmpg <- reactive({as.numeric(round(cor(mpg,mtcars[,input$xvar]),3))})

        output$outtext1 <- renderText({paste("Correlation with mpg:",corrmpg())})

# Correlate selected variable with AM

        output$corrplot2 <- renderChart2({

                r2 <-
                        rPlot(x = 'am',
                              y = input$xvar,
                              data=mtcars,
                              main='Corellation: Transmission and Selected', 
                              type='point',
                              color='am'
                        )
                return(r2)
        })
        
        corram <- reactive({as.numeric(round(cor(am,mtcars[,input$xvar]),3))})
         
        output$outtext2 <- renderText({paste("Correlation with am:",corram())})
        #                 detach(mtcars)
})
