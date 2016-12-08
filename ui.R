# riverTourMap UI
shinyUI( 
  fluidPage(
    # include Google Analytics
    # tags$head(includeScript("www/google-analytics.js"))
    
    h2(titlePanel("Bruce Springsteen and the E Street Band")),
    h3(titlePanel("The River 2016 & Summer '17 Tours")), 
    
    sidebarLayout(
      # sidebar ui input
      sidebarPanel(
        width = 3
        
      ),
        
      # data table
      mainPanel( 
        leafletOutput('map', height = 600)
      ) 
    )
  ) 
)



