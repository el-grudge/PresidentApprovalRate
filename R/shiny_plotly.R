# create a fluid layout with rows & columns
ui <- fluidPage(
  fluidRow(
    column(6, plotOutput("approval_grid")),
    column(6, plotlyOutput("approval_voters"))
  ),
  fluidRow(
    column(6, plotlyOutput("approval_adults")),
    column(6, plotlyOutput("approval_allpolls"))
  )
)

server <- function(input, output) {
  output$approval_grid <- renderPlot({
    subgroup + point + line + ribbon + pointrange + colorscale + fillscale + themefte + themesettings + linetext + label + facet_grid(vars(subgroup))
  })
  output$approval_voters <- renderPlotly({
    subgroup_voters + point + line + ribbon + linerange + colorscale + fillscale + themefte + themesettings + label_voters
  })
  output$approval_adults <- renderPlotly({
    subgroup_adults + point + line + ribbon + pointrange + colorscale + fillscale + themefte + themesettings + label_adults
  })
  output$approval_allpolls <- renderPlotly({
    subgroup_allpolls + point + line + ribbon + pointrange + colorscale + fillscale + themefte + themesettings + label_allpolls
  })
}

shinyApp(ui = ui, server = server)
