#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)


# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Telephones by region"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("region","Region:",
                  choices=colnames(WorldPhones)),
      hr(),
      helpText("Data from AT&T (1961) The World's Telephones.")),
      
      # Show a plot of the generated distribution
      mainPanel(
        plotOutput("phonePlot")
      )
    )
  )
  
  # Define server logic required to draw a histogram
  server <- function(input, output) {
    
    # Fill in the spot we created for a plot
    output$phonePlot <- renderPlot({
      
      # Render a barplot
      barplot(WorldPhones[,input$region]*1000, 
              main=input$region,
              ylab="Number of Telephones",
              xlab="Year")
    })
  }

# Run the application 
shinyApp(ui = ui, server = server)
