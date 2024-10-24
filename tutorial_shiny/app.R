library(shiny)
library(shinythemes)
ui <- fluidPage(
  theme = shinytheme("cerulean"),
  titlePanel("Mi app hola mundo!"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "num",
                  label = "Selecciona un numero",
                  value = 14, min = 1, max = 200)
    ),
    mainPanel(
      "este es el main panel de mi app hola mundo, y aqui van mis controles de OUTPUT", 
      plotOutput("identificador_de_mi_output")
    )
  ),
  "Hola MUNDO"
)

server <- function(input, output, session) {
  output$identificador_de_mi_output <- renderPlot({
    library(ggplot2)
    var_1 <- rnorm(input$num)
    var_2 <- data.frame(norma = var_1)
    
    ggplot(var_2, aes(x = norma)) +
      geom_density() + 
      theme_classic()
  })
}

shinyApp(ui, server)