dir_name <- "../stochastic/data_1/data/opinions.csv"
setwd(dir_name)
data <- read.csv("opinions.csv")
data <- data[2:ncol(data)]
polarization <- function(data){
  times <- nrow(data)
  polar <- rep(NA, times)
  z_mean <- rowMeans(data)
  for (i in 1:times){
    z <- data[i, 1:ncol(data)]
    z_mean_i <- z_mean[i]
    z_bar <- z - z_mean_i
    z_bar <- as.numeric(z_bar)
    # skewness
    skewness <- mean(z_bar^3) / ((mean(z_bar^2))^1.5)
    # kurtosis
    kurtosis <- mean(z_bar^4) / ((mean(z_bar^2))^2)
    polar[i] <- (skewness^2 + 1) / kurtosis
  }
  return(polar)
}

polar <- polarization(data = data)
write.csv(polar, file = "polar.csv")

plot(polar, xlab = "times", ylab = "Polarization", main = "SBM", 
     col = "blue", type = "l", log = "x")

             