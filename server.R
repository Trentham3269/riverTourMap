# riverTourMap Server
shinyServer(function(input, output) {
  
####################################################################################################

# Data ####
  
  
# Map ####
output$map <- renderLeaflet({
  
  leaflet() %>% 
    addTiles() %>% 
    addMarkers(lat     = shows$Latitude
               , lng   = shows$Longitude
               , popup = paste("<b>City:</b>", shows$City, "<br>"
                               , "<b>Venue:</b>", shows$Venue))
  
})

####################################################################################################  

}) 