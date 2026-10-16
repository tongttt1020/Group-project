library(sf)
library(spData)
library(ggplot2)

nc <- st_read(
  system.file("shape/nc.shp", package = "sf"),
  quiet = TRUE
)

data("properties", package = "spData")

st_crs(nc)
st_crs(properties)

png("north_carolina_map.png")
ggplot(nc) + geom_sf(aes(fill = SID74))
dev.off()

png("athens_map.png")
ggplot(properties) + geom_sf(aes(colour = prpsqm))
dev.off()