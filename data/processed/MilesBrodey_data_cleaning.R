################################################################
# Script Name: HW #2 - Electricity Prices Cleaned Data (California)
# Author: Miles Brodey
# GitHub:
# Date Created: 9/18/25
#
# Purpose: 
#


################################################################
# Load necessary libraries/source any function directories
#Import data from API
install.packages("readr")
library (ggplot2)
library(dplyr)
library(here)
library(readr)
library(eia)
eia_dir()
eia_dir("electricity")
(DATA <- eia_data(
  dir = "electricity/retail-sales",
  data = "price",
  facets = list(sectorid = c("COM", "RES"), stateid = "CA"),
  freq = "monthly",
  start = "2001",
  sort = list(cols = "period", order = "asc")
))
View(DATA)

################################################################
#Save DATA locally

write_csv(DATA, here("data", "raw", "CA_retail_price.csv"))
DATA <- read.csv(here::here("data","raw","CA_retail_price.csv"))
head(DATA)
str(DATA)

################################################################
# Change period to date and removed unnecessary columns

DATA <- DATA |>
  rename(date = period) |>
  select(-stateDescription, -sectorName,-`price-units`) |>
  mutate(price = as.numeric(price))
DATA

################################################################
# Assign proper year/month to the date variable

DATA <- DATA |>
  mutate(
    year = sub("-.*","",date),
    month = sub(".*-", "", date)
  )
DATA
str(DATA)

################################################################
# Save cleaned DATA file
saveRDS(DATA, here("data", "processed", "energy_data_cleaned.Rds"))


