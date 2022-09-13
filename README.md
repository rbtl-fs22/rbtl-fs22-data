# README

This repository contains all raw and derived data produced as part of the ETH Zurich course "Research Beyond the Lab: Open Science and Research Methods for a Global Engineer" (151-8102-00L) offered in spring term 2022. 

Students were assigned teams of four to conduct a collaborative research project broadly addressing the theme of “Trash in the Public Spaces of Zurich” in collaboration with [Entsorgung & Recycling Zürich (ERZ)](https://www.stadt-zuerich.ch/ted/de/index/entsorgung_recycling.html), the waste management department at Stadt Zürich.

Research methods and design are taught in the first half of the course. Surveys and a waste characterisation study are then designed based on the research questions students have developed in their respective teams. The collected raw data is used in the course to teach principles of research data management, tidy data structures, reproducible research with R & RStudio, and collaboration and version control with Git & GitHub.

The teams work together to submit a final project report using the tools above. The following websites show research project reports that were published publicly by individual students after completion of the course:

- to be added

## `raw_data`

This directory contains the raw data as it was collected. The raw data was added without any modification and scripts in `data/src/` were used to prepare analysis-ready data in `/data/derived_data/`.  Sub-directories are structured by team in rbtl-fs22.

### `raw_data/TEAM_NAME`

Survey data (UserResponses.csv) are downloaded as a CSV from [SelectSurvey](https://selectsurvey.ethz.ch/), a tool offered by ETH Zurich. Waste characterisation data tables were created by students. 

## `derived_data`

This directory contains analysis-ready data that has been cleaned using scripts in `/data/src/`. Sub-directories are structured by team in rbtl-fs22.

### `derived_data/TEAM_NAME/metadata/`

This directory contains metadata for the tidy datasets. 

**README.md**

General metadata is stored in a `README.md` file that is contained in the `/metadata` folder. It is a template adapted from a [guide shared by Cornell University](https://data.research.cornell.edu/content/readme) and recommended for use by ETH Library under [Guidance and instructions for the ETH Zurich DMP template - Section 1: Data collection and documentation - 1.3 What documentation and metadata will you provide with the data? - Supporting resources](https://documentation.library.ethz.ch/display/DD/Data+Management+Plan+Instructions+for+ETH+Zurich+Researchers).

**`attributes.csv`**  

In addition to the human readable README with a description of the data, a codebook was generated that describes the variables and values, following general metadata standards (e.g. schema.org metadata standards): 

| variableName | description                                             |
|--------------|---------------------------------------------------------|
| fileName     | the name of the input data file(s)                      |
| variableName | the name of the measured variable                       |
| description  | a written description of what that measured variable is |
| unitText     | the units the variable was measured in                  |


## `src`

This folder contains R scripts used to clean raw data (`raw_data`) of each team to produce analysis-ready data (`derived_data`) that is used for the write-up of student project reports.



