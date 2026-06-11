library(forecast)
library(urca)

# 1. Isolate Tokyo Central and convert it into a formal R Time-Series (ts) Object
tokyo_bloom <- df_bloom %>% 
  filter(Station_ID == "626") %>% 
  arrange(Year)

# Convert the sequential Julian Days into a continuous time-series starting in 1953
tokyo_ts <- ts(tokyo_bloom[["Bloom_DOY"]], start = 1953, frequency = 1)

# 2. Advanced Stats Check: Execute the Augmented Dickey-Fuller (ADF) Unit Root Test
# We include a deterministic trend line since we know bloom dates are dropping over time
adf_test <- ur.df(tokyo_ts, type = "trend", lags = 1)
test_summary <- summary(adf_test)

# 3. Print out the critical values and our test statistic
cat("=========================================================\n")
cat("ADVANCED TIME-SERIES DIAGNOSTIC: TOKYO CENTRAL STATION\n")
cat("=========================================================\n")
cat("ADF Test Statistic for Unit Root:", round(test_summary@teststat[1], 4), "\n")
cat("Critical Value Threshold (5% Significance Level):", test_summary@cval[1, "5pct"], "\n\n")
