library(sf)
library(ggplot2)

pathshp <- system.file("shape/nc.shp", package = "sf")
nc <- st_read(pathshp, quiet = TRUE)

head(nc)
st_crs(nc)

ggplot(nc) +
  geom_sf(aes(fill = SID74))
