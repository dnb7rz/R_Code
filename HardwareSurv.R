library(tidyverse)
library(ggplot2)
library(lubridate)

hrdwr = as.data.frame(read.csv('C:\\Users\\ntfou\\OneDrive\\Documentos\\R_Code\\R_Code\\HardwareData.csv'))
head(hrdwr)
#names(hrdwr)
summary(hrdwr)

##Leaving out ids

hrdwr$Timestamp = as.POSIXct(hrdwr$Timestamp, format="%m/%d/%Y %H:%M", tz="UTC")

hrdwr$Year = as.integer(NA)

hrdwr = hrdwr %>%
  mutate(Year = year(Timestamp))

#removed 1970 outlier
tempYr = hrdwr %>%
  filter(Year > 2019)

ggplot(tempYr , aes(Year)) +
  geom_bar(alpha=.5, fill="red") +
  geom_text(aes(label = after_stat(count)), stat = "count", vjust = 2, colour = "white") 





####
unique(hrdwr$OpSys)

hrdwr$OpSys = str_wrap(hrdwr$OpSys, width = 10)

ggplot(hrdwr, aes(OpSys)) +
  geom_bar(alpha=.5, fill="green")


#####

summary(hrdwr$CPU_ghz)
unique(hrdwr$CPU_ghz)

ggplot(hrdwr, aes(x=CPU_ghz)) +
  geom_histogram(binwidth=.2, alpha=.5, fill="red") +
  coord_cartesian(xlim = c(1, 5))

####
summary(hrdwr$CPU_Cores)
unique(hrdwr$CPU_Cores)

ggplot(hrdwr, aes(x=CPU_Cores)) +
  geom_bar(alpha=.5, fill="blue") 

####

summary(hrdwr$RAM_gb)
unique(hrdwr$RAM_gb)

ggplot(hrdwr, aes(x=RAM_gb)) +
  geom_bar(alpha=.5, fill="black") 

#####

summary(hrdwr$HrdDrv_gb)
unique(hrdwr$HrdDrv_gb)

ggplot(hrdwr, aes(x=HrdDrv_gb)) +
  geom_histogram(binwidth=1, alpha=.5, fill="orange") +
  coord_cartesian(xlim = c(200, 600), ylim = c(0,60)) 

####

unique(hrdwr$GPU_Desc)

#clean up desc so that I can bin it...
hrdwr$GPUSumDesc = as.character(NA)

hrdwr$GPUSumDesc[grepl('nvidia|NVIDIA|Nvidia', hrdwr$GPU_Desc)] = 'NVIDIA'
hrdwr$GPUSumDesc[grepl('apple|Apple|APPLE', hrdwr$GPU_Desc)] = 'Apple'
hrdwr$GPUSumDesc[grepl('rtx|RTX', hrdwr$GPU_Desc)] = 'RTX'
hrdwr$GPUSumDesc[grepl('intel|Intel|INTEL', hrdwr$GPU_Desc)] = 'Intel'
hrdwr$GPUSumDesc[grepl('radeon|Radeon|RADEON', hrdwr$GPU_Desc)] = 'Radeon'

hrdwr = hrdwr %>%
  mutate(GPUSumDesc = ifelse(is.na(GPUSumDesc), 'Other', GPUSumDesc))

ggplot(hrdwr, aes(x=GPUSumDesc)) +
  geom_bar(alpha=.5, fill="brown") 


####
unique(hrdwr$GPUCudaCores)

#remove NAs
tempdf = hrdwr %>%
  filter(!is.na(GPUCudaCores))

summary(tempdf$GPUCudaCores)

ggplot(tempdf, aes(x=GPUCudaCores, rm.na = T)) +
  geom_histogram(binwidth=10, alpha=.5, fill = 'purple') +
  coord_cartesian(xlim = c(0, 500))
