library(tidyverse)
library(leaflet)

phdir <- "D:/Peter/Pictures/2017-02-12/"

# different icons
# different colours


#================data
inc <- rbind(
  data_frame(
    id = 1,
    event = "Golden Bay Wharf",
    lat = -46.9041,
    lng = 168.1215,
    icon = "taxi",
    image = "<img src = 'P1300002.JPG'><img src = 'P1300004.JPG'>",
    description = "Beautiful sunny day when we set out" ),
  data_frame(
    id = 2,
    event = "Pretty rocks",
    lat = -46.911,
    lng = 168.09,
    icon = "camera",
    image = "<img src = 'P1300009.JPG'>",
    description = ""),
  data_frame(
    id = 3,
    event = "Paterson Inlet",
    lat = -46.9285,
    lng = 168.051541,
    icon = "video-camera",
    image = '<iframe width="279" height="157" src="https://www.youtube.com/embed/6EmO_9veLS8?autoplay=1" frameborder="0" allowfullscreen></iframe>',
    description = "Water-taxiing through Paterson inlet on the way to the walk"),
  data_frame(
    id = 4,
    event = "Entering the Freshwater River",
    lat = -46.8986,
    lng = 167.9640,
    icon = "video-camera",
    image = '<iframe width="279" height="157" src="https://www.youtube.com/embed/k-f3C81RnEs?autoplay=1" frameborder="0" allowfullscreen></iframe>',
    description = "Entering the river"
  ),
  data_frame(
    id = 5,
    event = "Upper Freshwater River",
    lat = -46.880503,
    lng = 167.939295,
    icon = "video-camera",
    image = '<iframe width="279" height="157" src="https://www.youtube.com/embed/A-2Dz09B-IY?autoplay=1" frameborder="0" allowfullscreen></iframe>',
    description = "Thinner, windier river"
  ),
  data_frame(
    id = 6, 
    event = "Drop-off",
    lat = -46.869,
    lng = 167.92,
    icon = "taxi",
    image = "<img src = 'P1300016.JPG'><img src = 'P1300017.JPG'>",
    description = "We got dropped off at a sweet little jetty near Freshwater Hut, in the early afternoon.  Looks pretty dry so far."
    ),
  data_frame(
    id = 7,
    event = "First mud!",
    lat = -46.86998,
    lng = 167.9,
    icon = "warning",
    image = "<img src = 'P1300019.JPG'>",
    description = "First mud.  Doesn't look too bad."
    ),
  data_frame(
    id = 8,
    event = "Walking",
    lat = -46.871773,
    lng = 167.890064,
    icon = "camera",
    image = "<img src = 'P1300022.JPG'>",
    description = "Beautiful day"
  ),
  data_frame(
    id = 9,
    event = "Do not proceed if...",
    lat = -46.873548,
    lng = 167.886158,
    icon = "warning",
    image = "<img src = 'P1300023.JPG'><img src = 'P1300025.JPG'>",
    description = "We obviously had a dry day."
  ),
  data_frame(
    id =10,
    event = "walking",
    lat = -46.909419,
    lng = 167.823094,
    icon = "camera",
    image = "<img src = 'P1300033.JPG'>",
    description = ""
  ),
  data_frame(
    id = 100,
    event = "We meet a kiwi",
    lat = -47.021,
    lng = 167.718,
    icon = "video-camera",
    image = '<iframe width="279" height="157" src="https://www.youtube.com/embed/iOxU1d3IbII?autoplay=1" frameborder="0" allowfullscreen></iframe>',
    description = "We met a very unafraid kiwi."
    ),
  data_frame(
    id = 100,
    event = "Mason Bay Hut",
    lat = -46.9266,
    lng = 167.7801,
    icon = "home",
    image = "",
    description = "For the first night we stayed in a hut with old people.  They'd mostly flown in that day; the plane lands on the hard sand.  Then next day they were going to reverse the walk we did; cross the 'range' and get picked up by a water taxi then back to Oban."
    ),
  data_frame(
    id = 100,
    event = "Mason's Bay",
    lat = -46.937,
    lng = 167.755,
    icon = "video-camera",
    image = '<iframe width="279" height="157" src="https://www.youtube.com/embed/gRuqnMsnB_o?autoplay=1" frameborder="0" allowfullscreen></iframe>',
    description = "Mason Bay is a rather lovely, hard sand beach we walk southwards on."),
  data_frame(
    id = 100,
    event = "Doughboy Bay Hut",
    lat = -47.0322,
    lng = 167.705,
    icon = "home",
    image = "",
    description = "For the second night we were in Doughboy Bay Hut, sharing the 8 person hut with eight hunters who had settled in for the duration."),
  data_frame(
    id = 100,
    event = "Rakeahua Hut",
    lat = -46.982096,
    lng = 167.880872,
    icon = "home",
    image = "",
    description = "We spent nearly an evening and nearly a whole leisurely day in Rakeahua Hut."
  ),
  data_frame(
    id = 100,
    event = "Pick-up",
    lat = -46.982539,
    lng = 167.885804,
    icon = "taxi",
    image = "",
    description = "Eventually we were picked up the next day"
  )
  
  ) %>%
  mutate(popup = gsub("JPG'>", "JPG' width = 200>", image),
         popup = paste(popup, "<p>", description, "</p>"),
         iconcol = ifelse(icon == "home", "blue", 
                          ifelse(icon == "taxi", "orange", "green")))

stewartIcons <- awesomeIcons(inc$icon, markerColor = inc$iconcol, library ="fa", iconColor = "white")


leaflet() %>% 
  setView(167.8, -46.95, zoom = 11) %>%
  addProviderTiles(providers$Stamen.TerrainBackground) %>%
  addAwesomeMarkers(popup = ~popup, label = ~event, data = inc, icon = stewartIcons)
