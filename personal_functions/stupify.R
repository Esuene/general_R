stupify <- function(df, factor = "variable_name") {
  # remove white space if it exists
  df[ , factor] <- as.factor(str_replace_all(df[, factor], "[[:space:]]", "_"))
  
  #create vectors to be filled
  for(i in 1:length(df[,factor])) {
    y <- data.frame(cbind(rep(NA, nrow(df))))
  }
  
  # cycle through and dummy code
  for(i in 1:length(levels(df[, factor]))) {
  y[,i] <- rep(NA, nrow(df))
  index <- which(df[, factor] == levels(df[, factor])[i])
  y[,i][index] <- 1
  y[,i][-index] <- 0
  }
  #rename columns based on values
  colnames(y) <- c(str_c(factor, levels(df[, factor]), sep = "."))
  df <- cbind(df, y)
}

