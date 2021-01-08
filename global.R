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

# Destination Data

# About Us Data

#Test

Bandung <- read.csv("D:/Documents/Supertype/Unit Project or portfolio/Travel Planner/Travel-Planner/Data/Bandung_destination.csv")
Bandung <- tibble(Bandung)
Bandung <- Bandung[c(1:5,7),]

#convert long lat to distance

dist_Bandung <- dist(
  Bandung %>%
    select(c(Long,Lat)),
  method = "euclidean"
)

#TSP algorithm

tsp_Bandung <- TSP(dist_Bandung)

route <- solve_TSP(tsp_Bandung, method = "nn",control=list(start=6))

path <- names(route)

# Prepare the data for plotting
Bandung <- Bandung %>% 
  mutate(
    id_order = order(as.integer(path))
  )

# Plot a map with the data and overlay the optimal path
Bandung %>% 
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
  addPolylines(~Long, ~Lat) %>%
  addMarkers(~Long, ~Lat,labelOptions = labelOptions(noHide = T)) 

# Call ui & server
source("ui.R")
source("server.R")

# Run App
shinyApp(ui = ui,server = server)
