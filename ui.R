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
                                                     icon("bar-chart", class = "fa-4x"),
                                                     div( align = "center", 
                                                          h5("Bubble output rating search from google")
                                                     )
                                           ),
                                           tags$p(h6("Over 30 years of data were collected, which resulted in nearly 500,000 records of career movement. Several business rules were developed to ensure the data reflected real opportunities in the current classification system.")),
                                           tags$ul(
                                             tags$li(h6("Any career movement within 30 days of a previous career movement was ignored. Although this represents a small percent of movement, these job transitions may have reflected data entry errors and may have skewed probabilities in jobs with a small number of incumbents.")),
                                             tags$li(h6("Multiple transfers within the same classification were ignored when there were 2 or more transfers to the same position. Although single transfers were counted, multiple transfers inflated the likelihood that the next step was a transfer.")),
                                             tags$li(h6("Expired classifications were removed from an individual's career path in the source data, because their path is no longer possible in the current system.")),
                                             tags$li(h6("Minor demotions were retained in the data to reflect deliberate career choices; however, demotions of a significant percent were excluded."))
                                           )))
                          ),
                          column(4, div(class="panel panel-default",
                                        div(class="panel-body",  
                                            tags$div( align = "center",
                                                      icon("bar-chart", class = "fa-4x"),
                                                      div( align = "center", 
                                                           h5("Table output rating search from google")
                                                      )
                                            ),
                                            tags$p(h6("Over 30 years of data were collected, which resulted in nearly 500,000 records of career movement. Several business rules were developed to ensure the data reflected real opportunities in the current classification system.")),
                                            tags$ul(
                                              tags$li(h6("Any career movement within 30 days of a previous career movement was ignored. Although this represents a small percent of movement, these job transitions may have reflected data entry errors and may have skewed probabilities in jobs with a small number of incumbents.")),
                                              tags$li(h6("Multiple transfers within the same classification were ignored when there were 2.")),
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
                                  ratingInput("Star", label="Hotel Star", dataStart = 0,dataStop=5, dataStep = 1),
                              ),
                              mainPanel()
                          )
                 ),
                 
                 # Booking Application Menu
                 tabPanel("Booking Application",
                          column(4,div(class="panel panel-default",
                                       div(class="panel-body",  
                                           tags$div( align = "center",
                                                     icon("bar-chart", class = "fa-4x"),
                                                     div( align = "center", 
                                                          h5("Bubble output rating search from google")
                                                     )
                                           ),
                                           tags$p(h6("Over 30 years of data were collected, which resulted in nearly 500,000 records of career movement. Several business rules were developed to ensure the data reflected real opportunities in the current classification system.")),
                                           ))
                          ),
                          column(4,div(class="panel panel-default",
                                       div(class="panel-body",  
                                           tags$div( align = "center",
                                                     icon("bar-chart", class = "fa-4x"),
                                                     div( align = "center", 
                                                          h5("Bubble output rating search from google")
                                                     )
                                           ),
                                           tags$p(h6("Over 30 years of data were collected, which resulted in nearly 500,000 records of career movement. Several business rules were developed to ensure the data reflected real opportunities in the current classification system.")),
                                           ))
                          ),
                          column(4,div(class="panel panel-default",
                                       div(class="panel-body",  
                                           tags$div( align = "center",
                                                     icon("bar-chart", class = "fa-4x"),
                                                     div( align = "center", 
                                                          h5("Bubble output rating search from google")
                                                     )
                                           ),
                                           tags$p(h6("Over 30 years of data were collected, which resulted in nearly 500,000 records of career movement. Several business rules were developed to ensure the data reflected real opportunities in the current classification system.")),
                                           ))
                          ),
                          column(4,div(class="panel panel-default",
                                       div(class="panel-body",  
                                           tags$div( align = "center",
                                                     icon("bar-chart", class = "fa-4x"),
                                                     div( align = "center", 
                                                          h5("Bubble output rating search from google")
                                                     )
                                           ),
                                           tags$p(h6("Over 30 years of data were collected, which resulted in nearly 500,000 records of career movement. Several business rules were developed to ensure the data reflected real opportunities in the current classification system.")),
                                           ))
                          ),
                          column(4,div(class="panel panel-default",
                                       div(class="panel-body",  
                                           tags$div( align = "center",
                                                     icon("bar-chart", class = "fa-4x"),
                                                     div( align = "center", 
                                                          h5("Bubble output rating search from google")
                                                     )
                                           ),
                                           tags$p(h6("Over 30 years of data were collected, which resulted in nearly 500,000 records of career movement. Several business rules were developed to ensure the data reflected real opportunities in the current classification system.")),
                                           ))
                          ),
                          column(4,div(class="panel panel-default",
                                       div(class="panel-body",  
                                           tags$div( align = "center",
                                                     icon("bar-chart", class = "fa-4x"),
                                                     div( align = "center", 
                                                          h5("Bubble output rating search from google")
                                                     )
                                           ),
                                           tags$p(h6("Over 30 years of data were collected, which resulted in nearly 500,000 records of career movement. Several business rules were developed to ensure the data reflected real opportunities in the current classification system.")),
                                           ))
                          )
                  ),
                 
                 # About Us Menu
                 tabPanel("About Us",
                          "Helloooooo we are grepinnnn hehehe"
                          
                 )
)