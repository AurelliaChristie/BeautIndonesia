server <- function(input, output) {
    
    # Place Recommendation 
        
        ## Search Ratings Map
        Nonbali_Map <- Nonbali_Search %>% 
            leaflet() %>% 
            addTiles() %>% 
            addCircleMarkers(
                ~Long,
                ~Lat,
                label = Nonbali_Lab,
                fillColor = ~Pal(Scaled_Rating),
                fillOpacity = 0.8,
                radius= 7,
                stroke = TRUE)
        
        Map <- Nonbali_Map %>% 
            addCircleMarkers(
                ~Bali_Search$Long,
                ~Bali_Search$Lat,
                label = Bali_Lab,
                fillColor = "black",
                fillOpacity=0.8,
                radius=7,
                stroke=TRUE) %>% 
            fitBounds(96.94158, 4.284619, 126.76741, -4.59741) %>% 
            addLegend(
                "bottomleft",
                colors = c("#FFF5F0","#FEE0D2","#FC9272","#FB6A4A","#CB181D","#A50F15","black"),
                labels = c("0.00 - 1.10","1.11 - 2.20","2.21 - 3.30","3.31 - 4.40","4.41 - 5.50","5.51 - 6.60","6.61, more"),
                opacity = 1,
                title = "Interest Over Time"
            )
        
        output$Search_Ratings <- renderLeaflet({Map})
    
    # Booking Apps
    
    ## Traveloka
    output$Traveloka <- renderImage({list(src = "www/Logo/Traveloka.jpg",
                                      contentType = "image/jpg",width=150, height=150,
                                      alt = "Face")
    })
    
    output$Traveloka_desc <- renderText(Booking_Apps[1,5])
    
    ## Tripadvisor
    output$Tripadvisor <- renderImage({list(src = "www/Logo/Tripadvisor.jpg",
                                          contentType = "image/jpg",width=150, height=150,
                                          alt = "Face")
    })
    
    output$Tripadvisor_desc <- renderText(Booking_Apps[2,5])
    
    ## Tiket
    output$Tiket <- renderImage({list(src = "www/Logo/Tiketcom.jpg",
                                          contentType = "image/jpg",width=150, height=150,
                                          alt = "Face")
    })
    
    output$Tiket_desc <- renderText(Booking_Apps[3,5])
    
    ## Pegi-pegi
    output$Pegipegi <- renderImage({list(src = "www/Logo/Pegipegi.jpg",
                                          contentType = "image/jpg",width=150, height=150,
                                          alt = "Face")
    })
    
    output$Pegipegi_desc <- renderText(Booking_Apps[4,5])
    
    ## Agoda
    output$Agoda <- renderImage({list(src = "www/Logo/Agoda.jpg",
                                          contentType = "image/jpg",width=150, height=150,
                                          alt = "Face")
    })
    
    output$Agoda_desc <- renderText(Booking_Apps[5,5])
    
    ## Booking
    output$Booking <- renderImage({list(src = "www/Logo/Bookingcom.jpg",
                                          contentType = "image/png",width=150, height=150,
                                          alt = "Face")
    })
    
    output$Booking_desc <- renderText(Booking_Apps[6,5])
    
}