library(sf)
library(ggplot2)

nc <- st_read(
  system.file("shape/nc.shp", package = "sf"),
  quiet = TRUE
)

print(st_crs(nc))

example_map <- ggplot(nc) +
  geom_sf(aes(fill = SID74), colour = "white", linewidth = 0.2) +
  scale_fill_viridis_c(name = "SIDS count") +
  labs(
    title = "North Carolina SIDS counts",
    subtitle = "Areal data: counts aggregated by county",
    caption = "Source: sf::nc | Original CRS: NAD27 (EPSG:4267)"
  ) +
  theme_minimal()

print(example_map)
