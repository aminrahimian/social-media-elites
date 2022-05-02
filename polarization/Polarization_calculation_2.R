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
  dir_name <- paste("../stochastic/data",i, sep = "_")
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



polar_df <- polar_df %>%
  mutate(polar1_sto = polar1) %>%
  mutate(polar2_sto = polar2) %>%
  mutate(polar3_sto = polar3) %>%
  mutate(polar4_sto = polar4) %>%
  mutate(polar5_sto = polar5) %>%
  mutate(polar6_sto = polar6) %>%
  mutate(polar7_sto = polar7) %>%
  mutate(polar8_sto = polar8) %>%
  mutate(polar9_sto = polar9) %>%
  mutate(polar10_sto = polar10)

setwd("C:/Users/Lenovo/Documents/GitHub/Misinformation/polarization")
write.csv(polar_df, file = "polar_df.csv")

library(ggplot2)
colors <- c("Elites" = "blue", "SBM" = "red")
ggplot(data = polar_df) +
  geom_line(mapping = aes(x = times, y = polar1_elites, color = "Elites")) +
  geom_line(mapping = aes(x = times, y = polar2_elites, color = "Elites")) +
  geom_line(mapping = aes(x = times, y = polar3_elites, color = "Elites")) +
  geom_line(mapping = aes(x = times, y = polar4_elites, color = "Elites")) +
  geom_line(mapping = aes(x = times, y = polar5_elites, color = "Elites")) +
  geom_line(mapping = aes(x = times, y = polar6_elites, color = "Elites")) +
  geom_line(mapping = aes(x = times, y = polar7_elites, color = "Elites")) +
  geom_line(mapping = aes(x = times, y = polar8_elites, color = "Elites")) +
  geom_line(mapping = aes(x = times, y = polar9_elites, color = "Elites")) +
  geom_line(mapping = aes(x = times, y = polar10_elites, color = "Elites")) +
  geom_line(mapping = aes(x = times, y = polar1_sto, color = "SBM")) +
  geom_line(mapping = aes(x = times, y = polar2_sto, color = "SBM")) +
  geom_line(mapping = aes(x = times, y = polar3_sto, color = "SBM")) +
  geom_line(mapping = aes(x = times, y = polar4_sto, color = "SBM")) +
  geom_line(mapping = aes(x = times, y = polar5_sto, color = "SBM")) +
  geom_line(mapping = aes(x = times, y = polar6_sto, color = "SBM")) +
  geom_line(mapping = aes(x = times, y = polar7_sto, color = "SBM")) +
  geom_line(mapping = aes(x = times, y = polar8_sto, color = "SBM")) +
  geom_line(mapping = aes(x = times, y = polar9_sto, color = "SBM")) +
  geom_line(mapping = aes(x = times, y = polar10_sto, color = "SBM")) +
  labs(
    x = "times",
    y = "Polarization",
    color = "Models"
  ) +
  ggtitle("Elites and SBM") +
  scale_x_log10() +
  scale_color_manual(values = colors)
