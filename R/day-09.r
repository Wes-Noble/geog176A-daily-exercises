#Wesley Noble
#08-18-2020
#Daily Exercise 9

library(tidyverse)
library(sf)
library(units)

states = USAboundaries::us_states()

states %>%
  filter(!stusps %in% c("AK", "PR", "HI")) ->
  CONUS

plot(CONUS)

US_c_ml = st_combine(CONUS) %>%
  st_cast("MULTILINESTRING")

plot(US_c_ml)

US_u_ml = st_union(CONUS) %>%
  st_cast("MULTILINESTRING")

plot(US_u_ml)
