#'Building a model which shows coronavirus cases in India
#'
#'This function displays the values in the form of radio buttons
#'set the title of page using @title \code{titlePanel} function
#'
#'loading shiny library
#'define  selection using \code{radioButtons} function
#'plot is display in main panel using \code {mainPanel} function
#'

library(shiny)

 shinyUI(fluidPage(   
     titlePanel("Cases of Covid-19"),  
     sidebarLayout(     
         sidebarPanel(
         #input using radiobuttons 
             radioButtons("C", "Select Country:",                    
                          list("India"="India")
                          ),
              radioButtons("X", "Select X-axis:",                    
                          list( "date"='b', "median_age"='e'
                               )
                          ),
              radioButtons("Y", "Select Y-axis:",                    
                           list( "total_case"='f', "new_case"='g',
                                "total_death"='h', "new_death"='i',"cvd_death_rate"='j'
                           )
            ),
        ),   
    # Show a plot of the generated distribution       
    mainPanel( 
             plotOutput("distPlot")
             )     
    )   
    
))