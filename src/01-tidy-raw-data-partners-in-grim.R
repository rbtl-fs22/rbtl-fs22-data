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

waste_single_bins <- read_csv(
  here::here("raw_data/partners-in-grime/2022-05-03_waste_characterisation_single_bins_raw_data.csv"))

waste_total_bins <- read_csv(here::here(
  "raw_data/partners-in-grime/2022-05-04_waste_characterisation_total_bins_raw_data.csv"))

survey_data <- read_csv(here::here("raw_data/partners-in-grime/2022-05-04_survey-data.csv"),
                        na = c(NA, "-"))

# tidy data ---------------------------------------------------------------


## waste characterisation ---------------

waste_data_tidy <- waste_total_bins %>% 
  # fix date
  mutate(day_of_collection = dmy(day_of_collection)) %>% 
  rowwise() %>% 
  # add variable other and calculate the difference between total and categories
  mutate(other = weight_total - sum(plastic_content_bottles,
                                    plastic_content_non_bottles,
                                    metal_content,
                                    glass_content,
                                    na.rm = TRUE)) %>% 
  # remove variables
  select(-sorting_id, -weight_total) %>% 
  # bring data into long format
  pivot_longer(cols = plastic_content_bottles:other,
               names_to = "category",
               values_to = "weight") %>% 
  # change NA value to 0
  mutate(weight = case_when(
    is.na(weight) == TRUE ~ 0,
    TRUE ~ weight
  )) %>% 
  # remove _content string from values in category variable
  mutate(category = str_remove(category, "_content"))

## survey data -----------------

## for factor variable
levels_likert <-  c("Very satisfied", 
                    "Satisfied", 
                    "Neither", 
                    "Dissatisfied", 
                    "Very dissatisfied",
                    "prefer not to say")

# convert several likert scale questions
# support from: https://stackoverflow.com/a/51949987/6816220

survey_data_tidy <- survey_data %>% 
  mutate(id = seq(1:n())) %>% 
  relocate(id) %>% 
  mutate(date_started = dmy(`Date Started`)) %>% 
  relocate(date_started, .after = id) %>% 
  select(-`Date Started`) %>% 
  mutate_at(.vars = vars(residence_distance, zurisack), 
            .funs = funs(case_when(.== 1 ~ "Very dissatisfied",
                                   .== 2 ~ "Dissatisfied",
                                   .== 3 ~ "Neither",
                                   .== 4 ~ "Satisfied",
                                   .== 5 ~ "Very satisfied",
                                   TRUE ~ "prefer not to say"))) %>% 
  mutate_at(.vars = vars(starts_with("price")),
            .funs = funs(case_when(
              . == "5-10" ~ "7.5",
              str_detect(., pattern = "20") ~ "20",
              str_detect(., pattern = "comment") ~ NA_character_,
              TRUE ~ .))) %>%  
  mutate_at(.vars = vars(starts_with("price")),
            .funs = funs(as.numeric(.))) 

survey_data_tidy_long <- survey_data_tidy %>% 
  pivot_longer(cols = starts_with("price"),
              names_to = "price_question",
              values_to = "price_value") 

# write data --------------------------------------------------------------

write_csv(x = waste_data_tidy, 
          file = "derived_data/partners-in-grime/waste-characterisation-data-tidy.csv")

write_csv(x = survey_data_tidy, 
          file = "derived_data/partners-in-grime/survey-data-tidy.csv")

write_csv(x = survey_data_tidy_long, 
          file = "derived_data/partners-in-grime/survey-data-tidy-long.csv")
