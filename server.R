server <- function(input, output) {
    
    # Booking App Logo
    
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