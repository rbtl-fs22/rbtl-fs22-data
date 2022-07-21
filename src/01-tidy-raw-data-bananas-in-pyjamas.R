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

waste_data <- read_csv2(here::here("data/raw_data/2022-04-07_waste_characterisation_clean.csv")) 

survey_data <- read_csv(here::here("data/raw_data/UserResponses.csv")) 

# tidy data ---------------------------------------------------------------

## waste characterisation data

waste_data_step1 <- waste_data %>% 
  select(-...6) %>% 
  filter(!is.na(bag_nr)) %>% 
  mutate(other = kg_total - (kg_glass + kg_metal))

waste_data_tidy <- waste_data_step1 %>% 
  select(-kg_total, -nr_cans) %>% 
  pivot_longer(cols = !bag_nr,
               names_to = "category",
               values_to = "weight") %>% 
  mutate(category = str_remove(category, "kg_"))

waste_data_cans_tidy <- waste_data_step1 %>% 
  select(bag_nr, nr_cans)

## survey data

# repeated a variable name

survey_data_tidy <- survey_data %>% 
  mutate(date = dmy(`Date Started`)) %>% 
  mutate(id = seq(1:n())) %>% 
  relocate(id, date) %>% 
  select(-`Date Started`, -...8, -...10, -...12, -...14, -...16, -...18) %>% 
  separate(visible_close...7, into = c("visible_close1", "visible_close2"), sep = ";") %>% 
  separate(visible_close...9, into = c("visible_far1", "visible_far2"), sep = ";") %>% 
  separate(invisible_close, into = c("invisible_close1", "invisible_close2"), sep = ";") %>% 
  separate(invisible_close_unknown, into = c("invisible_close_unknown1", "invisible_close_unknown2"), sep = ";") %>% 
  separate(invisible_far, into = c("invisible_far1", "invisible_far2"), sep = ";") %>% 
  separate(invisible_far_unknown, into = c("invisible_far_unknown1", "invisible_far_unknown2"), sep = ";") %>% 
  pivot_longer(cols = visible_close1:invisible_far_unknown2,
               names_to = "question",
               values_to = "answer") %>% 
  separate(answer, into = c("answer", "category"), sep = " = ") %>% 
  # respondent id 10 did not respond to all questions.
  # un-answered questions are removed
  filter(!is.na(category)) %>% 
  mutate(question = str_remove(question, pattern = "1|2")) %>% 
  relocate(category, .after = "question") %>% 
  mutate(answer_short = case_when(
    str_detect(answer, "I would throw") ~ "bin",
    str_detect(answer, "decide to") ~ "bin+",
    str_detect(answer, "I would walk") ~ "rcp",
    str_detect(answer, "is, walk") ~ "rcp+",
    str_detect(answer, "later") ~ "takeaway",
    str_detect(answer, "Other") ~ "other",
  ))


survey_data_tidy_general <- survey_data_tidy %>% 
  select(id:self_filled) %>% 
  unique()

survey_data_tidy_behaviour <- survey_data_tidy %>% 
  select(id, question, category, answer, answer_short)


# write data --------------------------------------------------------------

## waste characterisation

write_csv(x = waste_data_tidy,
          file = here::here("data/tidy_data/waste-characterisation-data-tidy.csv"))

write_csv(x = waste_data_cans_tidy,
          file = here::here("data/tidy_data/waste-characterisation-data-cans-tidy.csv"))

## survey data

write_csv(x = survey_data_tidy_general,
          file = here::here("data/tidy_data/survey-data-general-tidy.csv"))


write_csv(x = survey_data_tidy_behaviour,
          file = here::here("data/tidy_data/survey-data-behaviour-tidy.csv")) 

## plot suggestion

survey_data_tidy %>% 
  count(gender, question, category, answer) %>% 
  
  ggplot(aes(x = answer, y = n, fill = category)) +
  geom_col() +
  facet_grid(gender ~ question) +
  coord_flip()


survey_data_tidy_behaviour %>% 
  count(question, category, answer_short) %>% 
  
  ggplot(aes(x = answer_short, y = n, fill = category)) +
  geom_col() +
  facet_wrap(~question) +
  coord_flip()

