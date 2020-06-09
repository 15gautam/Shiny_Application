
#' loading shiny 
#' This function takes input from \code {ui.R} and fetch the csv file from the disk
#' @param covid read the csv file
#' @param result read the file as data frame and filter and group by location
#' @param result_without_NA remove all NA values from result
#' @param X  stores the value for x-axis 
#' @param Y stores the value for Y-axis
#' @param rangex stores the range of X
#' @param rangey stores the range of Y
#' @param plot() plot the graph between X and Y
library(shiny)

shinyServer(function(input, output) { 
    #writing server function  
    output$distPlot <- renderPlot({ 
        #creating distPlot  
        if(input$X=='b') { i<-2 }    
        if(input$X=='e') { i<-5 }     
        if(input$Y=='f') { j<-6 }     
        if(input$Y=='g') { j<-7 }     
        if(input$Y=='h') { j<-8 }     
        if(input$Y=='i') { j<-9 }   
        if(input$Y=='j') {j<-10}

        #reading covid cases dataset    
        library(dplyr)
        library(graphics)
        covid<-read.csv("D:/Data Science/Shiny Project/owid-covid-data.csv")  
        result<-data.frame(filter(group_by(covid,location),location==input$C))
        result_without_NA<-na.omit(result)
        if(i==2){
            X    <- as.Date(result_without_NA$date)
        }
        else{
            X <-result_without_NA$median_age
        }
           
        Y    <- result_without_NA[,j]
        #Calculate the range of X
        rangex<-range(X)
        #calculate tthe range of Y
        rangey<-range(Y)
        #set the xlim and ylim of a plot
        plot.window(rangex,rangey)
        #draw a plot 
        plot(X,Y,pch=20,col="red",xlab = ,main ="Covid case in India")

        }) 
       
    })