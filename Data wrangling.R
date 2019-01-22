# Data wrangling for fish condition analysis

library(tidyverse)

devtools::install_github("HakaiInstitute/hakai-api-client-r", subdir='hakaiApi')

client <- hakaiApi::Client$new() # Follow stdout prompts to get an API token


# Make a data request for chlorophyll data

endpoint <- sprintf("%s/%s", client$api_root, "eims/views/output/chlorophyll?limit=-1")
chla <- client$get(endpoint)

write.csv(chla, here("read_data", "chla.csv"))

library(here)

fish_endpoint <- sprintf("%s/%s", client$api_root,'eims/views/output/jsp_fish?work_area%26%26{"QUADRA"}&limit=-1')
fish <-client$get(fish_endpoint)

write.csv(fish, here("read_data", "fish.csv"))

write.csv(tidy_gsi, here::here("read_data", "tidy_gsi.csv"))



