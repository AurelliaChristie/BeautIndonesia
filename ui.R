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
                              ## Sidebar
                              sidebarPanel(
                                  selectInput("Destination", "Travel Destination", choices = c("Bali"="Bali_dest", 
                                                                                               "Yogyakarta"="Yogyakarta_dest",
                                                                                               "Makassar"="Makassar_dest",
                                                                                               "Malang"="Malang_dest",
                                                                                               "Bandung"="Bandung_dest"),selected = "Bali"),
                                  ratingInput("Star", label="Hotel Star", dataStart = 0,dataStop=5, dataStep = 1,value=3), br(),
                                  actionButton("Submit","Submit")
                              ),
                              ## Main Panel
                              mainPanel(
                                ### Map
                                leafletOutput("Route_map"),
                                ### Description Title        
                                uiOutput("Desc_title"),
                                br(),
                                uiOutput("Place"),
                                ### Description Content
                                fluidRow(
                                  div(style="text-align: center;",
                                    column(6, offset = 0,
                                            HTML("<div style='height:170px; width:350px;'>"), #remove unwanted white space
                                            imageOutput("place_image"),
                                            HTML("</div>"),
                                            textOutput("place_desc")),
                                      
                                    column(6,offset = 0,
                                            uiOutput("tips_title"),
                                            div(style="font-size:10px;",br()),
                                            tableOutput("tips_content"))
                                    )
                                  ),
                                ### Reviews
                                fluidRow(
                                  div(style="text-align: center;",
                                    column(6, offset = 0,
                                           br(),
                                           uiOutput("rev_title"),
                                           wordcloud2Output("rev_words")),
                                    
                                    column(6,offset = 0,
                                           br(),
                                           uiOutput("sent_title"),
                                           plotOutput("sent_cont"))
                                  )
                                )
                              )
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
                                                          includeCSS("www/CSS/stars.css"),
                                                          tags$div(class = "ratings",
                                                                   tags$div(class = "empty-stars",
                                                                            uiOutput("Agoda_stars")),div(style="color: black;",strong("4.5"))),
                                                          h5(strong("Rating from Google Play Store"))
                                                     )
                                           )),
                                           div(style="text-align:justify;",textOutput("Agoda_desc"))
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
                                                          tags$div(class = "ratings",
                                                                   tags$div(class = "empty-stars",
                                                                            uiOutput("Booking_stars")),div(style="color: black;",strong("4.7"))),
                                                          h5(strong("Rating from Google Play Store"))
                                                     )
                                           )),
                                           div(style="text-align:justify;",textOutput("Booking_desc")),
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
                                                          tags$div(class = "ratings",
                                                                   tags$div(class = "empty-stars",
                                                                            uiOutput("Pegipegi_stars")),div(style="color: black;",strong("4.6"))),
                                                          h5(strong("Rating from Google Play Store"))
                                                     )
                                           )),
                                           div(style="text-align:justify;",textOutput("Pegipegi_desc"))
                                           ))
                          ),
                          column(4,div(class="panel panel-default",style="height:700px;",
                                       div(class="panel-body",  
                                           div( align = "center", 
                                                h3(tags$a(href="https://www.tiket.com/","Tiket.com",style = "color: black;")),
                                           tags$div( align = "center",
                                                     HTML("<div style='height: 170px;width:200px;'>"),
                                                     imageOutput("Tiket"),
                                                     HTML("</div>"),
                                                     div( align = "center", 
                                                          tags$div(class = "ratings",
                                                                   tags$div(class = "empty-stars",
                                                                            uiOutput("Tiket_stars")),div(style="color: black;",strong("4.6"))),
                                                          h5(strong("Rating from Google Play Store"))
                                                     )
                                           )),
                                           div(style="text-align:justify;",textOutput("Tiket_desc"))
                                           ))
                          ),
                          column(4,div(class="panel panel-default",style="height:700px;",
                                       div(class="panel-body",
                                           div( align = "center", 
                                                h3(tags$a(href="https://www.traveloka.com/en-id/","Traveloka",style = "color: black;")),
                                           tags$div( align = "center",
                                                     HTML("<div style='height: 170px;width:200px;'>"),
                                                     imageOutput("Traveloka"),
                                                     HTML("</div>"),
                                                     div( align = "center", 
                                                          tags$div(class = "ratings",
                                                                   tags$div(class = "empty-stars",
                                                                            uiOutput("Traveloka_stars")),div(style="color: black;",strong("4.8"))),
                                                          h5(strong("Rating from Google Play Store"))
                                                     )
                                           )),
                                           div(style="text-align:justify;",textOutput("Traveloka_desc"))
                                           ))
                          ),
                          column(4,div(class="panel panel-default",style="height:700px;",
                                       div(class="panel-body",
                                           div( align = "center", 
                                                h3(tags$a(href="https://www.tripadvisor.com/","Tripadvisor",style = "color: black;")),
                                           tags$div( align = "center",
                                                     HTML("<div style='height: 170px;width:200px;'>"),
                                                     imageOutput("Tripadvisor"),
                                                     HTML("</div>"),
                                                     div( align = "center",
                                                          tags$div(class = "ratings",
                                                                   tags$div(class = "empty-stars",
                                                                            uiOutput("Tripadvisor_stars")),div(style="color: black;",strong("4.4"))),
                                                          h5(strong("Rating from Google Play Store"))
                                                     )
                                           )),
                                           div(style="text-align:justify;",textOutput("Tripadvisor_desc")),
                                           ))
                          )
                  ), 
                 
                 # About Us Menu
                 tabPanel("About Us",
                        div(style="text-align: center;font-size: 70px;font-family: Helvetica;",
                              "Travel Planner"),
                          div(style="text-align: center;",actionLink("openModal",
                                     icon = icon("globe"),
                                     label = "Sources",
                                     class = "dropdown",
                                     style='padding:4px; font-size:20px')),
                          hr(),
                          br(),
                        fluidRow(column(5,offset = 1,
                                 div(style="text-align:justify;","Travel Planner is an application for tourists who want to plan their trip to Indonesia. 
                                 In this app, we provide you the 5 most popular places in Indonesia based on interest over time from Google Trends.
                                 These places are very famous tourist places among Indonesian and we will try to make it a global sensations!",
                                 br(),br(),
                                 "If you are having a little doubt to travel because you do not know about the place, the place culture, and the clickbait of the media.
                                 Don't worry, because those are the reason why this app is made :D", br(),br(),
                                 "In this application you can find 25 amazing tourist places and 15 great hotels from the 5 most search rating in Google that will take you to an dream places that you want to visit.
                                 Moreover, we also provide the route optimization, so you will effectively spend your time enjoying the places, not stuck in the car for a long time.
                                 There are also some reviews from other tourists hat will give you a big picture what to expect from those places.
                                 Lastlt, there are also 6 top travel applications that you can use to book your hotel or admission ticket of the places.", br(),br(),
                                 "That's all for this application, feel free to give us feedback by reaching us from our LinkedIn, come to Indonesia ASAP, we 100% sure you will not regret itt! See yaa :D
                                 ")),
                          br(),
                          br(),
                          column(6,offset = 0,
                                 imageOutput("Indonesia"))),
                          br(),
                          hr(),
                          div(style="text-align: center;font-size: 50px;font-family: Helvetica;",
                              "The Creators"),
                          br(),
                          column(6,offset=0,
                                 div(class="panel panel-default",
                                      div(class="panel-body",
                                          div(style="text-align: center;",
                                              HTML("<div style='height: 210px'>"),
                                              imageOutput("Aurel"),
                                              HTML("</div>"),
                                              tags$a(href="https://www.linkedin.com/in/aurellia-christie-059892179/",icon("linkedin"),style='padding:4px; font-size:25px'),
                                              tags$a(href="https://github.com/AurelliaChristie", icon("github"),style='padding:4px; font-size:25px')
                                              ),
                                          div(style="text-align:center;","Hi! I'm Aurellia Christie, at the moment I'm a college students major in mathematics, I'm also interested in data science. 
                                                                          Currently I'm also doing my internship in Supertype and a part-time tutor as Mathematics tutor at Tutor aja.
                                                                          Travelling is also my hobby to relieve stress and gateaway from my tight schedule.
                                                                          We can talk more about data science, mathematics, and obviously TRAVELLING, so don't forget too reach me through LinkedIn, see ya! :)"
                                                                          )
                                        ))),
                                 
                          column(6,offset = 0,
                                 div(class="panel panel-default",
                                     div(class="panel-body",
                                        div(style="text-align: center;",
                                            HTML("<div style='height: 210px'>"),
                                            imageOutput("Gerald"),
                                            HTML("</div>"),
                                            tags$a(href="https://www.linkedin.com/in/geraldbryan/",icon("linkedin"),style='padding:4px; font-size:25px'),
                                            tags$a(href="https://github.com/geraldbryan", icon("github"),style='padding:4px; font-size:25px')
                                        ),
                                        div(style="text-align:center;","Hi! I'm Gerald Bryan, like Aurellia I'm still a college students major in mathematics, also now I'm doing my internship at Supertype.
                                            I'm interest in data science and data analytics specially in data story telling. 
                                            And I'M ALSO A TRAVEL ENTHUSIAST! If you have similiar interest with me feel free to connect with me in LinkedIn, 
                                            if don't, you can still connect with me because we won't know in the future maybe we will need each other:)")
                                      )))
                 )
)