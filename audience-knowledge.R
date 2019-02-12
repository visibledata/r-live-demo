library("tidyverse")

basic_questions <- read_csv("data/basic-questions.csv")

audience_size <- basic_questions %>%
  filter(short.name == "audience.size") %>%
  select(response) %>%
  as.integer()

audience_knowledge <- basic_questions %>%
  filter(type %in% c("size", "neg size")) %>%
  mutate(response = as.integer(response)) %>%
  mutate(response = if_else(type == "neg size",
                            audience_size - response,
                            response),
         question = if_else(type == "neg size",
                            str_replace(question, "never ", ""),
                            question)) %>%
  select(short.name, question, knowledge.type, response)


