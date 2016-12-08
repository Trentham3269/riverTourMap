# riverTourMap Server
shinyServer(function(input, output) {
  
####################################################################################################

# Data ####
map.data <- reactive({
  
  # subset data based on user selection
  if (input$selLeg == "All"){
    df <- shows
  } else {
    df <- subset(shows, shows$Leg == input$selLeg)
  }
  
  # print object 
  df
  
})

#__________________________________________________________________________________________________# 
  
# Map ####
output$map <- renderLeaflet({
  
  leaflet() %>% 
    addTiles() %>% 
    addMarkers(lat     = map.data()$Latitude
               , lng   = map.data()$Longitude
               , popup = paste("<b>City:</b>", map.data()$City, "<br>"
                               , "<b>Venue:</b>", map.data()$Venue))
  
})

####################################################################################################  

}) 