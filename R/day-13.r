#Wesley Noble
#08-25-2020
#Daily Exercise 13

library(tidyverse)
library(sf)
library(rmapshaper)


us_states = USAboundaries::us_states() %>%
  filter(!stusps %in% c("PR", "HI", "AK")) %>%
  st_union() %>%
  st_transform(5070)

#Number of points in us_states raw data

mapview::npts(us_states)

us_st90000  = st_simplify(us_states, dTolerance = 90000)

plot(us_st90000)

mapview::npts(us_st90000)

us_ms1  = ms_simplify(us_states, keep = .01)

plot(us_ms1)

mapview::npts(us_ms1)
