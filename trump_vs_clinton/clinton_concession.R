library(dplyr)
library(ggplot2)
library(stringr)
library(tidytext)
#read in acceptance speach raw, sep is line break, remove quoting, strings are not factors
speech_hrc <- read.table("/Users/Josiah/Dropbox/general_R/Data/clinton_concession.txt", sep = "\n", stringsAsFactors = F, quote = "", col.names = c("text"))

# add line number, author, speech name, and the date of the speech (just for future reference)
speech_hrc <- speech_hrc %>% mutate(line = row_number(), author = "Hillary Clinton", speech = "2016 Presidential Election Concession Speech", date = as.POSIXct("2016-11-10"))

# Load stop words
data("stop_words")

# Convert sentences to words
speech_hrc <- speech_hrc %>% unnest_tokens(word, text)

# Remove stop words
speech_hrc <- speech_hrc %>% anti_join(stop_words)

# word count
word_count <- speech_hrc %>% count(word, sort = T)


### SENTIMENT ANALYSIS OF CLINTON CONCESSION SPEECH
afinn <- get_sentiments("afinn")

# Bing can measure overall positive / negative sentiment over time
bing <- get_sentiments("bing")

# NRC is used to find feelings such as "disgust" "trust" "anger" etc.
# Can search for just one sentiment.
nrc <- get_sentiments("nrc")

# Sentiment contribution by word for HRC
speech_bing_count_hrc <- inner_join(speech_hrc, bing, by = "word") %>%
  count(word, sentiment, sort = T) %>% ungroup()

clinton <- speech_bing_count_hrc %>%
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
                    x = "Word", y = "Sentiment Contribution") 

ggsave("/Users/Josiah/Dropbox/general_R/trump_vs_clinton/clinton.png", width = 6, height = 9)

both <- cowplot::plot_grid(clinton_2, trump)
ggsave("/Users/Josiah/Dropbox/general_R/trump_vs_clinton/both.png", width = 12, height = 9)
