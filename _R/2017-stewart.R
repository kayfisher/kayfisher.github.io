library(tidyverse)
library(leaflet)

phdir <- "D:/Peter/Pictures/2017-02-12/"

# different icons
# different colours


#================data==================
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
    id = 11,
    event = "Mason Bay Hut",
    lat = -46.9266,
    lng = 167.7801,
    icon = "home",
    image = "<img src = 'mason-hut.JPG'>",
    description = "For the first night we stayed in a hut with mostly older people.  They'd mostly flown in that day; the plane lands on the hard sand.  Then next day they were going to reverse the walk we did; cross the 'range' and get picked up by a water taxi then back to Oban.  Nice hut.  We forgot to take a photo, so this one is from the web."
  ),
  data_frame(
    id = 12,
    event = "Approaching the beach...",
    lat = -46.925009,
    lng = 167.775721,
    icon = "camera",
    image = "<img src = 'P1310039.JPG'><img src = 'P1310040.JPG'>",
    description = "Day two starts with a short walk down to the beach."
  ),
  data_frame(
    id = 13,
    event = "Kay on Mason's Bay beach...",
    lat = -46.930313,
    lng = 167.761558,
    icon = "camera",
    image = "<img src = 'P1310042.JPG'>",
    description = "Mason's Bay beach, heading south."
  ),
  data_frame(
    id = 14,
    event = "Mason's Bay",
    lat = -46.948568,
    lng = 167.745677,
    icon = "video-camera",
    image = '<iframe width="279" height="157" src="https://www.youtube.com/embed/gRuqnMsnB_o?autoplay=1" frameborder="0" allowfullscreen></iframe>',
    description = "Mason Bay is a rather lovely, hard sand beach we walk southwards on."
    ),
  data_frame(
    id = 15,
    event = "Sealion on Mason's Bay beach...",
    lat = -46.959293,
    lng = 167.728408,
    icon = "camera",
    image = "<img src = 'P1310046.JPG'><img src = 'P1310047.JPG'>",
    description = "Day two starts with a short walk down to the beach."
  ),
  data_frame(
    id = 16,
    event = "Starting uphill",
    lat = -46.966111,
    lng = 167.728185,
    icon = "camera",
    image = "<img src = 'P1310050.JPG'>",
    description = "Leaving the beach and starting up the hill."
  ),
  data_frame(
    id = 17,
    event = "Bogged!",
    lat = -46.988607,
    lng = 167.733067,
    icon = "warning",
    image = "<img src = 'P1310055.JPG'>",
    description = "We underestimated the bog and tried going straight through.  Both ended up in it up to our chests; had to work hard for Peter to get out then find a way to the other side and help pull Kay out, using his trekking pole to reach her.  It was much worse than it looks."
  ),
  data_frame(
    id = 18,
    event = "Lost! (nearly)",
    lat = -47.013,
    lng = 167.717,
    icon = "warning",
    image = "<img src = 'P1310057.JPG'>",
    description = "Somewhere near the top soon after this photo the visibility went to very little, just as we got near the top of Adam's Hill and the path vanished into a general maze of bogs and undergrowth.  Suddenly it was cold and wet, we were definitely off track; needed all of map, compass, GPS, and a fair bit of back tracking to find our way out.  After that, there was a big downhill slog in exceptionally muddy tracks, with no photos due to grumpiness and general sense of 'hope this is over soon'"
  ),
  data_frame(
    id = 19,
    event = "We meet a kiwi",
    lat = -47.021,
    lng = 167.715,
    icon = "video-camera",
    image = '<iframe width="279" height="157" src="https://www.youtube.com/embed/iOxU1d3IbII?autoplay=1" frameborder="0" allowfullscreen></iframe>',
    description = "As we got down to about 150m above the beach and out of the worst of the mud down, we suddenly met a very unafraid kiwi.  It was about 5pm and still very light, but the Stewart Island kiwis are less nocturnal than others."
    ),
  data_frame(
    id = 20,
    event = "Stream",
    lat = -47.030474,
    lng = 167.703588,
    icon = "warning",
    image = "<img src = 'P1310062.JPG'>",
    description = "Final obstacle of day 2 was a stream between us and the beach.  We used it to clean ourselves off."
  ),
  data_frame(
    id = 21,
    event = "Doughboy Bay Hut",
    lat = -47.0322,
    lng = 167.705,
    icon = "home",
    image = "<img src = 'doughboy-hut.JPG'>",
    description = "For the second night we were in Doughboy Bay Hut, sharing the 8 person hut with eight hunters who had settled in for the duration.  They played lots of cribbage, drank lots of whisky, hadn't killed anything, and had advice about getting through the quicksand the next day.  Again, we forgot to take a photo, so this is someone else's."
  ),
  data_frame(
    id = 22,
    event = "Doughboy Hill",
    lat = -47.021,
    lng = 167.733067,
    icon = "camera",
    image = "<img src = 'P2010066.JPG'><img src = 'P2010071.JPG'>",
    description = "After navigating the quicksand, it was a long hard slog up to Doughboy Hill, through steep mud, followed by deep mud and bog (basically requiring lots of micro-diversions).  Here we are after the worst of it."
  ),
  
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
  mutate(popup = gsub("JPG'>", "JPG' width = 300>", image),
         popup = paste(popup, "<p>", description, "</p>"),
         event = paste0(id, ". ", event),
         iconcol = ifelse(icon == "home", "blue", 
                          ifelse(icon == "taxi", "orange", "green")))


stewartIcons <- awesomeIcons(inc$icon, markerColor = inc$iconcol, library ="fa", iconColor = "white")

# provider <- providers$Stamen.TerrainBackground
provider <- providers$Esri.WorldTopoMa

leaflet() %>% 
  setView(167.8, -46.95, zoom = 11) %>%
  addProviderTiles(provider) %>%
  addAwesomeMarkers(popup = ~popup, label = ~event, data = inc, icon = stewartIcons)
