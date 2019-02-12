library("tidyverse")

source("audience-knowledge.R", local = TRUE)

gg_plot <- audience_knowledge %>%
  ggplot(aes(x = question,
             y = response)) +
  geom_col() +
  coord_flip()

library("plotly")

gg_plot %>%
  ggplotly()


library("highcharter")

audience_knowledge %>%
  hchart(
    type = "bar",
    hcaes(
      x = question,
      y = response,
      group = knowledge.type
    )
  )
