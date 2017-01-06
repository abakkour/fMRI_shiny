library(shiny)

# Define UI for application that plots fmri results 
shinyUI(pageWithSidebar(

  # Application title
  headerPanel("fMRI results"),

  # Sidebar with a slider input for number of observations
  sidebarPanel(
    sliderInput("x", 
                "X:", 
                min = 1,
                max = 91, 
                value = 45),

    sliderInput("y", 
                "Y:", 
                min = 1,
                max = 109, 
                value = 55),

    sliderInput("z", 
                "Z:", 
                min = 1,
                max = 91, 
                value = 45),


    selectInput("contrast", "Contrast:",
                list("# High GO choices at probe" = "probe1", 
                     "# High GO > High NOGO at probe" = "probe3", 
                     "PPI at training (vmPFC seed)" = "probe5"))

  ),
  
  # Show a plot of the generated image
  mainPanel(
    plotOutput("imagePlot")
  )
))
