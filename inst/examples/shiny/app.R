library(shiny)
library(rChartsCalmap)

dat <- read.csv('http://t.co/mN2RgcyQFc')[,c('date', 'pts')]


ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      sliderInput("n", "Pick a number", min = 1, max = 229, value = 100)
    ),
    mainPanel(
      calheatmapOutput("cho")
    )
  )
)

server <- function(input, output) {
  output$cho <- renderCalheatmap({
    calheatmap(
      x = 'date', 
      y = 'pts',
      data = dat[1:input$n,],
      domain = 'month',
      start = "2012-10-27",
      legend = seq(10, 50, 10),
      itemName = 'point',
      range = 7,
      animationDuration = 0
    )
  })
}


shinyApp(ui = ui, server = server)