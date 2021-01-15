# Library Setup
library(shiny)
library(shinyjs)
library(shinyalert)
library(dplyr)
library(tidyverse)
library(ShinyRatingInput)
library(htmlwidgets)
library(leaflet)
library(htmltools)
library(glue)
library(TSP)
library(tibble)
library(googleway)
library(googlePolylines)
library(leaflet)

# Place Recommendation Data

  ## Search Ratings Map
  
    ### Read Data
    Search_Rating <- read.csv("Data/Place_Rating_Score.csv")
    Search_Rating <- Search_Rating %>% 
      mutate("Scaled_Rating" = Searching.Rating * 10)
    
    ### Separate Bali & non Bali
    Bali_Search <- Search_Rating %>%  filter(Place == "Bali")
    Nonbali_Search <- Search_Rating %>% filter(Place != "Bali")
    
    ### Color Palette
    Pal <- colorNumeric(palette = "Reds", domain = Nonbali_Search$Scaled_Rating)
    
    ### Bali Map Labels
    Bali_Lab <- glue("
                     <b>{Bali_Search$Place}</b><br>  Interest Over Time: {round(Bali_Search$Searching.Rating, 2)}"
                     ) %>% lapply(HTML)

    ### Non Bali Map Labels
    Nonbali_Lab <- glue("
                     <b>{Nonbali_Search$Place}</b><br> Interest Over Time: {round(Nonbali_Search$Searching.Rating, 2)}"
    ) %>% lapply(HTML)
    
# Travel Recommendation Data
  
  ## Read Place Destination Data
    
    ### Bali
    
    Bali_dest <- read.csv("data/Bali_destination.csv")
    
    ### Yogyakarta
    
    Yogyakarta_dest <- read.csv("data/Yogya_destination.csv")
    
    ### Makassar
    
    Makassar_dest <- read.csv("data/Makassar_destination.csv")
    
    ### Malang
    
    Malang_dest <- read.csv("data/Malang_destination.csv")
    
    ### Bandung
    
    Bandung_dest <- read.csv("data/Bandung_destination.csv")
    
# Booking Application Data
  
  ## Read Data
  Booking_Apps <- read.csv("Data/Booking_Apps.csv")
  
# About Us Data


# Call ui & server
source("ui.R")
source("server.R")

# Run App
shinyApp(ui = ui,server = server)
