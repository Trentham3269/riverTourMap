shinyServer(function(input, output) {

  # DATA -------------------------------------------------------------------------------------------
  
  # Subset data based on user selection
  map.data <- reactive({
    
    if (input$selLeg == "All"){
      shows
    } else {
      subset(shows, shows$Leg == input$selLeg)
    }
    
  })
  
  # Calculate distances based on user selection
  map.table <- reactive({
    
    nms  <- as.data.frame(c("Kilometres", "Miles"))
    dist <- as.data.frame(c(round(sum(map.data()$Dist_kms), 1), round(sum(map.data()$Dist_mls), 1)))
    tbl  <- cbind(nms, dist)
    colnames(tbl) <- c("Measurement", "Distance")
    
    # print object
    tbl
    
  })
  
  # MAP --------------------------------------------------------------------------------------------
  
  output$map <- renderLeaflet({
    
    leaflet() %>% 
      addTiles('http://{s}.tile.osm.org/{z}/{x}/{y}.png') %>% 
      addMarkers(lng     = map.data()$Longitude
                 , lat   = map.data()$Latitude
                 , popup = paste("<b>Leg:</b>", map.data()$Leg, "<br>"
                                 , "<b>City:</b>", map.data()$City, "<br>"
                                 , "<b>Country:</b>", map.data()$Country, "<br>"
                                 , "<b>Venue:</b>", map.data()$Venue))
    
  })
  
  # TABLE ------------------------------------------------------------------------------------------
  
  output$table <- renderTable({
    
    map.table()
    
  })

}) 