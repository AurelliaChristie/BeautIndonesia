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
for (i in 1: length(name)){
  # Define the link
  link <- paste0(link_start, name[i], link_end)
  
  # Reading HTML Code from the website
  web <- read_html(link)
  
  # Specifying class of the data
  ## Name
  name_html <- html_node(web,".hp__hotel-name")
  ## Description
  desc_html <- html_node(web,"#property_description_content")
  ## Star
  star_html <- html_node(web,".bui-rating.bui-rating--smaller")
  ## Latitude, Longitude
  lglat_html <- html_node(web, ".jq_tooltip.loc_block_link_underline_fix.bui-link")
  
  # Converting the data to text
  ## Name
  name_data <- html_text(name_html, trim = TRUE)
  name_data <- gsub(".*\n","",name_data)
  ## Description
  desc_data <- html_text(desc_html, trim = TRUE)
  desc_data <- gsub("\n","",desc_data)
  ## Star
  star_data <- html_attr(star_html, "aria-label")
  star_data <- substr(star_data,1,1)
  ## Latitude, Longitude
  lglat_data <- html_attr(lglat_html, "data-atlas-latlng")
  lg_data <- sub(".*,","",lglat_data) 
  lat_data <- sub(",.*","",lglat_data)
  
  # Combine data to one list
  Name <- c(Name, name_data)
  Description <- c(Description, desc_data)
  Star <- c(Star, star_data)
  Long <- c(Long, lg_data)
  Lat <- c(Lat, lat_data)
}
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
