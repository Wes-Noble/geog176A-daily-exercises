#Wesley Noble
#08-13-2020
#Daily Exercise 8

library(zoo)

state.of.interest = "Maine"

covid %>%
  filter(state == state.of.interest) %>%
  group_by(date) %>%
  summarise(cases = sum(cases, na.rm = TRUE)) %>%
  mutate(newcases = cases - lag(cases), roll7 = rollmean(newcases, 7, fill = NA, allign = "right")) %>%
  ggplot(aes(x = date)) +
  geom_col(aes(y = newcases), col = NA, fill = "tomato1") +
  geom_line(aes(y = roll7), col = "violetred4", size = 1) +
  theme_update() +
  labs(title = paste("New Reported cases by day in", state.of.interest), caption = "Daily Exercise 08", x = "Date",
       y = "New Cases") +
  theme(plot.background = element_rect(fill = "tan"),
        panel.background = element_rect(fill = "snow3"),
        plot.title = element_text(size = 14, face = 'bold')) +
  ggsave(file = "/users/noblex/github/geog176A-daily-exercises/imgs/Noble_exercise8-q1.png")
