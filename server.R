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
    addTiles('http://{s}.tile.osm.org/{z}/{x}/{y}.png') %>% 
    addMarkers(lng    = map.data()$Longitude
               , lat  = map.data()$Latitude
               , popup = paste("<b>Leg:</b>", map.data()$Leg, "<br>"
                               , "<b>City:</b>", map.data()$City, "<br>"
                               , "<b>Country:</b>", map.data()$Country, "<br>"
                               , "<b>Venue:</b>", map.data()$Venue))
  
})

####################################################################################################  

}) 