library("tidyverse")
library("sf")
library("leaflet")
library("countrycode")
library("rnaturalearth")


audience_homelands <- read_csv("data/homelands.csv") %>%
  mutate(iso_n3 = countrycode(country.live.coded,"country.name","iso3n"),
         iso_n3 = as.character(iso_n3))

countries_sf <- countries110 %>%
  st_as_sf()

countries_sf %>%
  right_join(audience_homelands)