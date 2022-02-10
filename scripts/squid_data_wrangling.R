# Script for wrangling squid catch data
# Created by Taylor Lockmann
# Data utilized from Bren 2022 Masters GP: Seal Bomb Squad
# Originally provided by CDFW
# 10 February 2022
####################################################


# Read in libraries
library(tidyverse)
library(here)

# Read in the .csv we want to use
raw_squid_data <- read.csv(here("data", "monthly_squid_catch_by_block.csv"))

# Now create a new data frame based on our original one, but filtered to exclude "block 0"
fishing_block_data <- raw_squid_data %>% 
  filter(cdfw_block_id != 0) %>% 
  mutate(catch_per_receipts = catch_lbs/catch_receipts) # Create a new column here that quantifies the lbs caught per receipt reported in each block/month

# Save this new dataframe as a .csv
write.csv(fishing_block_data, here("data", "fishing_effort_per_block.csv"))
