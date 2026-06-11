# 1. Automatically identify the optimal ARIMA parameters
optimal_arima <- auto.arima(tokyo_ts, seasonal = FALSE, stepwise = FALSE, approximation = FALSE)

# 2. Project out-of-sample peak bloom dates 10 years into the future (2027 to 2036)
tokyo_forecast <- forecast(optimal_arima, h = 10)

# 3. Print out the mathematical configuration discovered by R
cat("=========================================================\n")
cat("STOCHASTIC ARIMA CHRONOLOGY PROFILE: TOKYO CENTRAL\n")
cat("=========================================================\n")
print(optimal_arima)
cat("\n=========================================================\n")
cat("10-YEAR PEAK BLOOM DATE PREDICTIONS (JULIAN DAY OF YEAR)\n")
cat("=========================================================\n")
print(tokyo_forecast$mean)
