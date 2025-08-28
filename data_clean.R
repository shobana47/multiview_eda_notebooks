set.seed(123)

# Generate a synthetic time series data
date_sequence <- seq(as.Date("2022-01-01"), by = "days", length.out = 365)
time_series_data <- data.frame(
  Date = date_sequence,
  Value = cumsum(rnorm(365))
)

# Plot the time series
plot(time_series_data$Date, time_series_data$Value, type = "l", xlab = "Date", ylab = "Value",
     main = "Synthetic Time Series")

# Decompose the time series into trend, seasonality, and remainder components
decomposition <- decompose(ts(time_series_data$Value, frequency = 365))

# Plot the decomposed components
par(mfrow = c(3, 1))
plot(decomposition$seasonal, main = "Seasonal Component")
plot(decomposition$trend, main = "Trend Component")
plot(decomposition$random, main = "Residual Component")

# Autocorrelation plot
acf(time_series_data$Value, main = "Autocorrelation Plot")

# Partial autocorrelation plot
pacf(time_series_data$Value, main = "Partial Autocorrelation Plot")

exists("time_series_data")  # Should return TRUE
