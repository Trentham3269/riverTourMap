# riverTourMap UI
shinyUI( 
  fluidPage(
    # include Google Analytics
    tags$head(includeScript("www/google-analytics.js")),
    
    h2(titlePanel("Bruce Springsteen and the E Street Band")),
    h3(titlePanel("The River 2016 & Summer '17 Tours")), 
    br(),
    
    sidebarLayout(
      
      sidebarPanel(width = 3,
                   
        selectInput(inputId   = "selLeg"
                    , label   = "Select leg of tour:"
                    , choices = c("All"
                                  ,"North America 1"
                                  ,"Europe"
                                  ,"North America 2"
                                  ,"Australia/NZ")
                    , selected = "All"
        ), 
        
        br(),
        
        tableOutput(outputId = "table"),
        
        br(),
        
        p("Note: all distances are 'as the crow flies' as per the geosphere package's distCosine
          function.")
        
      ),
        
      # map output
      mainPanel( 
        leafletOutput(outputId = "map"
                      , height = 500)
      ) 
    )
  ) 
)



