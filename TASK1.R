library(sf)
library(spData)
library(spdep)

map <- st_read(
  system.file("shapes/columbus.gpkg", package = "spData"),
  quiet = TRUE
)

queen <- poly2nb(map, queen = TRUE)
rook <- poly2nb(map, queen = FALSE)

summary(queen)
summary(rook)

queen_weights <- nb2listw(queen, style = "W")
rook_weights <- nb2listw(rook, style = "W")

moran.test(map$INC, queen_weights, alternative = "greater")
moran.test(map$INC, rook_weights, alternative = "greater")

plot(st_geometry(map), border = "lightgray", main = "Queen")
plot(queen, st_geometry(map), add = TRUE)

plot(st_geometry(map), border = "lightgray", main = "Rook")
plot(rook, st_geometry(map), add = TRUE)