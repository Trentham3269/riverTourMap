# riverTourMap UI
shinyUI( 
  fluidPage(
    # include Google Analytics
    # tags$head(includeScript("www/google-analytics.js"))
    
    h2(titlePanel("Bruce Springsteen and the E Street Band")),
    h3(titlePanel("The River 2016 & Summer '17 Tours")), 
    br(),
    sidebarLayout(
      # sidebar ui input
      sidebarPanel(
        selectInput(inputId = "selLeg"
                    , label = "Select leg of tour:"
                    , choices = c("All","North America 1","Europe","North America 2","Australia/NZ")
                    , selected = "All"
        ), 
        width = 3
      ),
        
      # map output
      mainPanel( 
        leafletOutput('map', height = 450)
      ) 
    )
  ) 
)



