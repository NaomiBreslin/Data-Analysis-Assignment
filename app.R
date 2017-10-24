#Naomi Breslin
#17232617
#24/10/17

library(shiny)
#defining fluidpage, input the title panel and the sidebar applications
ui <- fluidPage(
  titlePanel("Probability Distribution"),
  sidebarLayout(
    sidebarPanel(
      #A numeric input for the individual to choose the number of samples
      numericInput("nums", "Choose the number of random samples:",
                   min=0,
                   max=500,
                   value=50), 
      #Two sliders for the mean and standard deviation
      sliderInput("mean",
                  "Choose the mean value:",
                  min = 1,
                  max = 100,
                  value = 50),
    
    sliderInput("sd",
                "Choose the standard deviation value:",
                min = 1,
                max = 10,
                value = 5)),
  #Defining main panel with plot output with the name hist
    mainPanel(
    plotOutput(outputId = "hist"))))

# Define server logic required to draw a histogram
server <- function(input, output){ 
   #rendering a plot based on the inputs using the plot ID defined under the main panel
   output$hist <- renderPlot({
     hist(rnorm(input$nums), 
          main = 'Histogram displaying values', 
          xlab = 'associated value', 
          col = "white", border = "black")
     
     mean(mean(input$mean))
     
     sd(sd(input$sd))
     
   })}

# Run the application 
shinyApp(ui = ui, server = server)

