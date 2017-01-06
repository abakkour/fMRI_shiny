library(shiny)
library(oro.nifti)
probe1=readNIfTI("probe1.nii.gz")
probe3=readNIfTI("probe3.nii.gz")
probe5=readNIfTI("probe5.nii.gz")
bg=readNIfTI("bg_image.nii.gz")

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {

  # Expression that generates a plot of the distribution. The expression
  # is wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should be automatically 
  #     re-executed when inputs change
  #  2) Its output type is a plot 
  #
  
    
  output$imagePlot <- renderPlot({

    # generate an fMRI results image and display it
    if (input$contrast=="probe1"){ orthographic(x=bg,y=ifelse(probe1 > 2.3, probe1, NA),xyz=c(input$x,input$y,input$z))}
    else if (input$contrast=="probe3"){ orthographic(x=bg,y=ifelse(probe3 > 2.3, probe3, NA),xyz=c(input$x,input$y,input$z))}
    else if (input$contrast=="probe5"){ orthographic(x=bg,y=ifelse(probe5 > 2.3, probe5, NA),xyz=c(input$x,input$y,input$z))}

  })
})
