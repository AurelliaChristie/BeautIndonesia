ui <- navbarPage("Travel Planner", position = "static-top", collapsible = TRUE,
                 
                 footer = includeHTML("HTML/Footer.html"),
                 
                 # Place Recommendation Menu
                 tabPanel("Place Recommendation",
                          includeHTML("HTML/Place_Carousel.html"),
                          tags$head(
                            tags$link(rel = "stylesheet", 
                                      type = "text/css", 
                                      href = "CSS/Carousel.css")),
                          column(8,div(class="panel panel-default",
                                       div(class="panel-body",  
                                           tags$div( align = "center",
                                                     h2("10 Most Popular Places in Indonesia"),
                                                     HTML("<i>"),
                                                     h6("Based on Interest Over Time in Google Trends"),
                                                     HTML("</i>"),
                                                     leafletOutput("Search_Ratings", height = 290)
                                                     )
                                           )                                           
                                       )
                                 ),
                          column(4, div(class="panel panel-default",
                                        div(class="panel-body",  
                                            tags$div( align = "center",
                                                      icon("quote-left", class = "fa-4x"),
                                                      h2("Why Indonesia?"),
                                                      includeHTML("HTML/Review_Carousel.html")
                                            )
                                            )
                                        )
                                 )
                 ),
                 
                 # Travel Recommendation Menu
                 tabPanel("Travel Recommendation",
                          sidebarLayout(
                              sidebarPanel(
                                  selectInput("Destination", "Travel Destination", choices = c("Bali", "Yogyakarta","Makassar","Malang","Bandung"),selected = "Bali"),
                                  ratingInput("Star", label="Hotel Star", dataStart = 0,dataStop=5, dataStep = 1), br(),
                                  actionButton("Ok_TR","Submit")
                              ),
                              mainPanel()
                          )
                 ),
                 
                 # Booking Application Menu
                 tabPanel("Booking Application",
                          column(4,div(class="panel panel-default",style="height:650px;",
                                       div(class="panel-body",
                                           div( align = "center", 
                                                h3(tags$a(href="https://www.agoda.com/en-gb/?cid=-42","Agoda",style = "color: black;")),
                                           tags$div( align = "center",
                                                     HTML("<div style='height: 170px;width:200px;'>"), #remove unwanted white space
                                                     imageOutput("Agoda"),
                                                     HTML("</div>"),
                                                     div( align = "center", 
                                                          h5(strong("4.5"),br(),strong("Rating from Google Play Store"))
                                                     )
                                           )),
                                           div(style="text-align:center;",textOutput("Agoda_desc"))
                                           ))
                          ),
                          column(4,div(class="panel panel-default",style="height:650px;",
                                       div(class="panel-body",  
                                           div( align = "center", 
                                                h3(tags$a(href="https://www.booking.com/index.en-gb.html","Booking.com",style = "color: black;")),
                                           tags$div( align = "center",
                                                     HTML("<div style='height: 170px;width:200px;'>"),
                                                     imageOutput("Booking"),
                                                     HTML("</div>"),
                                                     div( align = "center", 
                                                          h5(strong("4.7"),br(),strong("Rating from Google Play Store"))
                                                     )
                                           )),
                                           div(style="text-align:center;",textOutput("Booking_desc")),
                                           ))
                          ),
                          column(4,div(class="panel panel-default",style="height:650px;",
                                       div(class="panel-body",  
                                           div( align = "center", 
                                                h3(tags$a(href="https://www.pegipegi.com/","Pegipegi", style = "color: black;")),
                                           tags$div( align = "center",
                                                     HTML("<div style='height: 170px;width:200px;'>"),
                                                     imageOutput("Pegipegi"),
                                                     HTML("</div>"),
                                                     div( align = "center", 
                                                          h5(strong("4.6"),br(),strong("Rating from Google Play Store"))
                                                     )
                                           )),
                                           div(style="text-align:center;",textOutput("Pegipegi_desc"))
                                           ))
                          ),
                          column(4,div(class="panel panel-default",style="height:660px;",
                                       div(class="panel-body",  
                                           div( align = "center", 
                                                h3(tags$a(href="https://www.tiket.com/","Tiket.com",style = "color: black;")),
                                           tags$div( align = "center",
                                                     HTML("<div style='height: 170px;width:200px;'>"),
                                                     imageOutput("Tiket"),
                                                     HTML("</div>"),
                                                     div( align = "center", 
                                                          h5(strong("4.6"),br(),strong("Rating from Google Play Store"))
                                                     )
                                           )),
                                           div(style="text-align:center;",textOutput("Tiket_desc"))
                                           ))
                          ),
                          column(4,div(class="panel panel-default",style="height:660px;",
                                       div(class="panel-body",
                                           div( align = "center", 
                                                h3(tags$a(href="https://www.traveloka.com/en-id/","Traveloka",style = "color: black;")),
                                           tags$div( align = "center",
                                                     HTML("<div style='height: 170px;width:200px;'>"),
                                                     imageOutput("Traveloka"),
                                                     HTML("</div>"),
                                                     div( align = "center", 
                                                          h5(strong("4.8"),br(),strong("Rating from Google Play Store"))
                                                     )
                                           )),
                                           div(style="text-align:center;",textOutput("Traveloka_desc"))
                                           ))
                          ),
                          column(4,div(class="panel panel-default",style="height:660px;",
                                       div(class="panel-body",
                                           div( align = "center", 
                                                h3(tags$a(href="https://www.tripadvisor.com/","Tripadvisor",style = "color: black;")),
                                           tags$div( align = "center",
                                                     HTML("<div style='height: 170px;width:200px;'>"),
                                                     imageOutput("Tripadvisor"),
                                                     HTML("</div>"),
                                                     div( align = "center", 
                                                          h5(strong("4.4"),br(),strong("Rating from Google Play Store"))
                                                     )
                                           )),
                                           div(style="text-align:center;",textOutput("Tripadvisor_desc")),
                                           ))
                          )
                  ),
                 
                 # About Us Menu
                 tabPanel("About Us",
                          "Helloooooo we are grepinnnn hehehe"
                          
                 )
)