library(sf)
library(ggplot2)

path <- system.file("shape/nc.shp", package = "sf")
nc <- st_read(path, quiet = TRUE)

head(nc)
st_crs(nc)

ggplot(nc) +
  geom_sf(aes(fill = SID74)) +
  labs(
    title = "SIDS counts in North Carolina",
    fill = "SIDS count"
  )