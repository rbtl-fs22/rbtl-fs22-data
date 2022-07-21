# description -------------------------------------------------------------

# This is an R file. It will be edited by the course coordinators. As an R
# file it only contains R code. All text is added as comments starting with 
# the hash # sign at the beginning of the line. It is one big code-chunk if
# you imagine an R Markdown or Quarto file that combined code and text.

# -------------------------------------------------------------------------

# load packages -----------------------------------------------------------

library(tidyverse)
library(lubridate)

# import data -------------------------------------------------------------

## Waste characterisation

waste_bellevue <- read_delim(
  here::here("data/raw_data/rbtl_fs22_waste_composition_bellevue.csv"), 
  delim = ";")

waste_bellevue_attr <-  read_delim(
  here::here("data/raw_data/rbtl_fs22_waste_composition_bellevue_attributes.csv"),
  delim = ";"
)

waste_cigs <- read_delim(
  here::here("data/raw_data/rtbl_fs22_cigarets_in_bin_bellevue.csv"),
  delim = ";")

waste_cigs_attr <- read_delim(
  here::here("data/raw_data/rtbl_fs22_cigarets_in_bin_bellevue_attributes.csv"),
  delim = ";")

## Survey data

survey_data <- read_csv(here::here("data/raw_data/UserResponses.csv"))


# tidy data ---------------------------------------------------------------


## Waste bellevue

waste_bellevue_tidy <- waste_bellevue %>% 
  select(-weight_total) %>% 
  pivot_longer(cols = weight_paper:weight_others,
               names_to = "category",
               values_to = "weight") %>% 
  mutate(category = str_remove(category, pattern = "weight_"))

## Survey data

survey_data_step1 <- survey_data %>% 
  
  ## add response id
  mutate(id = seq(1:n())) %>% 
  ## fix date column
  mutate(date = dmy(`Date Started`)) %>% 
  select(-`Date Started`) %>% 
  relocate(date, id) %>% 
  ## fix willingnes_recycling variable
  mutate(willingnes_recycling_new = str_extract_all(
    string = willingnes_recycling,
    # https://stackoverflow.com/a/2811058/6816220
    # solution copied: ^[1-9][\.\d]*(,\d+)?$ and adapted
    pattern = "[0-9][\\.\\d)]*")) %>% 
  # https://community.rstudio.com/t/extract-elements-from-a-colum-with-lists/55937/2?u=larnsce
  rowwise() %>% 
  mutate(willingnes_recycling_new= as.numeric(willingnes_recycling_new[[2]])) %>% 
  mutate(willingnes_recycling_new = case_when(
    str_detect(willingnes_recycling, pattern = "km") == TRUE ~ willingnes_recycling_new * 1000,
    TRUE ~ willingnes_recycling_new
  )) %>% 
  select(-willingnes_recycling) %>% 
  rename(willingness_recycling = willingnes_recycling_new) %>% 
  relocate(willingness_recycling, .after = recyclable_in_bin_far)


# define levels for recycling bin type

recycling_bin_type_levels <-  c("don't know", "partially correct", "correct")

survey_data_tidy <- survey_data_step1 %>% 
  mutate(recycling_bin_type_cat = case_when(
    recycling_bin_type == "PET, Alu, Papers" ~ "correct",
    recycling_bin_type == "Don't know" ~ "don't know",
    TRUE ~ "partially correct"
  )) %>% 
  relocate(recycling_bin_type_cat, .after = recycling_bin_type)


# write data --------------------------------------------------------------

write_csv(x = waste_bellevue_tidy, 
          file = "data/tidy_data/waste-characterisation-data-bellevue-tidy.csv")

write_csv(x = waste_cigs,
          file = "data/tidy_data/waste-characterisation-data-cigarettes-tidy.csv")

write_csv(x = survey_data_tidy,
          file = "data/tidy_data/survey-data-tidy.csv")
