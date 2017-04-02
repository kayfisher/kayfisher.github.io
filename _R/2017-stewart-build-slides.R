library(rmarkdown)

setwd(paste0(projdir, "/trips/2017-stewart"))
render("slides.Rmd")
setwd(projdir)
