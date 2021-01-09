# Library Setup
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
library(ShinyRatingInput)

# Place Recommendation Data

# Travel Recommendation Data

# Booking Application Data
  Booking_Apps <- read.csv("Data/Booking_Apps.csv")
  
# About Us Data


# Call ui & server
source("ui.R")
source("server.R")

# Run App
shinyApp(ui = ui,server = server)
