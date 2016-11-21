library(tidyr)
library(dplyr)
library(ggplot2)
library(stringr)
library(tidytext)
#read in acceptance speach raw, sep is line break, remove quoting, strings are not factors
speech <- read.table("/Users/Josiah/Dropbox/general_R/Data/trump_acceptance.txt", sep = "\n", stringsAsFactors = F, quote = "", col.names = c("text"))

# add line number, author, speech name, and the date of the speech (just for future reference)
speech <- speech %>% mutate(line = row_number(), author = "Donald Trump", speech = "2016 Acceptance Speech", date = as.POSIXct("2016-11-09"))

# load tidy text
library(tidytext)
data("stop_words")

#change tokens
speech <- speech %>% unnest_tokens(word, text)

# remove stop words
speech <- speech %>% anti_join(stop_words)
 
word_count <- speech %>% count(word, sort = T)

library(ggplot2)
speech %>% count(word, sort = T) %>% 
  mutate(word = reorder(word, n))%>% 
  filter(n > 5) %>%
  ggplot(aes(word, n)) +
  geom_bar(stat = "identity") + xlab(NULL) + coord_flip() + theme_light()

### SENTIMENT ANALYSIS OF TRUMP ACCEPTANCE SPEECH
afinn <- get_sentiments("afinn")
# Bing can measure overall positive / negative sentiment over time
bing <- get_sentiments("bing")
# NRC is used to find feelings such as "disgust" "trust" "anger" etc.
# Can search for just one sentiment.
nrc <- get_sentiments("nrc")

#Note: Sentiments are only used on unigrams (single words). Qualifiers such as "no luck" etc. are not measured

# EMOTION
# Emotion - connotations, // ANGER
gg_anger <- speech %>%
  semi_join(nrc %>% filter(sentiment == "anger" )) %>%
  count(word, sort = TRUE) %>% 
  mutate(word = reorder(word, n)) %>% #organize for display
  ggplot(aes(word, n)) + geom_bar(stat = "identity") + coord_flip()

# TRUST
gg_trust <- speech %>%
  semi_join(nrc %>% filter(sentiment == "trust" )) %>%
  count(word, sort = TRUE) %>% 
  mutate(word = reorder(word, n)) %>% #organize for display
  ggplot(aes(word, n)) + geom_bar(stat = "identity", fill = "#8FC7CC") + coord_flip() + theme_bw() + ggtitle("Testing things out") + my_theme
  
## SENTIMENT 
## Measure sentiment overtime (Positive / Negative) using BING
speech_bing_sent <- inner_join(speech, bing, by = "word") %>% 
  count(word, index = line, sentiment) %>% 
  spread(sentiment, n, fill = 0) %>% 
  mutate(sentiment = positive - negative) %>% arrange(index)

# Plot of sentiment over time
speech_sentiment %>% ggplot(aes(index, sentiment)) + geom_bar(stat = "identity") 

# Sentiment contribution by word 
speech_bing_count <- inner_join(speech, bing, by = "word") %>% 
    count(word, sentiment, sort = T) %>% ungroup()

trump <- speech_bing_count %>% filter(n >= 2) %>% 
  mutate(n = ifelse(sentiment == "negative", -n, n)) %>%
  mutate(word = reorder(word, n)) %>% 
  ggplot(aes(word, n, fill = sentiment)) + 
        geom_bar(stat = "identity", width = .95) + 
        josi_theme() + 
        scale_fill_manual(values = c("#ff879e", "#87bdff"),
                          name = "Sentiment",
                          labels = c("Negative", "Positive")) +
        coord_flip() + 
  labs(title = "Donald Trump's Acceptance Speech", 
       subtitle = "(Sentiment Contribution By Word)",
       x = "Word", y = "Sentiment Contribution") 

ggsave("/Users/Josiah/Dropbox/general_R/trump_vs_clinton/trump.png", width = 6, height = 9)
