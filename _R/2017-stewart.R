library(tidyverse)
library(leaflet)

phdir <- "D:/Peter/Pictures/2017-02-12/"

# different icons
# different colours


#================data
inc <- rbind(
  data_frame(
    id = 1, 
    event = "Drop-off",
    lat = -46.869,
    lng = 167.92,
    icon = "taxi",
    image = "<img src = 'P1300017.JPG'>",
    description = "We got dropped off in the early afternoon.  We had a refreshing swim then a lie down, then started to walk"),
  data_frame(
    id = 2,
    event = "Pick-up",
    lat = -46.98,
    lng = 167.883,
    icon = "taxi",
    image = "",
    description = "Eventually we were picked up the next day"),
  data_frame(
    id = 3,
    event = "We meet a kiwi",
    lat = -47.021,
    lng = 167.718,
    icon = "camera",
    image = '<iframe width="279" height="157" src="https://www.youtube.com/embed/iOxU1d3IbII?autoplay=1" frameborder="0" allowfullscreen></iframe>',
    description = "We met a bloody kiwi."),
  data_frame(
    id = 4,
    event = "Mason's Bay",
    lat = -46.937,
    lng = 167.755,
    icon = "binoculars",
    image = '<iframe width="279" height="157" src="https://www.youtube.com/embed/gRuqnMsnB_o?autoplay=1" frameborder="0" allowfullscreen></iframe>',
    description = "Mason Bay is a rather lovely, hard sand beach we walk southwards on."),
  data_frame(
    id = 5,
    event = "Homestead Hunters Hut",
    lat = -46.926334,
    lng = 167.79606,
    icon = "paw",
    image = "",
    description = "A hut used by hunters"),
  data_frame(
    id = 6,
    event = "Mason Bay Hut",
    lat = -46.9266,
    lng = 167.7801,
    icon = "home",
    image = "",
    description = "For the first night we stayed in a hut with old people.  They'd mostly flown in that day; the plane lands on the hard sand.  Then next day they were going to reverse the walk we did; cross the 'range' and get picked up by a water taxi then back to Oban."),
  data_frame(
    id = 7,
    event = "Doughboy Bay Hut",
    lat = -47.0322,
    lng = 167.705,
    icon = "home",
    image = "",
    description = "For the second night we were in Doughboy Bay Hut, sharing the 8 person hut with eight hunters who had settled in for the duration."),
  data_frame(
    id = 8,
    event = "Rakeahua Hut",
    lat = -46.982096,
    lng = 167.880872,
    icon = "home",
    image = "",
    description = "We spent nearly an evening and nearly a whole leisurely day in Rakeahua Hut.")
  ) %>%
  mutate(popup = gsub("JPG'>", "JPG' width = 200>", image),
         popup = paste("<p>", description, "</p>", popup),
         iconcol = ifelse(icon == "home", "blue", "orange"))

stewartIcons <- awesomeIcons(inc$icon, markerColor = inc$iconcol, library ="fa", iconColor = "white")


leaflet() %>% 
  setView(167.8, -46.95, zoom = 11) %>%
  addProviderTiles(providers$Stamen.TerrainBackground) %>%
  addAwesomeMarkers(popup = ~popup, label = ~event, data = inc, icon = stewartIcons)
