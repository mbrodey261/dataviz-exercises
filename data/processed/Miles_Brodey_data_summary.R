################################################################
# Script Name:
# Author:
# GitHub:
# Date Created:
#
# Purpose: This script ...
#
################################################################

################################################################
# Note: When sourcing script files, if you do not want objects
# available in this script, use the source() function along with
# the local = TRUE argument. By default, source() will make
# objects available in the current environment.
library(dplyr)
library(here)
library(readr)
library(eia)
################################################################
# Read in cleaned DATA file
DATA <- readRDS(here("data", "processed", "energy_data_cleaned.Rds"))

################################################################
# Find the average price by sector (over all time)

total_avg_by_sector <- DATA |>
  group_by(sectorid) |>
  summarise(avg_price =mean(price, na.rm = TRUE))
total_avg_by_sector

################################################################
# Use across to find avg, min, and max for both sectors (all time)
sector_summary <- DATA %>%
  group_by(sectorid) %>%
  summarise(
    across(
      .cols = price,                  
      .fns = list(
        avg = ~mean(.x, na.rm = TRUE),
        min = ~min(.x, na.rm = TRUE),
        max = ~max(.x, na.rm = TRUE)
      )
    ),
    .groups = "drop"
  )
sector_summary

################################################################
# Average price by sector per year
# Unit column removed ; UNITS = Cents/kWh
avg_by_sector_ind <- DATA |>
  group_by(sectorid, year) |>
  summarise(avg_price_each = mean(price, na.rm=TRUE), .groups = "drop")
avg_by_sector_ind
View(avg_by_sector_ind)

################################################################
# Save cleaned  + summarized DATA file
saveRDS(DATA, here("data", "processed", "energy_data_clean_summary.Rds"))


