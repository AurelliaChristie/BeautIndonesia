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
                          column(4,div(class="panel panel-default",style="height:550px;",
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
                          column(4,div(class="panel panel-default",style="height:550px;",
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
                          column(4,div(class="panel panel-default",style="height:550px;",
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
                          column(4,div(class="panel panel-default",style="height:565px;",
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
                          column(4,div(class="panel panel-default",style="height:565px;",
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
                          column(4,div(class="panel panel-default",style="height:565px;",
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
                          column(5,offset = 1,
                                 "Arguments
expr	
An expression that returns a list.

env	
The environment in which to evaluate expr.

quoted	
Is expr a quoted expression (with quote())? This is useful if you want to save an expression in a variable.

deleteFile	
Should the file in func()$src be deleted after it is sent to the client browser? Generally speaking, if the image is a temp file generated within func, then this should be TRUE; if the image is not a temp file, this should be FALSE. (For backward compatibility reasons, if this argument is missing, a warning will be emitted, and if the file is in the temp directory it will be deleted. In the future, this warning will become an error.)

outputArgs	
A list of arguments to be passed through to the implicit call to imageOutput() when renderImage is used in an interactive R Markdown document.

Details
The expression expr must return a list containing the attributes for the img object on the client web page. For the image to display, properly, the list must have at least one entry, src, which is the path to the image file. It may also useful to have a contentType entry specifying the MIME type of the image. If one is not provided, renderImage will try to autodetect the type, based on the file extension.

Other elements such as width, height, class, and alt, can also be added to the list, and they will be used as attributes in the img object.

The corresponding HTML output tag should be div or img and have the CSS class name shiny-image-output.

See Also
For more details on how the images are generated, and how to control the output, see plotPNG().

Examples"),
                          br(),
                          br(),
                          column(6,offset = 0,
                                 imageOutput("Indonesia")),
                          br(),
                          br(),
                          br(),
                          br(),
                          div(style="text-align: center;font-size: 50px;font-family: Helvetica;",
                              "The Creator"),
                          hr(),
                          br(),
                          column(6,offset=0,
                                 div(class="panel panel-default",
                                      div(class="panel-body",
                                          div(style="text-align: center;",
                                              HTML("<div style='height: 310px'>"),
                                              imageOutput("Aurel"),
                                              HTML("</div>"),
                                              tags$a(href="https://www.linkedin.com/in/aurellia-christie-059892179/",icon("linkedin"),style='padding:4px; font-size:25px'),
                                              tags$a(href="https://github.com/AurelliaChristie", icon("github"),style='padding:4px; font-size:25px')
                                              ),
                                          div(style="text-align:center;","Enter your profile")
                                        ))),
                                 
                          column(6,offset = 0,
                                 div(class="panel panel-default",
                                     div(class="panel-body",
                                        div(style="text-align: center;",
                                            HTML("<div style='height: 310px'>"),
                                            imageOutput("Gerald"),
                                            HTML("</div>"),
                                            tags$a(href="https://www.linkedin.com/in/geraldbryan/",icon("linkedin"),style='padding:4px; font-size:25px'),
                                            tags$a(href="https://github.com/geraldbryan", icon("github"),style='padding:4px; font-size:25px')
                                        ),
                                        div(style="text-align:center;","Enter your profile")
                                      )))
                 )
)