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

waste_sheet1 <- read_csv(
  here::here("data/raw_data/04-05-2022_rbtl_data_sheet1.csv"))

waste_sheet2 <- read_csv(here::here(
  "data/raw_data/04-05-2022_rbtl_data_sheet2.csv"))

## Survey data

survey_data_general <- read_csv(here::here("data/raw_data/UserResponses_general.csv"))
survey_data_recycling <- read_csv(here::here("data/raw_data/UserResponses_recycling.csv"))
survey_data_compost <- read_csv(here::here("data/raw_data/UserResponses_compost.csv"))


# tidy data ---------------------------------------------------------------

## Waste Characterisation data

### bring data together

waste_data <- bind_rows(waste_sheet1, waste_sheet2) 

### code seqeuence for tidying the data

waste_data_tidy <- waste_data %>% 
  # remove NAs 
  filter(!is.na(objid)) %>% 
  # fix date column 
  mutate(day_of_collection = dmy(day_of_collection)) %>% 
  # fix column name
  rename(non_recyclables_Kg = `non_recyclables_ Kg`) %>% 
  # remove summaries
  select(-recyclables_Kg, -weight_total_kg) %>% 
  # rename non recycblalbles to others
  rename(other = non_recyclables_Kg) %>% 
  # bring data from wide format into long format
  pivot_longer(cols = other:paper_Kg, 
               names_to = "category", 
               values_to = "weight") %>% 
  # add a variable to identify recyclable from non-recycblales
  mutate(type = case_when(
    category == "other" ~ "non_recyclable",
    TRUE ~ "recyclable")) %>% 
  # remove kg and content strings from values
  mutate(category = str_remove(category, pattern = "_Kg|_kg")) %>% 
  mutate(category = str_remove(category, pattern = "_content"))


## Survey data ----------------------------

### General data ----------------------

survey_data_general_tidy <- survey_data_general %>% 
  filter(!is.na(general_country)) %>% 
  mutate(id = seq(1:n())) %>%
  relocate(id) %>% 
  select(-`Date Started`)

### Recycling data -------------------------

### vectors for factor variables

levels_likert_recycling <- c("I do not use/buy", "never", "rarely", "sometimes", "very often", "always")

### general cleaning

survey_data_recycling_step1 <- survey_data_recycling %>% 
  filter(!is.na(recycling_PET_percentage)) %>% 
  mutate(id = seq(1:n())) %>%
  relocate(id) %>% 
  select(-`Date Started`) %>% 
  rename(recycling_plasticbottles_reasons = recycling_plasticbottles_reasons...13,
         recycling_plasticpackaging_reasons = recycling_plasticbottles_reasons...15) 

### bring questions about recycling into long format

survey_data_recycling_percentage <- survey_data_recycling_step1 %>% 
  select(id, ends_with("percentage")) %>% 
  mutate(across(where(is.double), as.character)) %>% 
  pivot_longer(cols = !id, names_to = "question", values_to = "response") %>% 
  mutate(question = str_remove(question, pattern = "_percentage")) %>% 
  mutate(question = str_remove(question, pattern = "recycling_")) %>% 
  mutate(response = case_when(
    str_detect(response, pattern = "I do not use/buy") ~ "I do not use/buy",
    response == "1" ~ "never",
    response == "2" ~ "rarely",
    response == "3" ~ "sometimes",
    response == "4" ~ "very often",
    response == "5" ~ "always"
  )) %>% 
  mutate(recycling = factor(response, levels = levels_likert_recycling)) %>% 
  select(-response)


### bring questions about reasons into long format

survey_data_recycling_reasons <- survey_data_recycling_step1 %>% 
  select(id, ends_with("reasons")) %>%
  pivot_longer(cols = !id, names_to = "question", values_to = "response") %>% 
  mutate(question = str_remove(question, pattern = "_reasons")) %>% 
  mutate(question = str_remove(question, pattern = "recycling_")) %>% 
  mutate(reason = case_when(
    str_detect(response, pattern = "I did not know one could recycle") ~ "I did not know one could recycle it",
    TRUE ~ response)) %>% 
  select(-response) 

### bring questions about recycling behaviour and reasons together

survey_data_recycling_tidy <- survey_data_recycling_percentage %>% 
  left_join(survey_data_recycling_reasons) 

### Compost data --------------------------

### levels for likert scale

levels_likert_compost <- c("I don't produce organic waste", "never", "rarely", "sometimes", "very often", "always")

survey_data_compost_tidy <- survey_data_compost %>% 
  filter(!is.na(compost_separation_frequency)) %>% 
  mutate(id = seq(1:n())) %>%
  relocate(id) %>% 
  select(-`Date Started`) %>% 
  mutate(compost_separation_frequency = case_when(
    compost_separation_frequency == "1" ~ "never",
    compost_separation_frequency == "2" ~ "rarely",
    compost_separation_frequency == "3" ~ "sometimes",
    compost_separation_frequency == "4" ~ "very often",
    compost_separation_frequency == "5" ~ "always",
    TRUE ~ compost_separation_frequency
  )) %>% 
  mutate(compost_separation_frequency = factor(compost_separation_frequency,
                                               levels = levels_likert_compost)) 

# write data --------------------------------------------------------------

write_csv(x = waste_data_tidy, 
          file = "data/tidy_data/waste-characterisation-data-tidy.csv")

write_csv(x = survey_data_recycling_tidy,
          file = "data/tidy_data/survey-data-recycling-tidy.csv")

write_csv(x = survey_data_general_tidy,
          file = "data/tidy_data/survey-data-general-tidy.csv")

write_csv(x = survey_data_compost_tidy,
          file = "data/tidy_data/survey-data-compost-tidy.csv")

