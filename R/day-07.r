#Wesley Noble
#08-12-2020
#Daily Exercise 7

library(tidyverse)

url = 'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv'

covid = read_csv(url)


#Question 1

region = data.frame(state = state.name, region = state.region)

covid_region = inner_join(covid, region, by = "state")

covid_region %>%
  select(state, cases, deaths, region, date) %>%
  group_by(region, date) %>%
  summarise(cases = sum(cases, na.rm = TRUE), deaths = sum(deaths, na.rm = TRUE)) %>%
  ungroup() %>%
  pivot_longer(c("cases", "deaths")) %>%
  ggplot(aes( x = date, y = value)) +
  geom_line(aes(color = region)) +
  labs(title = "Cummulative COVID Cases by Region",caption = "Daily Exercise 07",
       x = "Date",
       y = "Cases") +
  facet_grid(name~region, scales = "free_y") +
  theme_update() +
  theme(legend.position = "none") +
  ggsave(file = "/users/noblex/github/geog176A-daily-exercises/imgs/exercise7-q1.png")



