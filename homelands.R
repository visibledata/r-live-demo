library("tidyverse")
library("sf")
library("leaflet")
library("countrycode")
library("rnaturalearth")


audience_homelands <- read_csv("data/example_homelands.csv") %>%
  mutate(iso_n3 = countrycode(country.live.coded,"country.name","iso3n"),
         iso_n3 = as.character(iso_n3))

countries_sf <- countries110 %>%
  st_as_sf()

audience_homelands %>%
  left_join(countries_sf)


