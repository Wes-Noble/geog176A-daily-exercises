#Wesley Noble
#08-11-2020
#Daily exercise 6

library(tidyverse)

url = 'https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv'

covid = read_csv(url)

#Question 1

covid %>%
  filter(date == max(date)) %>%
  group_by(state) %>%
  summarize(cases = sum(cases, na.rm = TRUE)) %>%
  ungroup() %>%
  slice_max(cases, n = 6) %>%
  pull(state)

library(ggthemes)

covid %>%
  filter(state %in% c("California", "Florida", "Texas", "New York", "Georgia", "Illinois")) %>%
  ggplot(aes(x = date, y = cases)) +
  geom_line(aes(color = state)) +
  labs(title = "Top States Cummulatice COVID-19 Count",
       caption = "Daily Exercise 06",
       x = "Date",
       y = "Cases") +
  facet_wrap(~state) +
  ggthemes::theme_economist() +
  ggsave(file = "/users/noblex/github/geog176A-daily-exercises/imgs/exercise6-q1.png")

#Question 2

covid %>%
  group_by(date) %>%
  summarize(cases = sum(cases, na.rm = TRUE)) %>%
  arrange(-cases)

covid %>%
  ggplot(aes(x = date, y = cases)) +
  geom_col() +
  labs(title = "Daily Total COVID Cases: USA",
       caption = "Daily Exercise 06",
       x = "Date",
       y = "Cases") +
  ggthemes::theme_economist() +
  ggsave(file = "/users/noblex/github/geog176A-daily-exercises/imgs/exercise6-q2.png")

