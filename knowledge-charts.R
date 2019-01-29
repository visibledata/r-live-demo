library("tidyverse")

source("audience-knowledge.R", local = TRUE)

audience_knowledge

gg_bar <- audience_knowledge %>%
  ggplot(aes(x = question,
             y = response,
             fill = knowledge.type)) +
  geom_col() + 
  coord_flip()

library("plotly")

gg_bar %>%
  ggplotly()


# treemap
# 


