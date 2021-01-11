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
    
    # Travel Recommendation
    
    # Booking Application
    
      ## Traveloka
      output$Traveloka <- renderImage({list(src = "www/Logo/Traveloka.jpg",
                                        contentType = "image/jpg",width=150, height=150,
                                        alt = "Face")
      })

      output$Traveloka_desc <- renderText(Booking_Apps[1,5])

      output$Traveloka_stars <- renderUI({
          n_fill <- (4.8/ 5) * 100
          # element will look like this: <div class="full-stars" style="width:n%"></div>
          style_value <- sprintf("width:%s%%", n_fill)
          tags$div(class = "full-stars", style = style_value)
      })

      ## Tripadvisor
      output$Tripadvisor <- renderImage({list(src = "www/Logo/Tripadvisor.jpg",
                                            contentType = "image/jpg",width=150, height=150,
                                            alt = "Face")
      })

      output$Tripadvisor_desc <- renderText(Booking_Apps[2,5])

      output$Tripadvisor_stars <- renderUI({
          n_fill <- (4.4/ 5) * 100
          # element will look like this: <div class="full-stars" style="width:n%"></div>
          style_value <- sprintf("width:%s%%", n_fill)
          tags$div(class = "full-stars", style = style_value)
      })

      ## Tiket
      output$Tiket <- renderImage({list(src = "www/Logo/Tiketcom.jpg",
                                            contentType = "image/jpg",width=150, height=150,
                                            alt = "Face")
      })

      output$Tiket_desc <- renderText(Booking_Apps[3,5])

      output$Tiket_stars <- renderUI({
          n_fill <- (4.6/ 5) * 100
          # element will look like this: <div class="full-stars" style="width:n%"></div>
          style_value <- sprintf("width:%s%%", n_fill)
          tags$div(class = "full-stars", style = style_value)
      })

      ## Pegi-pegi
      output$Pegipegi <- renderImage({list(src = "www/Logo/Pegipegi.jpg",
                                            contentType = "image/jpg",width=150, height=150,
                                            alt = "Face")
      })

      output$Pegipegi_desc <- renderText(Booking_Apps[4,5])

      output$Pegipegi_stars <- renderUI({
          n_fill <- (4.6/ 5) * 100
          # element will look like this: <div class="full-stars" style="width:n%"></div>
          style_value <- sprintf("width:%s%%", n_fill)
          tags$div(class = "full-stars", style = style_value)
      })

      ## Agoda
      output$Agoda <- renderImage({list(src = "www/Logo/Agoda.jpg",
                                            contentType = "image/jpg",width=150, height=150,
                                            alt = "Face")
      })

      output$Agoda_desc <- renderText(Booking_Apps[5,5])

      output$Agoda_stars <- renderUI({
          n_fill <- (4.5/ 5) * 100
          # element will look like this: <div class="full-stars" style="width:n%"></div>
          style_value <- sprintf("width:%s%%", n_fill)
          tags$div(class = "full-stars", style = style_value)
      })

      ## Booking
      output$Booking <- renderImage({list(src = "www/Logo/Bookingcom.jpg",
                                            contentType = "image/png",width=150, height=150,
                                            alt = "Face")
      })

      output$Booking_desc <- renderText(Booking_Apps[6,5])

      output$Booking_stars <- renderUI({
          n_fill <- (4.7/ 5) * 100
          # element will look like this: <div class="full-stars" style="width:n%"></div>
          style_value <- sprintf("width:%s%%", n_fill)
          tags$div(class = "full-stars", style = style_value)
      })
    
    
    # About Us
    
      ## Image

       output$Indonesia <- renderImage({list(src = "www/About_us/Indonesia.png",
                                             contentType = "image/png",width=600, height=275,
                                             alt = "Face")
                                      })

       output$Aurel <- renderImage({list(src = "www/About_us/Aurel.jpg",
                                         contentType = "image/png",width=200, height=300,
                                         alt = "Face")
                                  })

       output$Gerald <- renderImage({list(src = "www/About_us/Gerald.jpg",
                                         contentType = "image/png",width=200, height=300,
                                         alt = "Face")
       })

      ## Source 

      observeEvent(input$openModal, {
          showModal(
              modalDialog(title = "Source",
                          p("test",easyClose = TRUE, footer = NULL ))
          )
      })
}