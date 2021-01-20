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
    
      ## Route Optimization
        
        ### Read Input Data
        City_read <- eventReactive(input$Submit,{get(input$Destination)}) #to call dataframe use 'get()' function
        
        Stars <- eventReactive(input$Submit,{as.numeric(input$Star)+4})
        
        Stars_max7 <- reactive({ifelse(Stars() <= 7, 7,Stars())})
        
        ### Prepare Data for Route Optimization
        City_tibble <- reactive({tibble(City_read())})
        City_data <- reactive({City_tibble()[c(1:5,Stars_max7()),]})
       
        ### convert long lat to distance
        dist_City <- reactive({dist(
          City_data() %>%
            select(c(Long,Lat)),
          method = "euclidean"
        )})
       
        ### TSP algorithm
        tsp_City <- reactive({TSP(dist_City())})
        
        Route <- reactive({solve_TSP(tsp_City(), method = "nn",control=list(start=6))})
        
        Path <- reactive({names(Route())})
        
        ### Prepare the data for plotting
        City_prep <- reactive({City_data() %>%
            mutate(id_order = order(as.integer(Path()))
            )%>%
            arrange(id_order)})
        
        ### Plot a map with the data and overlay the optimal path
        City_map <- reactive({
          City_prep() %>% 
            arrange(id_order) %>% 
            leaflet() %>% 
            addTiles() %>% 
            addCircleMarkers(
              ~Long,
              ~Lat,
              fillColor = 'red',
              fillOpacity = 0.5,
              stroke = FALSE,
              label= ~as.character(Name)
            )%>%
            addPolylines(lng = ~Long, lat = ~Lat, options = list(need_decorator = TRUE)) %>%
            addMarkers(~Long, ~Lat,labelOptions = labelOptions(noHide = T,textOnly =TRUE, textsize = '30px',style = "A",direction = TRUE),label = City_prep()$id_order)
        })
            
        output$Route_map <- renderLeaflet(City_map())
      
      ## Destination Descriptions
        
        ### Title
        desc_title <- eventReactive(input$Submit, {
          div(style="text-align: center;font-size: 30px;font-family: Helvetica;",
              hr(),"About The Destinations")
        })
        output$Desc_title <- renderUI({desc_title()})
        
        ### Destination Place selectInput
        choices <- eventReactive(input$Submit, {City_read()[c(1:5,Stars_max7()),1]})
        selected <- eventReactive(input$Submit, {City_read()[Stars_max7(),1]})
        output$Place <- renderUI({
          selectInput("Dest_Place", "Destination Place", choices = choices(), selected = selected())
        })
        
        Button <- eventReactive(input$Submit,{actionButton("Ok","Ok")}) 
        output$Ok <- renderUI(Button())
        
        ### Destination Place Image
        path <- eventReactive(input$Ok,{
          paste0("www/Place_Image/",gsub("_dest","",input$Destination), "/",input$Dest_Place,".jpg")
        })
        
        output$place_image <- renderImage({list(src = path(),
                                                contentType = "image/jpg",width=250, height=150,alt=" ")
        }) 
        
        ### Destination Place Description
        desc <- eventReactive(input$Ok,{
          City_read()[City_read()$Name == input$Dest_Place, "Description"]
        })
        output$place_desc <- renderText({desc()})
        
        ### Tips
        tips_tit <- eventReactive(input$Ok, {
          div(style="text-align:center; font-size:16px; font-weight:bold; font-family:Helvetica;", paste0(gsub("_dest","",input$Destination)," Travel Tips"),br())
        })
        output$tips_title <- renderUI({tips_tit()})
        
        tips_con <- eventReactive(input$Ok, {
          travel_tips %>% select(input$Destination)
        })
        tips_cont <- reactive(
          kable(tips_con(), format="html", align = "c") %>%
            kable_styling(bootstrap_options = c("hover"))
        )
        output$tips_content <- reactive(gsub("<thead>.*</thead>", "", tips_cont()))
      
      ## Reviews
        
        ### What They Said About The Destinations
        rev_tit <- eventReactive(input$Ok, {
          div(style="text-align:center; font-size:16px; font-weight:bold; font-family:Helvetica;", "What They Said About The Destination")
        })
        output$rev_title <- renderUI({rev_tit()})
          
          #### Input Data
          rev_read <- eventReactive(input$Ok,{
            {get(gsub("_dest","_rev",input$Destination))}
          })
          pl <- eventReactive(input$Ok, {word(input$Dest_Place,1)})
          dpl <- reactive(rev_read() %>% select(pl()) %>% as.character())
          
          #### Data Preparation for Word Cloud
          
          #### Convert review to corpus vector
          corp <- reactive(VCorpus(VectorSource(dpl())))
          
          #### Convert all text to lower case
          corp_low <- reactive(tm_map(corp(), content_transformer(tolower)))
          
          #### Transform punctuations to empty space
          corp1 <- reactive(tm_map(corp_low(), trans, "@"))
          corp2 <- reactive(tm_map(corp1(), trans, "/"))
          corp3 <- reactive(tm_map(corp2(), trans, "\\|"))
          corp4 <- reactive(tm_map(corp3(), trans, "-"))
          
          #### Remove other punctuations
          corp5 <- reactive(tm_map(corp4(), removePunctuation))
          
          #### Remove numbers
          corp6 <- reactive(tm_map(corp5(), removeNumbers))
          
          #### Remove stopwords
          corp7 <- reactive(tm_map(corp6(), removeWords, stopwords("english")))
          
          #### Apply stemming (eg. "doing" -> "do")
          corp8 <- reactive(tm_map(corp7(), lemmatize_words))
          
          #### Remove extra white space
          corp_fin <- reactive(tm_map(corp8(), stripWhitespace))
          
          #### Document Term Matrix
          dtm <- reactive(TermDocumentMatrix(corp_fin()))
          mat <- reactive(as.matrix(dtm()))
          
          #### Change matrix to data frame (sort from the largest to lowest frequency)
          mat2 <- reactive(sort(rowSums(mat()), decreasing = TRUE))
          df <- reactive(data.frame(Word = names(mat2()), Frequency = mat2()))
      
        output$rev_words <- renderWordcloud2({
          set.seed(100)
          wordcloud2(df(), shape = "circle", size = 1)
        })
        
        ### How They Felt About The Destination
        sent_tit <- eventReactive(input$Ok, {
          div(style="text-align:center; font-size:16px; font-weight:bold; font-family:Helvetica;", "How They Felt About The Destination")
        })
        output$sent_title <- renderUI({sent_tit()})
        
          #### Fetch Sentiment Words
          sent <- reactive(get_nrc_sentiment(dpl()))
          comb <- reactive(cbind(dpl(), sent()))
          
          #### Total Sentiment Score per Category
          total_sen <- reactive(data.frame(colSums(comb()[, c(2:11)])))
          total_sent <- reactive(cbind("Sentiment" = rownames(total_sen()), total_sen()))
          rownames(total_sent) <- NULL
        
          #### Sentiment Plot
          sent_plot <- reactive(
            ggplot(total_sent(), aes(x=colSums.comb.....c.2.11..., y= reorder(Sentiment,colSums.comb.....c.2.11...))) +
            geom_bar(stat="identity") +
            theme_classic()+
            theme(legend.position="none") +
            xlab("Total Count")+
            ylab("")
          )
          output$sent_cont <- renderPlot(sent_plot())
        
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
                                         contentType = "image/png",width=180, height=200,
                                         alt = "Face")
                                  })

       output$Gerald <- renderImage({list(src = "www/About_us/Gerald.jpg",
                                         contentType = "image/png",width=180, height=200,
                                         alt = "Face")
       })

      ## Source 
      observeEvent(input$openModal, {
          showModal(
              modalDialog(title = "Sources",
                          p(h4("Destination City"),hr(),
                            tags$a(href="https://www.bing.com/search?q=bali&cvid=0b6de456e63d4e7daf0622e263a28168&FORM=ANAB01&PC=U531", "Bali"),br(),
                            tags$a(href="https://www.bing.com/search?q=yogyakarta&cvid=4a703385b91743d184d32f878307d0a7&FORM=ANAB01&PC=U531","Yogyakarta"),br(),
                            tags$a(href="https://www.bing.com/search?q=malang&cvid=2ede33e60edc4aa2a4d0345cefd1c577&FORM=ANAB01&PC=U531","Malang"),br(),
                            tags$a(href="https://www.bing.com/search?q=makassar&cvid=a1e4b62cdcb0461bb0de372a9593b934&FORM=ANAB01&PC=U531","Makassar"),br(),
                            tags$a(href="https://www.bing.com/search?q=bandung&cvid=26108fcbb90b40b6aebe13d791c5868c&FORM=ANAB01&PC=U531","Bandung"),br(),br(),
                            h4("Travel Tips"), hr(),
                            tags$a(href="https://www.tripsavvy.com/etiquette-tips-for-travelers-in-bali-1629371#:~:text=Bali%20locals%20never%20show%20anger%20or%20passion%20openly%2C,be%20touched%20on%20their%20heads%2C%20so%20no%20noogies.","Bali Travel Tips"),br(),
                            tags$a(href="https://factsofindonesia.com/norms-in-yogyakarta.", "Yogyakarta Travel Tips"),br(),
                            tags$a(href="https://www.travelinsurance.com.au/articles/etiquette-essentials-when-visiting-indonesia/", "Makassar Travel Tips"),br(),
                            tags$a(href="https://www.lifeofbrit.com/20-travel-tips-for-indonesia/", "Malang Travel Tips"),br(),
                            tags$a(href="https://factsofindonesia.com/things-to-avoid-in-bandung", "Bandung Travel Tips"),br(),br(),
                            h4("Travel Destination Place"),hr(),
                            tags$a(href="https://www.thebrokebackpacker.com/best-places-to-visit-in-bali/", "Bali Travel Destination"),
                            tags$a(href="https://twomonkeystravelgroup.com/7-awesome-things-to-do-in-yogyakarta-indonesia/","Yogyakarta Travel Destination"),br(),
                            tags$a(href="http://www.travelingwhere.com/2015/05/10-best-tourist-destinations-in-makassar.html", "Makassar Travel Destination"),br(),
                            tags$a(href="http://www.travelingwhere.com/2015/05/10-popular-tourist-destinations-in.html", "Malang Travel Destination"),br(),
                            tags$a(href="https://captureindonesia.com/java/west-java/bandung-interesting-places/", "Bandung Travel Destination"),br(),br(),
                            h4("Other"),hr(),
                            tags$a(href="https://www.tripadvisor.com", "Travel Destination Review"),br(),
                            tags$a(href="https://www.booking.com/hotel/id/", "Hotel Destination Review"),br(),
                            tags$a(href="https://play.google.com/store/search?q=travel&c=apps","Booking Applications"),
                            easyClose = TRUE, footer = NULL ))
          )
      })
}