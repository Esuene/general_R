factorize <- function (df, to_factor, col_name = "NULL") {
  df[ , col_name] <- rep(NA, nrow(df))
  for(i in 1:length(to_factor)) {
    index <- which(df[ , to_factor[i]] == 1)
    df[ , col_name][index] <- to_factor[i]
  }
  df <- df
}
