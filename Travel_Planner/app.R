library(shiny)
library(shinydashboard)
library(shinyjs)
library(shinydashboardPlus)
library(shinyWidgets)
library(shinyalert)
library(dplyr)
library(rcompanion)
library(tidyverse)
library(GGally)
library(plotly)
library(abind)
library(timeDate)
library(rvest)
library(visNetwork)
library(dashboardthemes)
library(shiny.semantic)

# Define UI for application that draws a histogram
ui <- navbarPage("Travel Planner", position = "static-top", collapsible = TRUE,
                 
                 #Menu Place recommendation (Page 1)
                 
                 tabPanel("Place Recommendation",
                          fluidRow(
                              column(8,"Bubble output rating search from google"
                                     ),
                              column(4, "Table output rating search from google"),
                              br(),
                              column(3,
                                  tabBox(tabBox(div(style = 'overflow-y:scroll;height:300px;width=12',h6("X6. You often feel that your life is aimless, with no definite purpose", br(),br(),
                                                                                                         "X7. You never have trouble organizing the things you have to do", br(),br(),
                                                                                                         "X8. Once you've started an activity, you persist at it until you've completed it", br(),br(),
                                                                                                         "X9. Sometimes you feel that the things you have to do during the day just don't seem to matter", br(),br(),
                                                                                                         "X10. You will plan your activities from day to day", br(),br(),
                                                                                                         "X11. You tend to leave things to the last minute", br(),br(),
                                                                                                         "X12. You tend to change rather aimlessly from one activity to another during the day", br(),br(),
                                                                                                         "X13. You give up the things that you planning to do just because your friend says no", br(),br(),
                                                                                                         "X14. You think you do enough with your time", br(),br(),
                                                                                                         "X15. You are easy to get bored with your day-today activities", br(),br(),
                                                                                                         "X16. The important interests/activities in your life tend to change frequently", br(),br(),
                                                                                                         "X17. You know how much time you spend on each of the homework I do"),
                                                    title = "Question List",
                                                    height = "300px", width = 12,side = "right")))
                                  ),
                                  column(3,
                                         tabBox(tabBox(div(style = 'overflow-y:scroll;height:300px;width=12',h6("X6. You often feel that your life is aimless, with no definite purpose", br(),br(),
                                                                                                         "X7. You never have trouble organizing the things you have to do", br(),br(),
                                                                                                         "X8. Once you've started an activity, you persist at it until you've completed it", br(),br(),
                                                                                                         "X9. Sometimes you feel that the things you have to do during the day just don't seem to matter", br(),br(),
                                                                                                         "X10. You will plan your activities from day to day", br(),br(),
                                                                                                         "X11. You tend to leave things to the last minute", br(),br(),
                                                                                                         "X12. You tend to change rather aimlessly from one activity to another during the day", br(),br(),
                                                                                                         "X13. You give up the things that you planning to do just because your friend says no", br(),br(),
                                                                                                         "X14. You think you do enough with your time", br(),br(),
                                                                                                         "X15. You are easy to get bored with your day-today activities", br(),br(),
                                                                                                         "X16. The important interests/activities in your life tend to change frequently", br(),br(),
                                                                                                         "X17. You know how much time you spend on each of the homework I do"),
                                                    title = "Question List",
                                                    height = "300px", width = 12,side = "right")))
                                         ),
                                  column(3,
                                         tabBox(tabBox(div(style = 'overflow-y:scroll;height:300px;width=12',h6("X6. You often feel that your life is aimless, with no definite purpose", br(),br(),
                                                                                                         "X7. You never have trouble organizing the things you have to do", br(),br(),
                                                                                                         "X8. Once you've started an activity, you persist at it until you've completed it", br(),br(),
                                                                                                         "X9. Sometimes you feel that the things you have to do during the day just don't seem to matter", br(),br(),
                                                                                                         "X10. You will plan your activities from day to day", br(),br(),
                                                                                                         "X11. You tend to leave things to the last minute", br(),br(),
                                                                                                         "X12. You tend to change rather aimlessly from one activity to another during the day", br(),br(),
                                                                                                         "X13. You give up the things that you planning to do just because your friend says no", br(),br(),
                                                                                                         "X14. You think you do enough with your time", br(),br(),
                                                                                                         "X15. You are easy to get bored with your day-today activities", br(),br(),
                                                                                                         "X16. The important interests/activities in your life tend to change frequently", br(),br(),
                                                                                                         "X17. You know how much time you spend on each of the homework I do"),
                                                    title = "Question List",
                                                    height = "300px", width = 12,side = "right")))
                                         ),
                                    br(),
                                  column(5,
                                         tabBox(tabBox(div(style = 'overflow-y:scroll;height:300px;width=100%',h6("X6. You often feel that your life is aimless, with no definite purpose", br(),br(),
                                                                                                         "X7. You never have trouble organizing the things you have to do", br(),br(),
                                                                                                         "X8. Once you've started an activity, you persist at it until you've completed it", br(),br(),
                                                                                                         "X9. Sometimes you feel that the things you have to do during the day just don't seem to matter", br(),br(),
                                                                                                         "X10. You will plan your activities from day to day", br(),br(),
                                                                                                         "X11. You tend to leave things to the last minute", br(),br(),
                                                                                                         "X12. You tend to change rather aimlessly from one activity to another during the day", br(),br(),
                                                                                                         "X13. You give up the things that you planning to do just because your friend says no", br(),br(),
                                                                                                         "X14. You think you do enough with your time", br(),br(),
                                                                                                         "X15. You are easy to get bored with your day-today activities", br(),br(),
                                                                                                         "X16. The important interests/activities in your life tend to change frequently", br(),br(),
                                                                                                         "X17. You know how much time you spend on each of the homework I do"),
                                                    title = "Question List",
                                                    height = "300px", width = 12,side = "right")))
                                         ),
                                  column(5,
                                         tabBox(tabBox(div(style = 'overflow-y:scroll;height:300px;width=12',h6("X6. You often feel that your life is aimless, with no definite purpose", br(),br(),
                                                                                                         "X7. You never have trouble organizing the things you have to do", br(),br(),
                                                                                                         "X8. Once you've started an activity, you persist at it until you've completed it", br(),br(),
                                                                                                         "X9. Sometimes you feel that the things you have to do during the day just don't seem to matter", br(),br(),
                                                                                                         "X10. You will plan your activities from day to day", br(),br(),
                                                                                                         "X11. You tend to leave things to the last minute", br(),br(),
                                                                                                         "X12. You tend to change rather aimlessly from one activity to another during the day", br(),br(),
                                                                                                         "X13. You give up the things that you planning to do just because your friend says no", br(),br(),
                                                                                                         "X14. You think you do enough with your time", br(),br(),
                                                                                                         "X15. You are easy to get bored with your day-today activities", br(),br(),
                                                                                                         "X16. The important interests/activities in your life tend to change frequently", br(),br(),
                                                                                                         "X17. You know how much time you spend on each of the homework I do"),
                                                    title = "Question List",
                                                    height = "300px", width = 12,side = "right")))
                                  )
                              )
                        ),
                 tabPanel("Travel Recommendation",
                          sidebarLayout(
                              sidebarPanel(
                                  selectInput("Destination", "Travel Destination", choices = c("Bali", "Yogyakarta","Makassar","Malang","Bandung"),selected = "Bali"
                                              ),
                                  rating_input("Rating","Hotel Rating",value = 3, max = 5)
                              ),
                              mainPanel()
                          )
                          ),
                 tabPanel("Travel Application"
                          ),
                tabPanel(tags$li(actionLink("openModal",
                                    label = "",
                                    icon = icon("globe")),
                         class = "dropdown"),position = "right"
                         )
                )
    
# Define server logic required to draw a histogram
server <- function(input, output) {

    observeEvent(input$openModal, {
        showModal(
            modalDialog(title = "Source",)
        )
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
