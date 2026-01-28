#Load packages

packages <- c("IPDfromKM", "tidyverse", "png")

# Install and load packages 

for (pkg in packages) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg, dependencies = TRUE)
    library(pkg, character.only = TRUE)
  }
}

#Load images from Watanabe et al 2002
  ## Aid-required walking

img_TimeToAidWALK <- png::readPNG("Data/TimeToAidWalk.png")

##Follow steps in IPD KM packages

str(img_TimeToAidWALK)
plot.new()

## Position x1, x2, y1, y2
rasterImage(img_TimeToAidWALK, 0, 0, 1, 1)

## Define scale of x and y axis

df1 <- getpoints(img_TimeToAidWALK, 0, 16, 0, 1)

## Rename variables

df1 <- df1 %>% rename(time = x, probability = y)
df1 %>% plot(type = "s")

## Rename dataframe

TimeToAidWalk <- df1

## Save as csv file

write.csv(TimeToAidWalk, "Data/TimeToAidWalk.csv", row.names = FALSE)

    
    ## TimeToWheelChair

img_TimeToWheelchair <- png::readPNG("Data/TimeToWheelchair.png")

##Follow steps in IPD KM packages

str(img_TimeToWheelchair)
plot.new()

## Position x1, x2, y1, y2
rasterImage(img_TimeToWheelchair, 0, 0, 1, 1)

## Define scale of x and y axis

df2 <- getpoints(img_TimeToWheelchair, 0, 16, 0, 1)

## Rename variables

df2 <- df2 %>% rename(time = x, probability = y)
df2 %>% plot(type = "s")

## Rename dataframe

TimeToWheelchair <- df2

## Save as csv file

write.csv(TimeToWheelchair, "Data/TimeToWheelchair.csv", row.names = FALSE)

      
    ## TimeToBedridden

img_TimeToBedridden <- png::readPNG("Data/TimeToBedridden.png")

##Follow steps in IPD KM packages

str(img_TimeToBedridden)
plot.new()

## Position x1, x2, y1, y2
rasterImage(img_TimeToBedridden, 0, 0, 1, 1)

## Define scale of x and y axis

df3 <- getpoints(img_TimeToBedridden, 0, 16, 0, 1)

## Rename variables

df3 <- df3 %>% rename(time = x, probability = y)
df3 %>% plot(type = "s")

# Rename dataframe

TimeToBedridden <- df3

## Save as csv file

write.csv(TimeToBedridden, "Data/TimeToBedridden.csv", row.names = FALSE)

    

    ## TimeToDeath

img_TimeToDeath <- png::readPNG("Data/TimeToDeath.png")

##Follow steps in IPD KM packages

str(img_TimeToDeath)
plot.new()

## Position x1, x2, y1, y2
rasterImage(img_TimeToDeath, 0, 0, 1, 1)

## Define scale of x and y axis

df4 <- getpoints(img_TimeToDeath, 0, 18, 0, 1)

## Rename variables

df4 <- df4 %>% rename(time = x, probability = y)
df4 %>% plot(type = "s")

# Rename dataframe

TimeToDeath <- df4

## Save as csv file

write.csv(TimeToDeath, "Data/TimeToDeath.csv", row.names = FALSE)
