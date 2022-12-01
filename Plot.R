library(dplyr)
library(ggplot2)
library(reshape2)
setwd("C:/Users/Lenovo/Documents/GitHub/Misinformation/polarization/polar")


polar_df <- read.csv("polar_elites1.csv",
                     col.names = c("time", "polar_elites1"))

for (i in 2:100){
  dir_name <- paste("polar_elites",i, sep = "")
  dir_name <- paste(dir_name, ".csv", sep = "")
  
  col_name <- paste("polar_elites", i, sep = "")
  data <- read.csv(dir_name,
                   col.names = c("time", col_name))
  data <- data[2]
  

  
  polar_df <- polar_df %>% 
    mutate(data)

}
  
for (i in 1:100){
  dir_name <- paste("polar_elites_half",i, sep = "")
  dir_name <- paste(dir_name, ".csv", sep = "")
  
  col_name <- paste("polar_elites_half", i, sep = "")
  data <- read.csv(dir_name,
                   col.names = c("time", col_name))
  data <- data[2]
  
  
  
  polar_df <- polar_df %>% 
    mutate(data)
  
}

for (i in 1:100){
  dir_name <- paste("polar_SB",i, sep = "")
  dir_name <- paste(dir_name, ".csv", sep = "")
  
  col_name <- paste("polar_SB", i, sep = "")
  data <- read.csv(dir_name,
                   col.names = c("time", col_name))
  data <- data[2]
  
  
  
  polar_df <- polar_df %>% 
    mutate(data)
  
}


# For reproducible

write.csv(polar_df, file = "polar_df.csv")
polar_df = read.csv("polar_df.csv")
colors <- c("SEM(k = 1)" = "blue", "SBM" = "red")
SB_elites_plot <- ggplot(data = polar_df) +
  geom_line(mapping = aes(x = time, y = polar_elites1, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites2, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites3, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites4, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites5, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites6, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites7, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites8, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites9, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites10, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites11, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites12, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites13, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites14, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites15, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites16, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites17, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites18, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites19, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites20, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites21, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites22, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites23, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites24, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites25, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites26, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites27, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites28, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites29, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites30, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites31, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites32, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites33, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites34, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites35, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites36, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites37, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites38, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites39, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites40, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites41, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites42, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites43, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites44, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites45, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites46, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites47, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites48, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites49, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites50, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites51, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites52, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites53, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites54, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites55, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites56, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites57, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites58, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites59, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites60, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites61, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites62, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites63, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites64, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites65, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites66, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites67, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites68, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites69, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites70, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites71, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites72, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites73, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites74, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites75, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites76, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites77, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites78, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites79, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites80, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites81, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites82, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites83, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites84, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites85, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites86, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites87, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites88, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites89, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites90, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites91, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites92, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites93, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites94, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites95, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites96, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites97, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites98, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites99, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites100, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB1, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB2, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB3, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB4, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB5, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB6, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB7, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB8, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB9, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB10, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB11, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB12, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB13, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB14, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB15, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB16, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB17, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB18, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB19, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB20, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB21, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB22, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB23, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB24, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB25, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB26, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB27, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB28, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB29, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB30, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB31, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB32, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB33, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB34, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB35, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB36, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB37, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB38, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB39, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB40, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB41, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB42, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB43, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB44, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB45, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB46, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB47, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB48, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB49, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB50, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB51, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB52, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB53, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB54, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB55, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB56, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB57, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB58, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB59, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB60, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB61, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB62, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB63, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB64, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB65, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB66, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB67, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB68, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB69, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB70, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB71, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB72, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB73, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB74, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB75, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB76, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB77, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB78, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB79, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB80, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB81, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB82, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB83, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB84, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB85, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB86, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB87, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB88, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB89, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB90, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB91, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB92, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB93, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB94, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB95, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB96, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB97, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB98, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB99, color = "SBM"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_SB100, color = "SBM"), alpha = .25) +
  labs(
    x = "Time Step",
    y = "Polarization",
    color = "Models"
  ) +
  ggtitle("SEM (k = 1) and SBM") +
  scale_x_log10() +
  scale_color_manual(values = colors)

SB_elites_plot
#ggsave('../../figures/elites_SB.pdf',
#       width = 4.5, height = 3.5)



colors <- c("SEM(k = 1)" = "blue", "SEM(k = 0.5)" = "orange")
elites_half_plot <- ggplot(data = polar_df) +
  geom_line(mapping = aes(x = time, y = polar_elites1, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites2, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites3, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites4, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites5, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites6, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites7, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites8, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites9, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites10, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites11, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites12, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites13, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites14, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites15, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites16, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites17, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites18, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites19, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites20, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites21, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites22, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites23, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites24, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites25, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites26, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites27, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites28, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites29, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites30, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites31, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites32, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites33, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites34, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites35, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites36, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites37, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites38, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites39, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites40, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites41, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites42, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites43, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites44, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites45, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites46, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites47, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites48, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites49, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites50, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites51, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites52, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites53, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites54, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites55, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites56, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites57, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites58, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites59, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites60, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites61, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites62, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites63, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites64, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites65, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites66, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites67, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites68, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites69, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites70, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites71, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites72, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites73, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites74, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites75, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites76, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites77, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites78, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites79, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites80, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites81, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites82, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites83, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites84, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites85, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites86, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites87, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites88, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites89, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites90, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites91, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites92, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites93, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites94, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites95, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites96, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites97, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites98, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites99, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites100, color = "SEM(k = 1)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half1, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half2, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half3, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half4, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half5, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half6, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half7, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half8, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half9, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half10, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half11, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half12, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half13, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half14, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half15, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half16, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half17, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half18, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half19, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half20, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half21, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half22, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half23, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half24, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half25, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half26, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half27, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half28, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half29, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half30, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half31, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half32, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half33, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half34, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half35, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half36, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half37, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half38, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half39, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half40, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half41, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half42, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half43, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half44, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half45, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half46, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half47, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half48, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half49, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half50, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half51, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half52, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half53, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half54, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half55, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half56, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half57, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half58, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half59, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half60, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half61, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half62, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half63, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half64, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half65, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half66, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half67, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half68, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half69, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half70, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half71, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half72, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half73, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half74, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half75, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half76, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half77, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half78, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half79, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half80, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half81, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half82, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half83, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half84, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half85, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half86, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half87, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half88, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half89, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half90, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half91, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half92, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half93, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half94, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half95, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half96, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half97, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half98, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half99, color = "SEM(k = 0.5)"), alpha = .25) +
  geom_line(mapping = aes(x = time, y = polar_elites_half100, color = "SEM(k = 0.5)"), alpha = .25) +
  labs(
    x = "Time Step",
    y = "Polarization",
    color = "Models"
  ) +
  ggtitle("Influential Strength of SEM") +
  scale_x_log10() +
  scale_color_manual(values = colors)

elites_half_plot

data_ecdf <- polar_df %>%
  filter(time == 100000)
data_ecdf <- t(data_ecdf)
data_ecdf <- as.data.frame(data_ecdf[-1], col_name = polarization)
data_ecdf <- data_ecdf %>%
  rename(polarization = `data_ecdf[-1]`) %>%
  mutate(type = c(
    rep("SEM(k = 1)", 100), rep("SEM(k = 0.5)", 100), rep("SBM", 100)))

ecdf_plot = ggplot(
  aes(x = polarization,
      color = type,
      group = type
  ),
  data = data_ecdf
) +
  stat_ecdf(geom = "step", pad = FALSE, alpha = .75, lwd = .2) +
  scale_x_continuous(limits = c(0.0, 1.0)) +
  scale_color_discrete() +
  ylab("ECDF") +
  xlab("Polarization") +
  theme(legend.position = c(0.15, 0.75)) +
  ggtitle("ECDF at time step 100000")

ecdf_plot
ggsave('figures/expofive_modelone.pdf',
       width = 4.5, height = 3.5)
