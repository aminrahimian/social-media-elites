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


for (i in 1:10){
  setwd("C:/Users/Lenovo/Documents/GitHub/Misinformation/polarization")
  dir_name <- paste("../elites/data",i, sep = "_")
  dir_name <- paste(dir_name, "/data/opinions.csv", sep = "")
  setwd(dir_name)
  data <- read.csv("opinions.csv")
  data <- data[2:ncol(data)]
  
  
  polar <- polarization(data = data)
  write.csv(polar, file = "polar.csv")
  
  
  plot(polar, xlab = "times", ylab = "Polarization", main = "Elites", 
       col = "blue", type = "l", log = "x")
  
  ii <- paste0("polar", i)
  assign(ii, polar)
  
  
}


library(dplyr)
polar_df <- as.data.frame(polar1)
polar_df <- polar_df %>%
  rename(polar1_elites = polar1) %>%
  mutate(times = as.numeric(row.names(polar_df))) %>%
  mutate(polar2_elites = polar2) %>%
  mutate(polar3_elites = polar3) %>%
  mutate(polar4_elites = polar4) %>%
  mutate(polar5_elites = polar5) %>%
  mutate(polar6_elites = polar6) %>%
  mutate(polar7_elites = polar7) %>%
  mutate(polar8_elites = polar8) %>%
  mutate(polar9_elites = polar9) %>%
  mutate(polar10_elites = polar10)
# For reproducible

write.csv(polar_df, file = "polar_df.csv")
library(ggplot2)
ggplot(data = polar_df) +
  geom_line(mapping = aes(x = times, y = polar1_elites), col = "blue") +
  geom_line(mapping = aes(x = times, y = polar2_elites), col = "blue") +
  geom_line(mapping = aes(x = times, y = polar3_elites), col = "blue") +
  geom_line(mapping = aes(x = times, y = polar4_elites), col = "blue") +
  geom_line(mapping = aes(x = times, y = polar5_elites), col = "blue") +
  geom_line(mapping = aes(x = times, y = polar6_elites), col = "blue") +
  geom_line(mapping = aes(x = times, y = polar7_elites), col = "blue") +
  geom_line(mapping = aes(x = times, y = polar8_elites), col = "blue") +
  geom_line(mapping = aes(x = times, y = polar9_elites), col = "blue") +
  geom_line(mapping = aes(x = times, y = polar10_elites), col = "blue") +
  xlab("times") +
  ylab("Polarization") +
  ggtitle("Elites") +
  scale_x_log10()
