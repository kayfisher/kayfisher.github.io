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
    description = "We obviously had a drier day than some. The sign warns you not to proceed if the water is about 40cm above the path."
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
    description = "For the first night we stayed in a hut with mostly older people. Most of them had flown in that day in a small plane that lands on the hard sand on the beach (braver than us).  Then next day they were going back the way we came; across the imperceptible 'range' and picked up by a water taxi back to Oban.  Nice hut.  We forgot to take a photo, so this one is from the web."
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
    description = "Female sealion by its lonesome. We weren't sure if it was alive until we were walking past and it moved its head to stare at us."
  ),
  data_frame(
    id = 16,
    event = "Starting uphill",
    lat = -46.966111,
    lng = 167.728185,
    icon = "camera",
    image = "<img src = 'P1310050.JPG'>",
    description = "Leaving the beach and starting up the hill. Still doesn't look too bad. Quite pretty really."
  ),
  data_frame(
    id = 17,
    event = "Bogged!",
    lat = -47.0,
    lng = 167.733067,
    icon = "warning",
    image = "<img src = 'P1310055.JPG'>",
    description = "The mud began to live up to the track's reputation after the first 200 vertical metres of the uphill. At the top of the first hill we came to our first serious bog/marsh. As unsuspecting mud novices, we didn't recognise what it was and after a brief pause we walked straight ahead following the direct line of the path. We both ended up completely enveloped in the bog/marsh up to our upper chests, kept afloat by our packs. We thought it was rather funny until we realised getting out was not going to be easy. Peter had to work hard to get out the way we entered then find the 'right' bypass path to the other side to help pull Kay out with the aid of a trekking pole. Kay couldn't touch the bottom but luckily there was some underwater planty things near the edge she used to get some knee leverage. It was much worse than it looks. "
  ),
  data_frame(
    id = 18,
    event = "Lost! (nearly)",
    lat = -47.013,
    lng = 167.717,
    icon = "warning",
    image = "<img src = 'P1310057.JPG'>",
    description = "Somewhere near the top soon after this photo the visibility went very low and it starting raining. Just as we got near the top of Adam's Hill the path vanished into a general maze of bogs and low bushes. We took a guess on the direction but then discovered were definitely off track and were quickly feeling colder and wetter. We needed all of our tech resources to find the track again - map, compass, GPS, and a fair bit of back-tracking, but to our reliece we found it.  After that, there was a big downhill slog in exceptionally muddy tracks, with no photos due to grumpiness and general sense of 'hope this is over soon'."
  ),
  data_frame(
    id = 19,
    event = "We meet a kiwi",
    lat = -47.021,
    lng = 167.715,
    icon = "video-camera",
    image = '<iframe width="279" height="157" src="https://www.youtube.com/embed/iOxU1d3IbII?autoplay=1" frameborder="0" allowfullscreen></iframe>',
    description = "We were dog-tired, but things got better. We got down to about 150m above the beach and out of the worst of the mud, we suddenly came across our very first kiwi in the wild (so it is not a tourist con). It was still daylight (about 5pm) and the kiwi was completely unfraid and uninterested in us, despite us standing right next to it. Kiwis are typically nocturnal but the Stewart Island kiwis are unusual in being less strictly nocturnal."
    ),
  data_frame(
    id = 20,
    event = "Stream",
    lat = -47.030474,
    lng = 167.703588,
    icon = "warning",
    image = "<img src = 'P1310062.JPG'>",
    description = "The final obstacle of day 2 was a stream between us and the beach. We used it to clean ourselves off a bit. </p><p>We were knackered at this point. The track had been steep. It was dry and good in places, but then morphed into a steep muddy stream for long stretches which meant negotiating slippery tree roots, rocks and mud. Not fun when tired and hungry. We just wanted to get down asap without spraining an ankle so we had no inclination to take pictures."
  ),
  data_frame(
    id = 21,
    event = "Doughboy Bay Hut",
    lat = -47.0322,
    lng = 167.705,
    icon = "home",
    image = "<img src = 'doughboy-hut.JPG'>",
    description = "Our second night was in Doughboy Bay Hut overlooking a beautiful bay. We were hoping to have the 8 person hut to ourselves and possibly have a rest day and extra night there. But we dismissed that option when we found we were sharing the hut with 5 hunters who had just settled in for a 10 day stint. </p><p>They had flown in directly onto Doughboy Bay beach and, as hunters do, had spared nothing of their home comforts (mountains of food, whiskey, cake, board games, male messiness etc). We were surprised and pleased to find them rather considerate. Nevertheless, the hut was most definitely their space. </p><p>We watched them play hours of cribbage, drink lots of whisky, and talk about not having killed anything. One of them told us how he had seen three kiwis on a hill nearby and one of them had pecked his boot. Our kiwi experience no longer seemed so special.They also gave us helpful advice about how to avoid the unmarked beach quicksand on the track the next day. Again, we forgot to take a photo, so this is someone else's."
  ),
  data_frame(
    id = 22,
    event = "Doughboy Hill",
    lat = -47.021,
    lng = 167.733067,
    icon = "camera",
    image = "<img src = 'P2010066.JPG'><img src = 'P2010071.JPG'>",
    description = "This was us at the top of Doughboy Hill the next day. It had been a long hard slog up (~400 metres vertical) through steep mud like the day before (again no inclination to take pictures). It was great to get to the top to rest the thighs but we'd learnt by now that the plateau would also be slow going. </p><p>Because of the deep mud and bog/marsh through most of the track we couldn't walk straight through which meant we were doing lots of micro-navigating and track by-passing through the low scrub. Obviously the track itself had become the main problem. Rather than making it easier to walk it was definitely making it harder (this is when a track loses its raison d'etre IMHO)."
  ),
  
  data_frame(
    id = 23,
    event = "Outward bound",
    lat = -46.991,
    lng = 167.833,
    icon = "camera",
    image = "<img src = 'P2010074.JPG'>",
    description = "Yay. Past the magical 200m point we began gradually wandering down towards the river. Nice and relatively dry (at this point) and very pretty."
  ),
  
  data_frame(
    id = 24,
    event = "Bogs nearer Rakeahua Hut",
    lat = -46.982330,
    lng = 167.854731,
    icon = "warning",
    image = "<img src = 'P2010083.JPG'><img src = 'P2010084.JPG'>",
    description = "It got seriously boggy and muddy in the final few kilometres before the last hut (and our pickup point). Again, lots of exhausting micro-navigating the bogs. </p><p>We got much better at judging what could be walked through and what could not. But we didn't always get it right. At one point Peter misjudged the mud while trying to skirt the edges and ended up stuck up to his thigh in thick mud. Needed the aid of a trekking pole to lever his way out - he says it was as hard as doing a chin up. His main worry was that he would lose a boot in the process.  I tried to take a picture but unfortunately it didn't work. "
  ),
  
  data_frame(
    id = 25,
    event = "Rakeahua Hut - what a relief",
    lat = -46.982096,
    lng = 167.880872,
    icon = "home",
    image = "<img src = 'P2010088.JPG'><img src = 'P2020089.JPG'>",
    description = "We spent an evening and a whole leisurely sunny day in the lovely Rakeahua Hut with the place all to ourselves. Plenty of time to read, eat all our spare food and walk stiffly around. Kay picked up a great novel from the hut (it is rare to find anything worth reading in huts) which she was enjoying so much she took it back to Oban to finish. </p><p>By late afternoon we were joined by 4 seasoned trampers who had just done the whole 10 day Northern Circuit tramp - joining up with our Southern Circuit. They told us the route we had just done was harder than most of the NC. They sold us on doing the NC so, despite the mud, we plan to come back."
  ),
  data_frame(
    id = 26,
    event = "Pick-up",
    lat = -46.98351,
    lng = 167.885,
    icon = "taxi",
    image = "<img src = 'P2020098.JPG'>",
    description = "Lovely spot for a pickup."
  ),
  data_frame(
    id = 27,
    event = "Jumping fish",
    lat = -46.932740,
    lng = 168.036168,
    icon = "camera",
    image = "<img src = 'fish.JPG'>",
    description = "On the way back we caught an amazing feeding frenzy.  A big school of small fish had been herded together into a boil by predator barracuda. The poor fish were jumping out of the water to get away from the barracuda, seabirds, blue penguins and dolphins who were all having a field day.  We didn't get any footage (camera stowed in pack) so here are some generic jumping fish chased by barracuda."
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
