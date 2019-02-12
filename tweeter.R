library("rtweet")
library("tidyverse")
library("visNetwork")
library("future")


cnn_fds <- get_followers("martinjhnhadley", n = 3)

## lookup data on those accounts
cnn_fds_data <- lookup_users(cnn_fds$user_id)

get_tweeter_ids <- function(user_id){
  
  followers_data <- get_followers(user_id)
  
  followers_data$user_id %>%
    lookup_users() %>%
    select(user_id) %>%
    .[[1]]
  
}

new_followers_network <- cnn_fds_data %>%
  select(user_id, screen_name) %>%
  mutate(follows = map(user_id, function(x){get_tweeter_ids(x)}))

edges <- new_followers_network %>%
  select(user_id, follows) %>%
  unnest()
colnames(edges) <- c("from", "to")

unique_ids <- unique(c(edges$from, edges$to))

nodes <- lookup_users(unique_ids)

nodes <- nodes %>%
  mutate(id = user_id,
         label = screen_name,
         title = screen_name) %>%
  select(id, everything())

visNetwork(nodes, edges) %>%
  visIgraphLayout
