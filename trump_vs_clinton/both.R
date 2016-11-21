clinton_2 <- speech_bing_count_hrc %>%
  mutate(n = ifelse(sentiment == "negative", -n, n)) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n, fill = sentiment)) +
  geom_bar(stat = "identity", width = .95) +
  josi_theme() +
  scale_fill_manual(values = c("#ff879e", "#87bdff"),
                    name = "Sentiment",
                    labels = c("Negative", "Positive")) +
  coord_flip() + 
  labs(title = "Hillary R. Clinton's Concession Speech", 
       subtitle = "(Sentiment Contribution By Word)",
       x = "Word", y = "Sentiment Contribution") + guides(fill = F)


both <- plot_grid(clinton_2, trump)

