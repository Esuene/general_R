#read in acceptance speach raw, sep is line break, remove quoting, strings are not factors
speech <- read.table("/Users/Josiah/Dropbox/GitHub/Data/trump_acceptance.txt", sep = "\n", stringsAsFactors = F, quote = "", col.names = c("text"))

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